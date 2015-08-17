@echo off

set LOCAL_BIN=%HOME%\AppData\Roaming\local\bin
for /F "usebackq" %%t in (`%LOCAL_BIN%\ghc-mod root`) do set CABAL_DIR=%%t
for /F "usebackq" %%t in (`stack path --dist-dir`) do set STACK_DIST=%CABAL_DIR%\%%t
set DIST=%CABAL_DIR%\dist

if exist %STACK_DIST%\setup-config if not exist %DIST% (
    mklink /j %DIST% %STACK_DIST%
)

set PATH=%LOCAL_BIN%;%PATH%
stack exec ghc-modi -- %*

