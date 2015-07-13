module Main where

import System.Environment (getArgs)
import System.Exit        (exitWith)
import System.Process     (rawSystem)

main :: IO ()
main = do
    args <- getArgs
    code <- rawSystem "stack" (["exec", "--", "ghc-mod"] ++ args)
    exitWith code
