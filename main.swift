//
//  main.swift
//  SwiftDemoFinal
//
//  Created by Ricky on 8/12/23.
//
import Foundation



var BusDeck:[Card] = []
var board:[Card] = []
var currentPos: Int = 0
initializeGame()
play()



func welcomeMessage()
{
    print("Welcome to Ricky's Ride The Bus Game in Swift!")
}
func seeCards()
{
    for card in BusDeck
    {
        print(card.description())
    }
}

func SetBoard()
{
    board.append(BusDeck[0])
    board.append(BusDeck[1])
    board.append(BusDeck[2])
    board.append(BusDeck[3])
    BusDeck.removeFirst()
    BusDeck.removeFirst()
    BusDeck.removeFirst()
    BusDeck.removeFirst()
}

func initializeGame()
{
    BusDeck = Deck().DeckOfCards
    welcomeMessage()
    SetBoard()
}

func printPos()
{
    print("You are at card posistion \(currentPos)")
}


func guessHiLow() -> String
{
    print("The card on the board currently is \(board[currentPos].description())")
    print("Please guess higher or lower")
  
    if let str = readLine()
    {
    return str
    }
    else
    {
    return "No input"
    }
}

func guessColor() -> String
{
    print("Please guess the color of the next card.")
    if let str = readLine()
    {
    return str
    }
    else
    {
    return "No input"
    }
}

func guessSuit() -> String
{
    print("Please guess the suit of the next card.")
    if let str = readLine()
    {
    return str
    }
    else
    {
    return "No input"
    }
}
func hasWon() -> Bool
{
    if(currentPos > 3)
    {
        return true
    }
    else
    {
        return false
    }
}

func play()
{
   while hasWon()==false
    {
    checkDeck()
    printPos()
    turnLogic()
    }
    
    print("You Win !!!")
    print("Congratulations!")
    print("Thank you for playing ride the bus in Swift.")
}


func checkDeck()
{
    
    if(BusDeck.isEmpty)
    {
        print("You ran through the whole deck!")
        print("Refilling Deck!")
        BusDeck = Deck().DeckOfCards
    }
    
}

func clearStdout() {
    for _ in 1...100 {
        print("\n")
    }
}
    
func turnLogic()
{
    if (currentPos == 0 || currentPos == 1)
    {
    reactHiLow(input: guessHiLow())
    }
    else if (currentPos == 2)
    {
    reactColor(input: guessColor())
    }
    else if(currentPos == 3 )
    {
    reactSuit(input: guessSuit())
    }
}

func reactHiLow(input: String)
{
    let current: Int = board[currentPos].value
    board[currentPos] = BusDeck[0]
    BusDeck.removeFirst()
    let next: Int = board[currentPos].value
    clearStdout()
    print("The next card turned over was: \(board[currentPos].description())")
    
    if (input == "higher" || input == "Higher" || input == "h")
    {
        if (next>current)
        {
            print("Correct Guess!")
            print("Moving Up!")
            currentPos = currentPos+1
        }
        else if(next==current)
        {
            print("The next card had the same value. Staying in place.")
        }
        else
        {
            print("Incorrect Guess")
            if(currentPos==0)
            {
                print("Staying in place.")
            }
            else
            {
                print("Moving Back")
                currentPos = currentPos-1
            }
        }
    }
    if(input == "lower" || input == "Lower" || input == "l")
    {
        if (next<current)
        {
            print("Correct Guess!")
            print("Moving Up!")
            currentPos = currentPos+1
        }
        else if(next==current)
        {
            print("The next card had the same value. Staying in place.")
        }
        else
        {
            print("Incorrect Guess")
            if(currentPos==0)
            {
                print("You are still at posistion 0")
            }
            else
            {
                print("Moving Back")
                currentPos = currentPos-1
            }
        }
    }
}
    
    func reactColor(input: String)
    {
        board[currentPos] = BusDeck[0]
        BusDeck.removeFirst()
        clearStdout()
        print("The next card turned over was: \(board[currentPos].description())")
        
        if (input == "red" || input == "Red" || input == "r" || input == "R")
        {
            if (board[currentPos].suit == "Hearts" || board[currentPos].suit == "Diamonds")
            {
                print("Correct Guess!")
                print("Moving Up!")
                currentPos = currentPos+1
            }
            else
            {
                print("Incorrect Guess")
                print("Moving Back")
                currentPos = currentPos-1
            }
            }
        
       else if(input == "black" || input == "Black" || input == "b" || input == "B")
        {
           if (board[currentPos].suit == "Clubs" || board[currentPos].suit == "Spades")
            {
                print("Correct Guess!")
                print("Moving Up!")
                currentPos = currentPos+1
            }
            else
            {
                print("Incorrect Guess")
                print("Moving Back")
                currentPos = currentPos-1
            }
        }
        }
    func reactSuit(input: String)
    {
        board[currentPos] = BusDeck[0]
        BusDeck.removeFirst()
        clearStdout()
        print("The next card turned over was: \(board[currentPos].description())")
        
        if (input == board[currentPos].suit.lowercased())
            {
                print("Correct Guess!")
                currentPos = currentPos+1
            }
            else
            {
                print("Incorrect Guess")
                print("Moving Back")
                currentPos = currentPos-1
            }
    }
        
        
        

    
    
    
    

