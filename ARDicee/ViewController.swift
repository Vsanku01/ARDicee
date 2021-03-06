//
//  ViewController.swift
//  ARDicee
//
//  Created by S VISHNU DARSHAN on 04/06/19.
//  Copyright © 2019 S VISHNU DARSHAN. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        
//        let  cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
//        let sphere = SCNSphere(radius: 0.2)
//
//        let material = SCNMaterial()
//
//        material.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
//
//        sphere.materials = [material]
//
//        let node = SCNNode()
//
//        node.position = SCNVector3(0.1, 0.1, -0.5)
//        node.geometry  = sphere
//
//        sceneView.scene.rootNode.addChildNode(node)
//        sceneView.autoenablesDefaultLighting = true
        
        

        let dogScene = SCNScene(named: "art.scnassets/french_bulldog.scn")!
        
        
       if  let dogNode = dogScene.rootNode.childNode(withName: "TopN", recursively: true)
       {
        
        dogNode.position = SCNVector3(0.1, 0.1, -0.5)
        
        sceneView.scene.rootNode.addChildNode(dogNode)

        
        }
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

}
