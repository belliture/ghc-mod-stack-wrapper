{-# LANGUAGE OverloadedStrings #-}
module Main where

import qualified Data.Text          as T
import           System.Environment (setEnv)
import           System.Exit        (exitWith)
import           System.Process     (rawSystem, readProcess)

main :: IO ()
main = do
    binPath <- readProcess "stack" ["path", "--bin-path"] ""
    snapshotPkgDb <- readProcess "stack" ["path", "--snapshot-pkg-db"] ""
    localPkgDb <- readProcess "stack" ["path", "--local-pkg-db"] ""
    setEnv "PATH" $ fix binPath
    code <- rawSystem "cabal"
        [ "configure"
        , "--package-db=clear"
        , "--package-db=global"
        , "--package-db=" ++ fix' snapshotPkgDb
        , "--package-db=" ++ fix' localPkgDb
        ]
    exitWith code

dropCRLF :: T.Text -> T.Text
dropCRLF = T.replace "\r" "" . T.replace "\n" ""

fix :: String -> String
fix = T.unpack . d' . c' . T.replace ":" ";" . d . c . dropCRLF . T.pack
  where
    c = T.replace "C:" "C#"
    c' = T.replace "C#" "C:"
    d = T.replace "D:" "D#"
    d' = T.replace "D#" "D:"

fix' :: String -> String
fix' = T.unpack . dropCRLF . T.pack
