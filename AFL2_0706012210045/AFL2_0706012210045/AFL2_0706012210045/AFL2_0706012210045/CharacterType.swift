//
//  CharacterType.swift
//  AFL2_0706012210045
//
//  Created by student on 05/04/24.
//

// Modify CharacterType.swift
import Foundation

protocol CharacterType {
    var name: String { get }
    var specialReward: String { get }
}

class CharacterTypeFactory {
    static func createWizard() -> CharacterType {
        return Wizard()
    }
    
    static func createWarrior() -> CharacterType {
        return Warrior()
    }
    
    static func createAssassin() -> CharacterType {
        return Assassin()
    }
    
    struct Wizard: CharacterType {
        let name: String = "Wizard"
        let specialReward: String = "150 MP"
    }
    
    struct Warrior: CharacterType {
        let name: String = "Warrior"
        let specialReward: String = "250 HP"
    }
    
    struct Assassin: CharacterType {
        let name: String = "Assassin"
        let specialReward: String = "300 coins"
    }
}

