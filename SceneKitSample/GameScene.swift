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
        enum TestType {
            case basic
            case action
            case transition
        }
        let type: TestType = .transition
        // ドーナツ
        let node: SCNNode = {
            let torus = SCNTorus(ringRadius: 2, pipeRadius: 0.35)
            let node = SCNNode(geometry: torus)
            // 回転アニメーション
            switch type {
            case .basic:
                let rotate: CABasicAnimation = {
                    let animation = CABasicAnimation(keyPath: "rotation")
                    animation.fromValue = SCNVector4(0.0, 0.0, 0.0, 0.0)
                    animation.toValue = SCNVector4(1.0, 0.0, 0.0, Float.pi * 2.0)
                    animation.duration = 10
                    animation.repeatCount = HUGE
                    return animation
                }()
                node.addAnimation(rotate, forKey: "rotate")
            case .action:
                node.runAction(
                    SCNAction.repeatForever(
                        SCNAction.sequence([
                            SCNAction.rotateBy(x: CGFloat(Float.pi * 1.0), y: 0, z: 0, duration: 5),
                            SCNAction.rotateBy(x: 0, y: 0, z: CGFloat(Float.pi * 1.0), duration: 5)])))
            case .transition: break
            }
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
        if type == .transition {
            SCNTransaction.begin()
            SCNTransaction.animationDuration = 10
            node.rotation = SCNVector4(1.0, 0.0, 0.0, Float.pi * 2.0)
            cameraNode.position = SCNVector3(x: 0, y: 0, z: 30)
            SCNTransaction.commit()
        }
    }
}
