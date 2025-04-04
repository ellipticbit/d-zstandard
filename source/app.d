import std.algorithm.searching;
import std.conv;
import std.datetime;
import std.file;
import std.path;
import std.process;
import std.stdio;
import std.string;

void main()
{
	string zstdPath = buildNormalizedPath(getcwd(), "zstd");
	writeln(i"[$((cast(TimeOfDay)Clock.currTime()).toISOExtString())] Update ZStandard Submodule Release Branch:".text);
	runCommand("git clean -fdx", getcwd());
	runCommand("git clean -fdx", zstdPath);
	runCommand("git reset --hard HEAD", zstdPath);

	//Build Windows static libraries for x86/x64.
	version(Windows) {
		string msbuildroot = "C:\\Program Files\\";
		version (X86_64) msbuildroot = "C:\\Program Files (x86)\\";

		string msbuildpath = "C:\\Program Files\\Microsoft Visual Studio\\2022\\Professional\\MSBuild\\Current\\Bin\\MSBuild.exe";
		if (!exists(msbuildpath)) {
			msbuildpath = "C:\\Program Files\\Microsoft Visual Studio\\2022\\Enterprise\\MSBuild\\Current\\Bin\\MSBuild.exe";
			if (!exists(msbuildpath)) {
				msbuildpath = msbuildroot ~ "Microsoft Visual Studio\\2019\\Enterprise\\MSBuild\\Current\\Bin\\MSBuild.exe";
				if (!exists(msbuildpath)) {
					msbuildpath = msbuildroot ~ "Microsoft Visual Studio\\2019\\Professional\\MSBuild\\Current\\Bin\\MSBuild.exe";
					if (!exists(msbuildpath)) {
						msbuildpath = msbuildroot ~ "Microsoft Visual Studio\\2017\\Enterprise\\MSBuild\\15.0\\Bin\\MSBuild.exe";
						if (!exists(msbuildpath)) {
							msbuildpath = msbuildroot ~ "Microsoft Visual Studio\\2017\\Professional\\MSBuild\\15.0\\Bin\\MSBuild.exe";
							if (!exists(msbuildpath)) {
								writeln("Unable to locate a suitable MSBuild.");
								return;
							}
						}
					}
				}
			}
		}

		string relx86buildparams = i"/verbosity:minimal /nologo /t:Build /p:Platform=Win32 /p:Configuration=Release /p:PlatformToolset=v142 /p:OutDir=\"$(buildNormalizedPath(getcwd(), "lib", "release", "win-x86"))\"".text;
		string relx64buildparams = i"/verbosity:minimal /nologo /t:Build /p:Platform=x64 /p:Configuration=Release /p:PlatformToolset=v142 /p:OutDir=\"$(buildNormalizedPath(getcwd(), "lib", "release", "win-x64"))\"".text;
		string debx86buildparams = i"/verbosity:minimal /nologo /t:Build /p:Platform=Win32 /p:Configuration=Debug /p:PlatformToolset=v142 /p:OutDir=\"$(buildNormalizedPath(getcwd(), "lib", "debug", "win-x86"))\"".text;
		string debx64buildparams = i"/verbosity:minimal /nologo /t:Build /p:Platform=x64 /p:Configuration=Debug /p:PlatformToolset=v142 /p:OutDir=\"$(buildNormalizedPath(getcwd(), "lib", "debug", "win-x64"))\"".text;
		writeln(i"[$((cast(TimeOfDay)Clock.currTime()).toISOExtString())] Build x86 Release Static Library:".text);
		runCommand(i"\"$(msbuildpath)\" \"$(buildNormalizedPath(zstdPath, "build", "VS2010", "libzstd", "libzstd.vcxproj"))\" $(relx86buildparams)".text, zstdPath);
		writeln(i"[$((cast(TimeOfDay)Clock.currTime()).toISOExtString())] Build x64 Release Static Library:".text);
		runCommand(i"\"$(msbuildpath)\" \"$(buildNormalizedPath(zstdPath, "build", "VS2010", "libzstd", "libzstd.vcxproj"))\" $(relx64buildparams)".text, zstdPath);
		writeln(i"[$((cast(TimeOfDay)Clock.currTime()).toISOExtString())] Build x86 Debug Static Library:".text);
		runCommand(i"\"$(msbuildpath)\" \"$(buildNormalizedPath(zstdPath, "build", "VS2010", "libzstd", "libzstd.vcxproj"))\" $(debx86buildparams)".text, zstdPath);
		writeln(i"[$((cast(TimeOfDay)Clock.currTime()).toISOExtString())] Build x64 Debug Static Library:".text);
		runCommand(i"\"$(msbuildpath)\" \"$(buildNormalizedPath(zstdPath, "build", "VS2010", "libzstd", "libzstd.vcxproj"))\" $(debx64buildparams)".text, zstdPath);
	}

	version(posix) {
		writeln(i"[$((cast(TimeOfDay)Clock.currTime()).toISOExtString())] Build x64 Static Library:".text);
		string outPath = buildNormalizedPath(getcwd(), "lib", "release", "posix-x64");

		runCommand("make lib", zstdPath);
		runCommand(i"mkdir -p $(outPath)".text, getcwd());
		runCommand(i"cp -f $(buildNormalizedPath(zstdPath, "lib", "libzstd.a")) $(outPath)".text, getcwd());
	}

	writeln(i"[$((cast(TimeOfDay)Clock.currTime()).toISOExtString())] Generate DI File for ZStandard:".text);
	alterHeader();

	version(Windows) {
		string vcvarspath = buildNormalizedPath(dirName(msbuildpath), "..\\..\\..\\", "VC", "Auxiliary", "Build", "vcvarsall.bat");
		runCommand(i"\"$(vcvarspath)\" x86_amd64 && dmd source/zstd.c -Hf=zstd.di -verrors=0 -main".text, getcwd());
	}
	version(posix) {
		runCommand("dmd source/zstd.c -Hf=zstd.di -verrors=0 -main", getcwd());
	}

	string dipath = buildNormalizedPath(getcwd(), "zstd.di");
	if (exists(dipath)) {
		alterDFile();
	}
}

private void alterHeader() {
	auto path = buildNormalizedPath(getcwd(), "zstd", "lib", "zstd.h");
	string result = string.init;

	auto hfilein = File(path, "r");
	foreach (line; hfilein.byLine()) {
		if (line.canFind("ZSTD_LIB_VERSION")) continue;
		if (line.canFind("ZSTD_QUOTE")) continue;
		if (line.canFind("ZSTD_EXPAND_AND_QUOTE")) continue;

		result ~= line ~ "\n";
	}
	hfilein.close();

	std.file.write(path, result);
}

private void alterDFile() {
	string diPath = buildNormalizedPath(getcwd(), "zstd.di");
	string result = string.init;

	auto difilein = File(diPath, "r");
	int c = 0;
	bool inBlock = false;
	int blocks = 0;
	bool hasCCtx = false;
	bool hasDCtx = false;
	foreach (line; difilein.byLine()) {
		//Skip the comment at the beginning of the file.
		if (c == 0) {
			c++;
			continue;
		}

		if (!inBlock) {
			// Work around DMD Issue 20911: https://github.com/dlang/dmd/issues/20911
			if (hasCCtx && line.canFind("struct ZSTD_CCtx_s")) continue;
			if (hasDCtx && line.canFind("struct ZSTD_DCtx_s")) continue;
			if (line.canFind("ZSTD_CCtx_s")) hasCCtx = true;
			if (line.canFind("ZSTD_DCtx_s")) hasDCtx = true;

			if (line.canFind("alias errno_t") || line.canFind("alias __uint32_t") || line.canFind("alias __uint64_t")) {
				result ~= line ~ "\n";
				continue;
			}

			if (line.canFind("ZSTD_") && !line.canFind(";")) {
				inBlock = true;
				blocks = 0;
			} else if (!line.canFind("ZSTD_")) continue;
		} else {
			if (line.canFind("{")) blocks++;
			if (line.canFind("}")) blocks--;

			if (blocks <= 0) {
				inBlock = false;
				blocks = 0;
			}
		}

		result ~= line ~ "\n";
	}
	difilein.close();

	auto output = File(diPath, "w");
	output.writeln("module zstd;");
	output.writeln("public:");
	output.writeln();
	output.writeln("extern (C)");
	output.writeln("{");
	output.write(result);
	output.writeln("}");
	output.flush();
	output.close();
}

private void runCommand(string command, string workDir) {
	writeln(command);
	auto gitpid = pipeShell(command, Redirect.all, null, Config.none, workDir);
	wait(gitpid.pid);
	foreach (line; gitpid.stdout.byLine) writeln(i"$(line)".text);
	foreach (line; gitpid.stderr.byLine) writeln(i"$(line)".text);
	writeln();
}
