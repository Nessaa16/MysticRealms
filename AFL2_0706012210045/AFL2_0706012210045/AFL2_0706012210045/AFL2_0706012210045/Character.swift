//
//  character.swift
//  AFL2_0706012210045
//
//  Created by student on 05/04/24.
//
import Foundation

class Character {
    
        var playerHP = 100
        var playerMP = 50
        var potionTotal = 5
        var elixirTotal = 5
        var playerCoins = 100
        var enemyVitalScanned = false
        
        // Character type
        func chooseCharacterType() -> CharacterType? {
            print("Choose your character type:")
            print("1. Wizard")
            print("2. Warrior")
            print("3. Assassin")
            print("Enter the number of your choice:")
            
            while true {
                if let choice = readLine(), let characterChoice = choice.first {
                    switch characterChoice {
                    case "1":
                        playerMP += 150
                        return CharacterTypeFactory.createWizard()
                    case "2":
                        playerHP += 250
                        return CharacterTypeFactory.createWarrior()
                    case "3":
                        playerCoins += 300
                        return CharacterTypeFactory.createAssassin()
                    default:
                        print("Invalid choice. Please enter a number between 1 and 3.")
                    }
                } else {
                    print("Invalid input. Please enter a number.")
                }
            }
        }

    func healWounds() {
        var usingPotion = true
        while usingPotion {
            print("Your HP is now \(playerHP)/100")
            print("You have \(potionTotal) potions left.")
            if potionTotal > 0 {
                print("Are you sure you want to use 1 potion to heal a wound? [Y/N]")
                if let choice = readLine()?.uppercased() {
                    if choice == "Y" {
                        if playerHP < 100 {
                            let previousHP = playerHP
                            playerHP += 20
                            if playerHP > 100 {
                                playerHP = 100
                            }
                            let healedAmount = playerHP - previousHP
                            print("You have used 1 potion to heal a wound. Your HP is now \(playerHP)/100. (+\(healedAmount) HP)")
                            potionTotal -= 1
                        } else {
                            print("Your HP is already full.")
                        }
                    } else if choice == "N" {
                        print("You decided not to use the potion.")
                        usingPotion = false
                    } else {
                        print("Invalid input.")
                    }
                }
            } else {
                print("You have no potions left. Be careful on your next journey or you will die :(")
                usingPotion = false
            }
        }
        while true {
            if let choice = readLine()?.lowercased(), choice.isEmpty {
                print(" ")
                return
            } else {
                print("Invalid input.")
            }
        }
    }
    
    func useElixir() {
        var usingElixir = true
        while usingElixir {
            print("Your MP is now \(playerMP)/50")
            print("You have \(elixirTotal) elixirs left.")
            if elixirTotal > 0 {
                print("Are you sure you want to use 1 elixir to restore MP? [Y/N]")
                if let choice = readLine()?.uppercased() {
                    if choice == "Y" {
                        if playerMP < 50 {
                            let previousMP = playerMP
                            playerMP += 10
                            if playerMP > 50 {
                                playerMP = 50
                            }
                            let restoredAmount = playerMP - previousMP
                            print("You have used 1 elixir to restore your MP. Your MP is now \(playerMP)/50. (+\(restoredAmount) MP)")
                            elixirTotal -= 1
                        } else {
                            print("Your MP is already full.")
                        }
                    } else if choice == "N" {
                        print("You decided not to use the elixir.")
                        usingElixir = false
                    } else {
                        print("Invalid input.")
                    }
                }
            } else {
                print("You have no elixirs left.")
                usingElixir = false
            }
        }
        while true {
            if let choice = readLine()?.lowercased(), choice.isEmpty {
                print(" ")
                return
            } else {
                print("Invalid input.")
            }
        }
    }
    
    func showPlayerStats() {
        print("HP: \(playerHP)/100")
        print("MP: \(playerMP)/50")
        print("Player Coins: \(playerCoins)")
        print(" ")
        print("Magic:")
        print("- Physical Attack. Deals 5pt of damage. No mana required.")
        print("- Meteor. Uses 15pt of MP. Deals 50pt of damage.")
        print("- Shield. Uses 10pt of MP. Blocks enemy's attack for 1 turn.")
        print(" ")
        print("Items:")
        print("- Potion x \(potionTotal). Heals 20pt of your HP")
        print("- Elixir x \(elixirTotal). Adds 10pt of your MP")
    }
    
    func updatePlayerStats(attackDamage: Int, mpUsed: Int) {
        playerHP -= attackDamage
        playerMP -= mpUsed
        if playerHP < 0 {
            playerHP = 0
        }
        if playerMP < 0 {
            playerMP = 0
        }
    }
}
