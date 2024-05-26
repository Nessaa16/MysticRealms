//
//  TrollForest.swift
//  AFL2_0706012210045
//
//  Created by student on 05/04/24.
//

import Foundation

class TrollForest {
    let enemyFactory = EnemyFactory()
    let character = Character()

    func startBattle() {
        var enemy = enemyFactory.generateRandomEnemy() 
        print("As you enter the forest, you feel a sense of unease wash over you. Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a \(enemy.name) emerging from the shadows. It looks angry and ready to attack you.")
        print(" ")
        print("Name: \(enemy.name)")
        
        var shieldActive = false
        
        while enemy.healthPoints > 0 {
            if !shieldActive {
                let enemyDamage = enemy.attack()
                print("The \(enemy.name) attacks you with \(enemyDamage) damage!")
                character.playerHP -= enemyDamage
                if character.playerHP <= 0 {
                    print("Ohhh no!! young adventure, you have been defeated by the \(enemy.name)! :(")
                    break
                }
            } else {
                print("Your Shield blocks the \(enemy.name)'s attack!")
                shieldActive = false
            }
            print("\(enemy.name) Health: \(enemy.healthPoints)")
            print(" ")
            print("Choose your action: ")
            print("1. Physical Attack. No mana required. Deal 5pt of damage.")
            print("2. Meteor. Use 15pt of MP. Deal 50pt of damage.")
            print("3. Shield. Use 10pt of MP. Block enemy's attack for 1 turn.")
            print(" ")
            print("4. Use Potion to heal wound or Elixir to replenish MP.")
            print("5. Scan enemy's vital.")
            print("6. Flee from battle.")
            print("Your choice? ")
            if let actionChoice = readLine(), let choice = Int(actionChoice) {
                switch choice {
                case 1:
                    print("You chose to perform a Physical Attack.")
                    var damage = 5
                    if character.enemyVitalScanned {
                        damage += 10
                    }
                    enemy.healthPoints -= damage
                    if enemy.healthPoints <= 0 {
                        print("Horayy! You have defeated the \(enemy.name)!")
                        print("You gain 10 coins!")
                        character.playerCoins += 10
                        break
                    }
                case 2:
                    if character.playerMP >= 15 {
                        print("You chose to cast Meteor.")
                        var damage = 50
                        if character.enemyVitalScanned {
                            damage += 10
                        }
                        enemy.healthPoints -= damage
                        character.playerMP -= 15
                        if enemy.healthPoints <= 0 {
                            print("Horayy! You have defeated the \(enemy.name)!")
                            print("You gain 10 coins!")
                            character.playerCoins += 10
                            break
                        }
                    } else {
                        print("You do not have enough MP to cast Meteor.")
                    }
                case 3:
                    if character.playerMP >= 10 {
                        print("You chose to cast Shield.")
                        print("You create a protective shield around yourself.")
                        character.playerMP -= 10
                        shieldActive = true
                    } else {
                        print("You do not have enough MP to cast Shield.")
                    }
                case 4:
                    print("Redirecting to the healing and elixir screen...")
                    character.healWounds()
                    character.useElixir()
                    continue
                case 5:
                    if !character.enemyVitalScanned {
                        print("You chose to scan the enemy's vital.")
                        character.enemyVitalScanned = true
                        print("You have discovered the weak point of the \(enemy.name). Your attacks will deal more damage in the next round!")
                    } else {
                        print("You have already scanned the enemy's vital. You can only do this once per battle.")
                    }
                case 6:
                    print("You chose to flee from battle because you feel that if you don't escape soon, you won't be able to continue the fight. You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in  your chest.")
                    print(" ")
                    print("It seems like you're not a brave adventurer after all. The master disappointed with you. You failed to complete your mission. :(")
                    print("Press [return] to end your journey.")
                    let _ = readLine()
                    return
                default:
                    print("Invalid choice.")
                    continue
                }
            } else {
                print("Invalid input.")
                continue
            }
        }
    }
}
