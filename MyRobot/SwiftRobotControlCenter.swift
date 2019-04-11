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
     lightBot - скачать и пройти L2H/L22H - достроить колонны (Dir)L2H
     */
    //  Level name setup
    override func viewDidLoad() {
        levelName = "L22H" //  Level name
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        turnLeft()
        
        for _ in 0..<4 {
            createColumn()
            completeColumn()
            moveNextColumn()
            
        }
    }
    func createColumn() {
        while frontIsClear {
            if candyPresent {
                move()
            } else {
                put()
                move()
            }
        }
    }
    func completeColumn() {
        if candyPresent {
            pick()
            if facingUp {
                turnRight()
            } else {
                turnLeft()
            }
        } else {
            if facingUp {
                turnRight()
                put()
            } else {
                turnLeft()
                put()
            }
        }
    }
    func turnLeft() {
        for _ in 0..<3 {
            turnRight()
        }
    }
    func moveNextColumn() {
        if leftIsClear {
            moveFourNumber()
            turnLeft()
        } else {
            moveFourNumber()
            turnRight()
        }
        
        
    }
    func moveFourNumber() {
        for _ in 0..<4 {
            if frontIsClear {
                move()
            }
        }
    }
}
