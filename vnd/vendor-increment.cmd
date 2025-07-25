@echo off

set oldVer=%1
set newVer=%2
if "%oldVer%" == "" (
    echo Old version must be specified.
    exit /b 1
)
if "%newVer%" == "" (
    echo New version must be specified to replace old version "%oldVer%".
    exit /b 1
)

set ROOTDIR=%~dp0..

REM This script replaces old version with new version.
echo Replacing...

REM Change the below files
set "releaseFiles="%ROOTDIR%\PKGBUILD-REL" "%ROOTDIR%\.github\workflows\build-ppa-package-with-lintian.yml" "%ROOTDIR%\.github\workflows\build-ppa-package.yml" "%ROOTDIR%\.github\workflows\pushamend.yml" "%ROOTDIR%\.github\workflows\pushppa.yml" "%ROOTDIR%\.gitlab\workflows\release.yml" "%ROOTDIR%\CHANGES.TITLE""
for %%f in (%releaseFiles%) do (
    echo Processing %%f...
    powershell -Command "& '%ROOTDIR%\vnd\eng\incrementor.ps1' '%%f' '%oldVer%' '%newVer%'"
)

REM Add Debian changelogs info
echo Changing Debian changelogs info
powershell -Command "& '%ROOTDIR%\vnd\eng\debian-changes.ps1' '%ROOTDIR%\debian\changelog' '%newVer%'"
