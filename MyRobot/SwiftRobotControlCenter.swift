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
     L2C/L3C - обойти вершины
     */
    //  Level name setup
    override func viewDidLoad() {
        levelName = "L2C" //  Level name
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        for _ in 0..<14 {
            if frontIsClear {
                move()
            } else {
                arroundOnePeak()
            }
        }
    }
    
    
    func arroundOnePeak() {
        turnRight()
        moveAlongWall()
        turnArround()
        moveToWall()
        turnRight()
    }
    func moveAlongWall() {
        while leftIsBlocked {
            move()
        }
    }
    func turnArround() {
        turnLeft()
        move()
        turnLeft()
    }
    func moveToWall() {
        while frontIsClear {
            move()
        }
    }
    func turnLeft() {
        for _ in 0..<3 {
            turnRight()
        }
    }
    
}

