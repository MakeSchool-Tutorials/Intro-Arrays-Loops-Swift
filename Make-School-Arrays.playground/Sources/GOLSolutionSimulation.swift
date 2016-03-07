//
//  GOLSolutionSimulation.swift
//  Make-School-Arrays
//
//  Created by Yujin Ariza on 2/29/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation

public class GOLSolutionSimulation: Simulation {
    
    public var liveChar: Character = "■"
    
    public override func setup() {
    }
    
    public override func update() {
        var newMap = map // swift copies arrays by value
        for i in 0..<map.count {
            for j in 0..<map[i].count {
                let cell = map[i][j]
                let neighbors = countNeighbors(map, i: i, j: j)
                if cell != nil {
                    if neighbors < 2 {
                        newMap[i][j] = nil
                    } else if neighbors < 4 {
                        newMap[i][j] = liveChar
                    } else {
                        newMap[i][j] = nil
                    }
                } else {
                    if neighbors == 3 {
                        newMap[i][j] = liveChar
                    }
                }
            }
        }
        map = newMap
    }
    
    func countNeighbors(map: [[Character?]], i: Int, j: Int) -> Int {
        var count = 0
        count += isCellAlive(map, i-1, j)
        count += isCellAlive(map, i+1, j)
        count += isCellAlive(map, i, j-1)
        count += isCellAlive(map, i, j+1)
        count += isCellAlive(map, i-1, j-1)
        count += isCellAlive(map, i-1, j+1)
        count += isCellAlive(map, i+1, j-1)
        count += isCellAlive(map, i+1, j+1)
        return count
    }
    
    func isCellAlive(map: [[Character?]], _ i: Int, _ j: Int) -> Int {
        if i < 0 || map.count <= i {
            return 0
        }
        if j < 0 || map[0].count <= j {
            return 0
        }
        return map[i][j] != nil ? 1 : 0
    }
}