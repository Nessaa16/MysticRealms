//
//  enemy.swift
//  AFL2_0706012210045
//
//  Created by student on 05/04/24.
//

import Foundation

protocol Enemy {
    var name: String { get }
    var healthPoints: Int { get set }

    func attack() -> Int
}

protocol Enemy2 {
    var name: String { get }
    var healthPoints: Int { get set }

    func attack() -> Int
}

class EnemyFactory {
    
    func generateRandomEnemy() -> Enemy {
        let enemies: [Enemy] = [Troll(), Goblin(), Chikipi(), BigChikipi()]
        let randomIndex = Int.random(in: 0..<enemies.count)
        return enemies[randomIndex]
    }

    func generateRandomEnemy2() -> Enemy2 {
        let enemies2: [Enemy2] = [Golem(), MegaGolem(), Snowman(), Jewry()]
        let randomIndex2 = Int.random(in: 0..<enemies2.count)
        return enemies2[randomIndex2]
    }
    
    struct Troll: Enemy {
        var name: String = "Troll"
        var healthPoints: Int = 100

        func attack() -> Int {
            return Int.random(in: 3...8)
        }
    }

    struct Golem: Enemy2 {
        var name: String = "Golem"
        var healthPoints: Int = 150

        func attack() -> Int {
            return Int.random(in: 6...10)
        }
    }

  struct Snowman: Enemy2 {
      var name: String = "Snowman"
      var healthPoints: Int = 120

      func attack() -> Int {
          return Int.random(in: 3...10)
      }
  }

  struct MegaGolem: Enemy2 {
      var name: String = "Mega Golem"
      var healthPoints: Int = 230

      func attack() -> Int {
          return Int.random(in: 16...20)
      }
  }

  struct Goblin: Enemy {
      var name: String = "Goblin"
      var healthPoints: Int = 60

      func attack() -> Int {
          return Int.random(in: 12...15)
      }
  }

  struct Chikipi: Enemy {
      var name: String = "Chikipi"
      var healthPoints: Int = 30

      func attack() -> Int {
          return Int.random(in: 4...7)
      }
  }

  struct BigChikipi: Enemy {
      var name: String = "Big Chikipi"
      var healthPoints: Int = 100

      func attack() -> Int {
          return Int.random(in: 9...16)
      }
  }

  struct Jewry: Enemy2 {
      var name: String = "Jewry"
      var healthPoints: Int = 100

      func attack() -> Int {
          return Int.random(in: 20...32)
      }
  }
}
