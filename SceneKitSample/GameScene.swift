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
        // 球
        let sphere: SCNGeometry = SCNSphere(radius: 2)
        let geometryNode = SCNNode(geometry: sphere)
        self.rootNode.addChildNode(geometryNode)
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
