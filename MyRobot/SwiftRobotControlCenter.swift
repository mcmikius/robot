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
     Используйте робота, для постройки X - фигуры как на скрине.
     */
    //  Level name setup
    override func viewDidLoad() {
        levelName = "L55H" //  Level name
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        drawCross()
    }
    
    func drawCross() {
        diagonal()
        goToNextStep()
        turnRight()
        diagonal()
        put()
        
    }
    
    func diagonal() {
        while frontIsClear {
            put()
            if frontIsClear {
                move()
                turnRight()
            }
            if frontIsClear {
                move()
                turnLeft()
            }
        }
    }
    
    func goToNextStep() {
        turnRight()
        while frontIsClear {
            move()
        }
    }
    
    func turnLeft() {
        turnRight()
        turnRight()
        turnRight()
    }
}
