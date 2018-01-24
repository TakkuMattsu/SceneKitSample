//
//  GameScene.swift
//  SceneKitSample
//
//  Created by TakkuMattsu on 2018/01/22.
//  Copyright © 2018年 TakkuMattsu. All rights reserved.
//

import SceneKit

class GameScene: SCNScene {
    override init() {
        super.init()
        setUpScene()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GameScene {
    fileprivate func setUpScene() {
        // box
        let node: SCNNode = {
            let box = SCNBox(width: 1, height: 2, length: 1, chamferRadius: 0.2)
            let node = SCNNode(geometry: box)
            let action = SCNAction.moveBy(x: 2, y: 0, z: 0, duration: 2)
            //node.runAction(action)
            let action2 = SCNAction.moveBy(x: 2, y: 0, z: 0, duration: 2)
            //node.runAction(action2)
            // Vectorで移動
            let action3 = SCNAction.move(by: SCNVector3(2, 0, 0), duration: 2)
            //node.runAction(action3)
            let action4 = SCNAction.move(to: SCNVector3.init(2, 0, 0), duration: 2)
            node.runAction(action4)
            return node
        }()
        self.rootNode.addChildNode(node)
        // オムニライト
        let lightNode: SCNNode = {
            let node = SCNNode()
            node.light = {
                let light = SCNLight()
                light.type = .omni
                return light
            }()
            node.position = SCNVector3(0, 10, 10)
            return node
        }()
        self.rootNode.addChildNode(lightNode)
        // アンビエントライト(環境光)
        let ambientNode: SCNNode = {
            let node = SCNNode()
            node.light = {
                let light = SCNLight()
                light.type = .ambient
                light.color = UIColor.darkGray
                return light
            }()
            return node
        }()
        self.rootNode.addChildNode(ambientNode)
        // カメラ
        let cameraNode: SCNNode = {
            let node = SCNNode()
            node.camera = SCNCamera()
            node.position = SCNVector3(0, 0, 10)
            return node
        }()
        self.rootNode.addChildNode(cameraNode)
    }
}
