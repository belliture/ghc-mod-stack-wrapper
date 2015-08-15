@echo off

set PATH=%HOME%\AppData\Roaming\local\bin;%PATH%
stack exec -- ghc-mod %*

