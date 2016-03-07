//
//  SolutionOverlaySimulationScene.swift
//  Make-School-Arrays
//
//  Created by Yujin Ariza on 3/6/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

public class SolutionOverlaySimulationScene: SimulationScene {
    
    public let solutionSim: Simulation
    public let solutionPalette: [Character?]
    
    public init(sim: Simulation, palette: [Character?], solutionSim: Simulation, solutionPalette: [Character?], size: CGSize) {
        self.solutionSim = solutionSim
        self.solutionPalette = solutionPalette
        
        super.init(sim: sim, palette: palette, size: size)
        checkPalette()
        checkGrid()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func timerUpdate() {
        solutionSim.update()
        super.timerUpdate()
        checkPalette()
        checkGrid()
    }
    
    func checkPalette() {
//        let maxLen = max(solutionPalette.count, palette.count)
        // TODO: stop assuming lengths are same
        for x in 0..<palette.count {
            if solutionPalette[x] != palette[x] {
                paletteGrid.setTileState(x, 0, state: .Incorrect)
            } else {
                paletteGrid.setTileState(x, 0, state: .Default)
            }
        }
    }
    
    func checkGrid() {
        for x in 0..<sim.map.count {
            for y in 0..<sim.map[x].count {
                if solutionSim.map[x][y] != sim.map[x][y] {
                    grid.setTileState(x, y, state: .Incorrect)
                } else {
                    grid.setTileState(x, y, state: .Default)
                }
            }
        }
    }
}