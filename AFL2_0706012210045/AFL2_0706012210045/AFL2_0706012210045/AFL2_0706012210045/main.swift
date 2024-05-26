//
//  main.swift
//  AFL2_0706012210045
//
//  Created by student on 05/04/24.
//

import Foundation

class Main {
    func main() {
        //playerstats
        var playerCoins = 100
        var potionTotal = 5
        var elixirTotal = 5
        
        let gameController = GameController()
        gameController.welcomeScreen()
        let playerName = gameController.journeyScreen()
        
        let shop = Shop()
        let character = Character()
        let characterType = CharacterTypeFactory()
        let trollForest = TrollForest()
        let golemForest = GolemForest()
        print(" ")
        print("Hello, \(playerName)! Let's start your adventure!")
        print(" ")
//        print("You have chosen \(characterType.name) as your character type.")
//        print("Here's your special reward: \(characterType.specialReward)")
        
        var continueJourney = true
        while continueJourney {
            let choice = String(gameController.menuScreen())
            switch choice {
            case "C":
                print("\nPlayer Name: \(playerName)")
                print(" ")
                character.showPlayerStats()
            case "H":
                character.healWounds()
            case "F":
                trollForest.startBattle()
            case "M":
                golemForest.startBattle2()
            case "S":
                shop.shopScreen(playerCoins: &playerCoins, potionTotal: &potionTotal, elixirTotal: &elixirTotal)
            case "Q":
                continueJourney = false
                print("Thank you, young adventure. It was a nice journey, I hope to see you come back again! :)")
            default:
                break
            }
        }
    }
}
let main = Main()
main.main()
