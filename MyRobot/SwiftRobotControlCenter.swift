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
     На уровнях L4H/L55H/L555H/L666H - найти центр мира (симуляторы iPad Air/Pro)
     */
    //  Level name setup
    override func viewDidLoad() {
        levelName = "L4H" //  Level name
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        getCenterOfArea()
    }
    func getCenterOfArea() {
        searchCenter()
        faceToDown()
        if frontIsClear {
            move()
        }
        searchCenter()
    }
    func searchCenter(){
        corners()
        searchLineCenter()
    }
    func faceToDown() {
        if facingRight {
            turnRight()
        } else {
            turnLeft()
        }
    }
    func turnLeft() {
        for _ in 0..<3 {
            turnRight()
        }
    }
    func corners() {
        put()
        while frontIsClear {
            move()
        }
        put()
        turnArround()
    }
    func turnArround() {
        turnRight()
        turnRight()
        if frontIsClear {
            move()
        }
    }
    func searchLineCenter() {
        while noCandyPresent {
            
            while noCandyPresent {
                if frontIsClear {
                    move()
                }
            }
            turnArround()
            put()
            move()
        }
        if facingDown {
            turnArround()
        }
        if facingRight {
            turnArround()
        }
    }
    
}
