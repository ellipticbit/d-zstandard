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

		writeln(i"[$((cast(TimeOfDay)Clock.currTime()).toISOExtString())] Generate DI File for ZStandard:".text);
		string vcvarspath = buildNormalizedPath(dirName(msbuildpath), "..\\..\\..\\", "VC", "Auxiliary", "Build", "vcvarsall.bat");
		applyHeaderWorkarounds();
		runCommand(i"\"$(vcvarspath)\" x86_amd64 && dmd source/zstd_win.c -Hf=zstd.di -verrors=0 -main".text, getcwd());
	}

	version(linux) {
		version(x86) {
		writeln(i"[$((cast(TimeOfDay)Clock.currTime()).toISOExtString())] Build x86 Static Library:".text);
		string outPath = buildNormalizedPath(getcwd(), "lib", "release", "linux-x86");
		}
		version(X86_64) {
		writeln(i"[$((cast(TimeOfDay)Clock.currTime()).toISOExtString())] Build x64 Static Library:".text);
		string outPath = buildNormalizedPath(getcwd(), "lib", "release", "linux-x64");
		}

		runCommand("make", zstdPath);
		runCommand(i"mkdir -p $(outPath)".text, getcwd());
		runCommand(i"cp -f $(buildNormalizedPath(zstdPath, "lib", "libzstd.a")) $(outPath)".text, getcwd());

		writeln(i"[$((cast(TimeOfDay)Clock.currTime()).toISOExtString())] Generate DI File for ZStandard:".text);
		applyHeaderWorkarounds();
		runCommand("dmd source/zstd_posix.c -Hf=zstd.di -verrors=0 -main", getcwd());
	}

	string dipath = buildNormalizedPath(getcwd(), "zstd.di");
	if (exists(dipath)) {
		string difilein = readText(dipath);
		difilein = difilein.replace("\r\n", "\n")
			.replace("\tconst ZSTD_CCtx_s*", "\tconst(ZSTD_CCtx_s*)")
			.replace("\tconst ZSTD_DCtx_s*", "\tconst(ZSTD_DCtx_s*)")
			.replace("\tconst ZSTD_CDict_s*", "\tconst(ZSTD_CDict_s*)")
			.replace("\tconst ZSTD_DDict_s*", "\tconst(ZSTD_DDict_s*)");
		auto difileout = difilein.split('\n');

		//Work around ImportC generating these lines multiple times.
		int c_ctr = 0;
		int d_ctr = 0;
		for (int i = 0; i < difileout.length; i++) {
			if (difileout[i].strip().toUpper() == "struct ZSTD_CCtx_s;".toUpper()) {
				if (c_ctr > 0) difileout[i] = "\t//struct ZSTD_CCtx_s;";
				c_ctr++;
			}
			if (difileout[i].strip().toUpper() == "struct ZSTD_DCtx_s;".toUpper()) {
				if (d_ctr > 0) difileout[i] = "\t//struct ZSTD_DCtx_s;";
				d_ctr++;
			}
		}

		auto difile = File(buildNormalizedPath(getcwd(), "zstd.di"), "w");
		difile.writeln("module zstd;");
		difile.writeln("nothrow:");
		difile.writeln("@nogc:");
		difile.writeln();
		difile.writeln(difileout.join('\n'));
		difile.flush();
		difile.close();
	}
}

private void runCommand(string command, string workDir) {
	writeln(command);
	auto gitpid = pipeShell(command, Redirect.all, null, Config.none, workDir);
	wait(gitpid.pid);
	foreach (line; gitpid.stdout.byLine) writeln(i"$(line)".text);
	foreach (line; gitpid.stderr.byLine) writeln(i"$(line)".text);
	writeln();
}

private void applyHeaderWorkarounds() {
	auto path = buildNormalizedPath(getcwd(), "zstd", "lib", "zstd.h");
	std.file.write(path, readText(path).replace("#include <stddef.h>", "//#include <stddef.h>"));
}
