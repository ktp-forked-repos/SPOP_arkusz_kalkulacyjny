import System.IO
import System.Exit
import System.Directory
import Data.List
import Text.Printf
import EdycjaArkusza
import Data.CSV
import Text.ParserCombinators.Parsec


version :: Float
version = 0.1

csvParsing 

main = do
  let result = parse csvFile "(unknown)" "row1,row2\nline2row1,line2row2\nline3row1,\n"
  :info result
  print result
  exitSuccess


  putStrLn "Welcome to Hexcel!"
  printf   "Wersja: %.2f\n" version
  putStrLn "Hexcel jest to uniwersalne rozwiązanie potrzebne w każdym domu!"
  putStrLn "Program zapisuje pliki w aktualnym katalogu z rozszerzeniem .hexcel"
  menu

menu = do
  putStrLn ""
  putStrLn "> menu główne"
  putStrLn "Wybierz jedną z poniższych opcji:"
  putStrLn " n - utwórz nowy arkusz"
  putStrLn " o - otwórz istniejący arkusz"
  putStrLn " u - usuń arkusz"
  putStrLn " w - wyświetl istniejące arkusze"
  putStrLn " x - exit"
  putStr   "$ "
  a <- getLine
  let w = if length a > 0 then (a !! 0) else ' '
  case w of
    'n' -> do 
      putStrLn "> Tworzenie nowego arkusza"
      putStrLn "Jeśli arkusz o podanej nazwie już istnieje, zostanie usunięty."
      putStrLn "Nazwa arkusza:"
      temp <- getLine
      let name = temp ++ ".hexcel"
      writeFile name ""
      putStrLn ("> Utworzono arkusz " ++ name)
      return 0
    'o' -> do 
      putStrLn "> Otwieranie arkusza"
      putStrLn "Nazwa arkusza:"
      temp <- getLine
      let name = temp ++ ".hexcel"
      -- edycja arkusza
      edycjaArkusza name
      return 0
    'u' -> do
      putStrLn "> Usuwanie arkusza"
      putStrLn "Nazwa arkusza:"
      temp <- getLine
      let name = temp ++ ".hexcel"
      removeFile name
      putStrLn ("> Arkusz " ++ name ++ "usunięty")
      return 0
    'w' -> do
      putStrLn "> Dostępne arkusze"
      allindirectory <- getDirectoryContents "."
      let filtered = filter (isSuffixOf ".hexcel") allindirectory
      print filtered
      return 0
    'x' -> do 
      putStrLn  "Bye Bye..."
      return 0
    _ -> do 
      putStrLn "Nieznana akcja"
      return 0
  if w /= 'x' then 
    menu
  else
    return 0

