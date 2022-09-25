//
//  Model.swift
//  Sokoban
//
//  Created by Erzhan Kasymov on 15/9/22.
//

import Foundation

public class Model {
    private let viewer: Viewer
    private let levels: Levels
    private var  desktop: [[Int]]
    private var arrayOfIndexies:[[Int]]
    private var stateModel: Bool
    private var drawBluePrint: Bool
    private var indexX: Int
    private var indexY: Int
    
    public init(viewer: Viewer) {
        print ("I'm Model object")
        self.viewer = viewer
        arrayOfIndexies = [[]]
        desktop = [[]]
        levels = Levels()
        stateModel = true
        drawBluePrint = false
        
        indexX = 0
        indexY = 0
        initialization()
    }
    
    private func initialization() {
        desktop = levels.nextLevel()
        var countOne = 0
        var countThree = 0
        var countFour = 0
        arrayOfIndexies = [[],[]]
        for i in 0..<desktop.count {
            for j in 0..<desktop[i].count {
                if (desktop[i][j] == 4) {
                    countFour = countFour + 1
                    arrayOfIndexies[0].append(i)
                    arrayOfIndexies[1].append(j)
                } else if(desktop[i][j] == 3) {
                    countThree = countThree + 1
                } else if(desktop[i][j] == 1) {
                    indexX = i
                    indexY = j
                    countOne = countOne + 1
                }
            }
        }
        if(countOne != 1 || (countThree != countFour) || countThree <= 0 || countFour <= 0) {
            stateModel = false
            return
        }
    }
    
    public func move(direction: String) {
        if (direction == "Right"){
            moveRight()
        }else if (direction == "Left") {
            moveLeft()
        }else if (direction == "Down") {
            moveDown()
        }else if (direction == "Up") {
            moveUp()
        } else {
            return
        }
        check()
        viewer.update()
        won()
    }
    private func won() {
        var won:Bool = true
        for j in 0..<arrayOfIndexies[0].count {
            let x = arrayOfIndexies[0][j]
            let y = arrayOfIndexies[1][j]
            if(desktop[x][y] != 3) {
                won = false
                break
            }
        }
        if(won) {
            initialization();
            viewer.update();
        }
    }
    private func check() {
        for j in  0..<arrayOfIndexies[0].count {
            let x = arrayOfIndexies[0][j]
            let y = arrayOfIndexies[1][j]
            if(desktop[x][y] == 0) {
                desktop[x][y] = 4
            }
        }
    }
    
    private func moveRight() {
        if(desktop[indexX][indexY + 1] == 3) {
            if(desktop[indexX][indexY + 2] == 0 || desktop[indexX][indexY + 2] == 4) {
                desktop[indexX][indexY + 1] = 0
                desktop[indexX][indexY + 2] = 3
            }
        }
        if(desktop[indexX][indexY + 1] == 0 || desktop[indexX][indexY + 1] == 4) {
            desktop[indexX][indexY] = 0
            indexY = indexY + 1
            desktop[indexX][indexY] = 1
        }
    }
    
    private func moveLeft() {
        if(desktop[indexX][indexY - 1] == 3) {
            if(desktop[indexX][indexY - 2] == 0 || desktop[indexX][indexY - 2] == 4) {
                desktop[indexX][indexY - 1] = 0
                desktop[indexX][indexY - 2] = 3
            }
        }
        if(desktop[indexX][indexY - 1] == 0 || desktop[indexX][indexY - 1] == 4) {
            desktop[indexX][indexY] = 0
            indexY = indexY - 1
            desktop[indexX][indexY] = 1
        }
    }
    
    private func moveUp() {
        if(desktop[indexX - 1][indexY] == 3) {
            if(desktop[indexX - 2][indexY] == 0 || desktop[indexX - 2][indexY] == 4) {
                desktop[indexX - 1][indexY] = 0
                desktop[indexX - 2][indexY] = 3
            }
        }
        if(desktop[indexX - 1][indexY] == 0 || desktop[indexX - 1][indexY] == 4) {
            desktop[indexX][indexY] = 0
            indexX = indexX - 1
            desktop[indexX][indexY] = 1
        }
    }
    private func moveDown() {
        if(desktop[indexX + 1][indexY] == 3) {
            if(desktop[indexX + 2][indexY] == 0 || desktop[indexX + 2][indexY] == 4) {
                desktop[indexX + 1][indexY] = 0
                desktop[indexX + 2][indexY] = 3
            }
        }
        if(desktop[indexX + 1][indexY] == 0 || desktop[indexX + 1][indexY] == 4) {
            desktop[indexX][indexY] = 0
            indexX = indexX + 1
            desktop[indexX][indexY] = 1
        }
    }
    
    public func getDesktop() -> [[Int]] {
        return desktop
    }
    public func getDrawBlueprint() -> Bool {
        return drawBluePrint
    }
    public func getStateModel() -> Bool {
        return stateModel
    }
    public func getCurrentLevel() -> Int {
        return levels.getLevel()
    }
}
