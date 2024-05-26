//
//  Shop.swift
//  AFL2_0706012210045
//
//  Created by student on 05/04/24.
//

import Foundation

class Shop {
    func shopScreen(playerCoins: inout Int, potionTotal: inout Int, elixirTotal: inout Int) {
        print(" ")
        print("========== Welcome to the Enes Shop!!! ==========")
        print("Here are the list of our items :")
        print("1. Buy Potion (Heals 20 HP) - 10 coins")
        print("2. Buy Elixir (Adds 10 MP) - 20 coins")
        print("3. Leave Shop")
        print(" ")
        print("You have \(playerCoins) coins.")
        print(" ")
        
        while true {
            print("What would you like to do?")
            if let choice = readLine(), let option = Int(choice) {
                switch option {
                case 1:
                    if playerCoins >= 10 {
                        playerCoins -= 10
                        potionTotal += 1
                        print("You have purchased 1 Potion.")
                    } else {
                        print("Sorry, you don't have enough coins to buy a Potion.")
                    }
                case 2:
                    if playerCoins >= 20 {
                        playerCoins -= 20
                        elixirTotal += 1
                        print("You have purchased 1 Elixir.")
                    } else {
                        print("Sorry, you don't have enough coins to buy an Elixir.")
                    }
                case 3:
                    print("Goodbye. Enes will be waiting for you to come back again ^_^!")
                    return
                default:
                    print("Invalid input.")
                }
            } else {
                print("Invalid input. Please enter a number.")
            }
        }
    }
}
