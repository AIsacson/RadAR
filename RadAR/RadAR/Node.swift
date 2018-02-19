//
//  Node.swift
//  ARViewMap
//
//  Created by zeenat ali on 2/11/18.
//  Copyright © 2018 zeenat ali. All rights reserved.
//

import ARKit
import CoreLocation

class Node: SCNNode {
    
    let title: String
    var location: CLLocation!
    
    init(title: String, location: CLLocation) {
        self.title = title
        super.init()
        let billboardConstraint = SCNBillboardConstraint()
        billboardConstraint.freeAxes = SCNBillboardAxis.Y
        constraints = [billboardConstraint]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCircle(with radius: CGFloat, color: UIColor) -> SCNNode {
        let geometry = SCNSphere(radius: radius)
        geometry.firstMaterial?.diffuse.contents = color
        let node = SCNNode(geometry: geometry)
        return node
    }
    
    func createPyramid(with width: CGFloat, height: CGFloat, length: CGFloat, color: UIColor) -> SCNNode {
        let geometry = SCNPyramid(width: width, height: height, length: length)
        geometry.firstMaterial?.diffuse.contents = color
        let node = SCNNode(geometry: geometry)
        return node
    }
    
    // Add graphic as child node - basic
    
    func addCircleNode(with radius: CGFloat, and color: UIColor) {
        let node = createCircle(with: radius, color: color)
        addChildNode(node)
    }
    
    func addPyramidNode(with width: CGFloat, height: CGFloat, length: CGFloat, and color: UIColor) {
        let node = createPyramid(with: width, height: height, length: length, color: color)
        addChildNode(node)
    }
}
