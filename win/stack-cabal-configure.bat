@echo off

for /F "usebackq" %%t in (`stack path --snapshot-pkg-db`) do set SNAPSHOT_PKG_DB_ORIG=%%t
for /F "usebackq" %%t in (call :fix %SNAPSHOT_PKG_DB_ORIG%) do set SNAPSHOT_PKG_DB=%%t

for /F "usebackq" %%t in (`stack path --local-pkg-db`) do set LOCAL_PKG_DB_ORIG=%%t
for /F "usebackq" %%t in (call :fix %LOCAL_PKG_DB_ORIG%) do set LOCAL_PKG_DB=%%t

for /F "usebackq" %%t in (`stack path --bin-path`) do set BIN_PATH_ORIG=%%t
for /F "usebackq" %%t in (call :fix %BIN_PATH_ORIG%) do set BIN_PATH=%%t

set PATH=%BIN_PATH%
set LANG=C

cabal configure --package-db=clear --package-db=global --package-db=%SNAPSHOT_PKG_DB% --package-db=%LOCAL_PKG_DB%

:fix

SET REP_C=%1::C:=;C:%
SET REP_D=%REP_C::D:=;D:%
echo %REP_D%

exit /b
