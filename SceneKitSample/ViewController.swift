//
//  ViewController.swift
//  SceneKitSample
//
//  Created by TakkuMattsu on 2018/01/22.
//  Copyright © 2018年 TakkuMattsu. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let scnView = self.view as? SCNView {
            let scene = SCNScene()
            scnView.scene = scene
            scnView.showsStatistics = true
            scnView.backgroundColor = UIColor.black
            scnView.allowsCameraControl = true
            // シーンを追加してみる
            let sphere: SCNGeometry = SCNSphere(radius: 2)
            //sphere.firstMaterial?.diffuse.contents = UIColor.blue
            sphere.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Image")
            let geometryNode = SCNNode(geometry: sphere)
            // 回してみる
            geometryNode.runAction(SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: 2, z: 0, duration: 2)))
            scene.rootNode.addChildNode(geometryNode)
            // カメラ追加
            let cameraNode = SCNNode()
            cameraNode.camera = SCNCamera()
            cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
            scene.rootNode.addChildNode(cameraNode)
            // ライト
            let lightNode = SCNNode()
            lightNode.light = SCNLight()
            lightNode.light!.type = .omni
            lightNode.position = SCNVector3(x: 10, y: 0, z: 10)
            scene.rootNode.addChildNode(lightNode)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

