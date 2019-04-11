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
     L4H/L55H/L555H/L666H  - печенки по углам мира с учетом (Dir/pro) неизвестного положения и позициипеченки по углам (pro) L4H - done
     */
    //  Level name setup
    override func viewDidLoad() {
        levelName = "L666H" //  Level name
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        addCandyToCorner()
        
    }
    
    func addCandyToCorner() {
        searchCorner()
        putCandyInCorner()
    }
    
    func searchCorner() {
        while frontIsClear {
            move()
        }
        turnRight()
        while frontIsClear {
            move()
        }
    }
    
    func putCandyInCorner() {
        while noCandyPresent {
            put()
            turnRight()
            if frontIsBlocked {
                turnRight()
            }
            while frontIsClear {
                move()
                
            }
        }
    }
}

