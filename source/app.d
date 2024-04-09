import std.conv;
import std.datetime;
import std.file;
import std.path;
import std.process;
import std.stdio;

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

		string x86buildparams = i"/verbosity:minimal /nologo /t:Build /p:Platform=Win32 /p:Configuration=Release /p:PlatformToolset=v142 /p:OutDir=\"$(buildNormalizedPath(getcwd(), "lib", "win-x86"))\"".text;
		string x64buildparams = i"/verbosity:minimal /nologo /t:Build /p:Platform=x64 /p:Configuration=Release /p:PlatformToolset=v142 /p:OutDir=\"$(buildNormalizedPath(getcwd(), "lib", "win-x64"))\"".text;
		writeln(i"[$((cast(TimeOfDay)Clock.currTime()).toISOExtString())] Build x86 Static Library:".text);
		runCommand(i"\"$(msbuildpath)\" \"$(buildNormalizedPath(zstdPath, "build", "VS2010", "libzstd", "libzstd.vcxproj"))\" $(x86buildparams)".text, zstdPath);
		writeln(i"[$((cast(TimeOfDay)Clock.currTime()).toISOExtString())] Build x64 Static Library:".text);
		runCommand(i"\"$(msbuildpath)\" \"$(buildNormalizedPath(zstdPath, "build", "VS2010", "libzstd", "libzstd.vcxproj"))\" $(x64buildparams)".text, zstdPath);

		writeln(i"[$((cast(TimeOfDay)Clock.currTime()).toISOExtString())] Generate DI File for ZStandard:".text);
		string vcvarspath = buildNormalizedPath(dirName(msbuildpath), "..\\..\\..\\", "VC", "Auxiliary", "Build", "vcvarsall.bat");
		runCommand(i"\"$(vcvarspath)\" x86_amd64 && dmd source/zstd.c -Hf=zstd.di -verrors=0 -main".text, getcwd());
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