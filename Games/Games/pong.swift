//
//  pong.swift
//  Games
//
//  Created by period2 on 5/17/21.
//

import UIKit

class pong: UIViewController, UICollisionBehaviorDelegate {

    @IBOutlet weak var ballView: UIView!
    @IBOutlet weak var paddleOne: UIView!
    @IBOutlet weak var paddleTwo: UIView!
    @IBOutlet weak var boundaryOne: UIView!
    @IBOutlet weak var boundaryTwo: UIView!
    
    var dynamicAnimator: UIDynamicAnimator!
    var pushBehavior: UIPushBehavior!
    var collisionBehavior: UICollisionBehavior!
    var ballDynamicItem: UIDynamicItemBehavior!
    var paddleOneDynamicItem: UIDynamicItemBehavior!
    var paddleTwoDynamicItem: UIDynamicItemBehavior!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ballView.layer.cornerRadius = 15
        ballView.isHidden = true
        paddleOne.isHidden = true
        paddleTwo.isHidden = true
    }
    
    @IBAction func panGestureOne(_ sender: UIPanGestureRecognizer) {
        paddleTwo.center = CGPoint(x: sender.location(in: view).x, y: paddleTwo.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddleTwo)
        }
    
    
    
    @IBAction func panGestureTwo(_ sender: UIPanGestureRecognizer) {
        paddleOne.center = CGPoint(x: sender.location(in: view).x, y: paddleOne.center.y)
        dynamicAnimator.updateItem(usingCurrentState: paddleOne)
        
    }
    func dynamicBehaviors () {
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
        pushBehavior = UIPushBehavior(items:[ballView], mode: .instantaneous)
        pushBehavior.active = true
        pushBehavior.setAngle(0.6, magnitude: 0.6)
        dynamicAnimator.addBehavior(pushBehavior)
        
        collisionBehavior = UICollisionBehavior(items: [ballView, paddleOne, paddleTwo, boundaryOne, boundaryTwo] )
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        collisionBehavior.collisionMode = .everything
        dynamicAnimator.addBehavior(collisionBehavior)
        
        collisionBehavior.collisionDelegate = self
        ballDynamicItem = UIDynamicItemBehavior(items: [ballView])
        ballDynamicItem.allowsRotation = false
        ballDynamicItem.elasticity = 1
        ballDynamicItem.friction = 0
        ballDynamicItem.resistance = 0
        dynamicAnimator.addBehavior(ballDynamicItem)
        
        paddleOneDynamicItem = UIDynamicItemBehavior(items: [paddleOne])
        paddleOneDynamicItem.density = 10000
        paddleOneDynamicItem.elasticity = 0.5
        paddleOneDynamicItem.allowsRotation = false
        dynamicAnimator.addBehavior(paddleOneDynamicItem)
    
        paddleTwoDynamicItem = UIDynamicItemBehavior(items: [paddleTwo])
        paddleTwoDynamicItem.density = 10000
        paddleTwoDynamicItem.elasticity = 0.5
        paddleTwoDynamicItem.allowsRotation = false
        dynamicAnimator.addBehavior(paddleTwoDynamicItem)
    
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func startButton(_ sender: UIButton) {
        ballView.isHidden = false
        paddleTwo.isHidden = false
        paddleOne.isHidden = false
        dynamicBehaviors()
        sender.isHidden = true
    }
    



}

