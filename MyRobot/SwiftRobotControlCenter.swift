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
     L1C/L11C - удвоить конфеты на том же месте (Dir)L1C/L11C - выглядят одинаково
     */
    //  Level name setup
    override func viewDidLoad() {
        levelName = "L11C" //  Level name
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        move()
        doubleCandy()
        move()
        backCandyToStart()
        comeBackToStart()
    }
    
    
    func turnLeft() {
        for _ in 0..<3 {
            turnRight()
        }
    }
    func arround() {
        for _ in 0..<2 {
            turnRight()
        }
    }
    func comeBackToStart() {
        arround()
        move()
        move()
        arround()
    }
    func doubleCandy() {
        while candyPresent {
            pick()
            move()
            put()
            put()
            comeBackToStart()
            if candyInBag {
                move()
            }
        }
    }
    func backCandyToStart() {
        while candyPresent {
            pick()
            arround()
            move()
            arround()
            put()
            move()
        }
    }
}

