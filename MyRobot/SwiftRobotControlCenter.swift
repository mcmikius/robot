//
//  SwiftRobotControlCenter.swift
//  MyRobot
//
//  Created by Ivan Vasilevich on 10/4/14.
//  Copyright (c) 2014 Ivan Besarab. All rights reserved.
//

import UIKit
//  All robot commands can be founded in GameViewController.h
class SwiftRobotControlCenter: RobotControlCenter {
    /*
     На уровнях L4H/L55H/L555H/L666H - заставить робота расставить конфеты в шахматном порядке (симуляторы iPad Air/Pro)
     */
    //  Level name setup
    override func viewDidLoad() {
        levelName = "L4H" //  Level name
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        buildChessArea()
        
    }
    
    func buildChessArea() {
        for _ in 0..<14 {
            safeBuildChessLine()
            
        }
    }
    func safeBuildChessLine() {
        
        if candyPresent {
            while frontIsClear {
                if frontIsClear {
                    move()
                    pick()
                    if frontIsClear {
                        move()
                        put()
                    }
                }
            }
            turnArroundRight()
            evenTurnLeft()
            
            
        } else {
            while frontIsClear {
                if frontIsClear {
                    move()
                    put()
                    if frontIsClear {
                        move()
                        pick()
                    }
                }
            }
            turnArroundRight()
            oddTurnLeft()
        }
    }
    
    func evenTurnLeft() {
        turnLeft()
        
        if frontIsClear {
            move()
            turnLeft()
            pick()
        }
    }
    func oddTurnLeft() {
        turnLeft()
        
        if frontIsClear {
            move()
            turnLeft()
            put()
        }
    }
    
    func turnArroundRight() {
        for _ in 0..<2 {
            turnRight()
        }
        while frontIsClear {
            safetlyMove()
        }
    }
    
    
    func safetlyMove() {
        if frontIsClear {
            move()
        }
    }
    
    func turnLeft() {
        for _ in 0..<3 {
            turnRight()
        }
    }
}
