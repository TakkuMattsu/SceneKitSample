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
            let scene = GameScene()
            scnView.scene = scene
            scnView.showsStatistics = true
            scnView.backgroundColor = UIColor.black
            scnView.allowsCameraControl = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

