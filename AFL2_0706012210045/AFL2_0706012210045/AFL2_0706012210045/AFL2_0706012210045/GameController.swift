//
//  gamecontroller.swift
//  AFL2_0706012210045
//
//  Created by student on 05/04/24.
//

import Foundation

class GameController {
    let player = Character()
    
    func welcomeScreen() {
        print("============ Welcome to The World of Abakadbra!!! ============")
        print("Let me tell you a little story first. You have been summoned to the world of Abakadbra by the King of the Abyss. You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of arcane arts. Your adventures will take you through forests, mountains, and dungeons, where you will face challenges, make allies, and fight enemies until you die :).")
        print("Good luck ^_^ !")
        print("Press [return] to continue...")
        
        while true {
            if let choice = readLine()?.lowercased(), choice.isEmpty {
                print(" ")
                return
            } else {
                print("Invalid input. Please don't input any numbers or symbols. Just enter a blank space as it's the return button")
            }
        }
    }
    
    func journeyScreen() -> String {
        while true {
            print("May I know your name, a young and brave adventure?")
            if let name = readLine(), !name.isEmpty, name.rangeOfCharacter(from: CharacterSet.letters.inverted) == nil {
                print("[Nice to meet you \(name)]")
                return name
            } else {
                print("Invalid input. Please enter alphabets only.")
            }
        }
    }
    
    func menuScreen() -> String {
        while true {
            print("\nMain Menu:")
            print("[C]heck your health, stats, and coins")
            print("[H]eal your wounds with potion")
            print("[F]orest of Troll (Normal)")
            print("[M]ountain of Golem (Hard)")
            print("[S]hop")
            print("[Q]uit game")
            print("So, what's your choice?")
            if let choice = readLine()?.uppercased(), choice.count == 1 {
                let validChoices: Set<String> = ["C", "H", "F", "M", "S", "Q"]
                if validChoices.contains(String(choice)) {
                    return String(choice)
                } else {
                    print("Invalid input.")
                }
            } else {
                print("Invalid input. Please enter a single character.")
            }
        }
    }
}
