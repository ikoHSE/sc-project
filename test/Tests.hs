module Tests
  ( tests,
  )
where

import Task
import Test.Hspec

tests :: Spec
tests = do
  it "Basic expression" $ do
    calculate "((1 + 2) * 3)" `shouldBe` Just 9
    calculate "1" `shouldBe` Just 1
    calculate "(((1 + 2) *3) +(1  +  1)   )" `shouldBe` Just 11
    calculate "(((1 + 2) *3) +(1  +  1)   " `shouldBe` Nothing
    calculate "1   + " `shouldBe` Nothing
    calculate "(1 / (8 - 8))" `shouldBe` Nothing
    calculate "(4 / 2)" `shouldBe` Just 2
  it "Complex expression" $ do
    calculate "if ( 1 = 2 )  then (2 + 4)  else 2" `shouldBe` Just 2
    calculate "(((1 + 2) *3) +( if ( 1 = 2 )  then (2 + 4)  else 2  +  1)   )" `shouldBe` Just 12
    calculate "(((1 + 2) *3) +( if  1 = 2 )  then (2 + 4)  else 2  +  1)   )" `shouldBe` Nothing
    calculate "(((1 + 2) *3) +( if ( 1 = 2 )  then (2 + 4)  else 2  +  1)" `shouldBe` Nothing
    calculate "(((1 + 2) *3) +( f ( 1 = 2 )  then (2 + 4)  else 2  +  1)   )" `shouldBe` Nothing
    calculate "(((1 + 2) *3) +( f ( 1 = 2 )  then (2 + 4)  +  1)   )" `shouldBe` Nothing
