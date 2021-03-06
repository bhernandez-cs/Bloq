//
//  GameScene.swift
//  Bloq
//
//  Created by Brian Hernandez on 11/22/16.
//  Copyright © 2016 Brian Hernandez. All rights reserved.
//

//Resources for learning gesture based controls:
//https://www.raywenderlich.com/96822/sprite-kit-tutorial-drag-drop-sprites
//http://www.spritekitlessons.com/gesture-recognizer-with-sprite-kit-and-swift/
//https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=using+gesture+recognizer+in+spritekit+2016

import SpriteKit

class GameScene: SKScene {
    
    func makeBouncer(at position: CGPoint){
        let bouncer = SKSpriteNode(imageNamed: "bouncer")
        bouncer.position = position
        bouncer.physicsBody = SKPhysicsBody(circleOfRadius: bouncer.size.width/2.0)
        bouncer.physicsBody!.isDynamic = false
        addChild(bouncer)
    }
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background.jpg")
        background.position = CGPoint(x: 512, y: 384)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        makeBouncer(at: CGPoint(x: 0, y:100))
        makeBouncer(at: CGPoint(x: 256, y:100))
        makeBouncer(at: CGPoint(x: 512, y:100))
        makeBouncer(at: CGPoint(x: 768, y:100))
        makeBouncer(at: CGPoint(x: 1024, y:100))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            let box = SKSpriteNode(color: UIColor.red, size: CGSize(width: 64, height: 64))
            box.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 64, height: 64))
            box.position = location
            addChild(box)
        }
    }
}
