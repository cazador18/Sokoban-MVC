//
//  Levels.swift
//  Sokoban
//
//  Created by Erzhan Kasymov on 20/9/22.
//

import Foundation

public class Levels {
    private var level: Int
    private var prefixFileName: String
    private var endFileName: String
    
    init(){
        level = 4
        prefixFileName = "levels/level"
        endFileName = ".sok"
        
        
    }
    
    public func nextLevel() -> [[Int]] {
      var desktop: [[Int]] = []
        switch level {
        case 1:
            desktop = getFirstLevel()
        case 2:
            desktop = getSecondLevel()
        case 3:
            desktop = getThirdLevel()
//        case 4:
//            desktop = CharacterReader(prefixFileName + level + endFileName)
//        case 5:
//            desktop = loadLeveFromFile(prefixFileName + level + endFileName)
//        case 6:
//            desktop = loadLeveFromFile(prefixFileName + level + endFileName)
        default:
            level = 1
            desktop = getFirstLevel()
        }
        level = level + 1
        return desktop
    }
    

    
//  private func loadLevelFromFile(fileName: String)-> [[Int]] {
//
//      try {
//          var unicode:Int
//          var index:Int = 0
//
//      }()
//
//
//
//
//      
//
//
//      }
    
    private func getFirstLevel() -> [[Int]] {
        let  array: [[Int]] = [
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
            [2, 0, 0, 0, 0, 0, 0, 0, 0, 2],
            [2, 0, 0, 0, 0, 0, 0, 3, 4, 2],
            [2, 0, 0, 0, 0, 0, 0, 0, 0, 2],
            [2, 0, 0, 1, 0, 0, 0, 0, 0, 2],
            [2, 0, 0, 0, 0, 0, 0, 0, 0, 2],
            [2, 0, 0, 0, 0, 0, 0, 0, 0, 2],
            [2, 0, 0, 0, 0, 0, 0, 0, 0, 2],
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
        ]
        return array
    }
    
    private func getSecondLevel()-> [[Int]] {
        let  array: [[Int]] = [
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2],
            [2, 0, 0, 4, 4, 0, 0, 0, 0, 2],
            [2, 0, 0, 3, 3, 0, 0, 0, 0, 2],
            [2, 0, 0, 0, 0, 0, 0, 0, 0, 2],
            [2, 0, 0, 1, 0, 0, 0, 0, 0, 2],
            [2, 0, 0, 0, 0, 0, 0, 0, 0, 2],
            [2, 0, 0, 0, 0, 0, 0, 0, 0, 2],
            [2, 0, 0, 0, 0, 0, 0, 0, 0, 2],
            [2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
        ]
        return array
    }
    
    private func getThirdLevel() -> [[Int]] {
        let array: [[Int]] = [
            [0, 0, 2, 2, 2, 2, 2, 0, 0, 0],
            [2, 2, 2, 0, 0, 0, 2, 0, 0, 0],
            [2, 0, 1, 0, 0, 0, 2, 0, 0, 0],
            [2, 2, 2, 0, 3, 4, 2, 0, 0, 0],
            [2, 4, 2, 2, 3, 0, 2, 0, 0, 0],
            [2, 0, 2, 0, 4, 0, 2, 2, 0, 0],
            [2, 3, 0, 0, 3, 3, 4, 2, 0, 0],
            [2, 0, 0, 0, 4, 0, 0, 2, 0, 0],
            [2, 2, 2, 2, 2, 2, 2, 2, 0, 0]
        ]
        return array

    }
    public func getLevel() -> Int {
        level = level - 1
        return level
    }
    
    
}
