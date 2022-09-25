//
//  AppDelegate.swift
//  Sokoban
//
//  Created by Erzhan Kasymov on 7/9/22.
//

import UIKit
@main
 public class Viewer: UIResponder, UIApplicationDelegate {
   
     public var window: UIWindow?
     private var canvas: Canvas?
     
     public override init() {
         print("I'm Viewer object")
         let frame: CGRect = UIScreen.main.nativeBounds
         window = UIWindow(frame:frame)
         super.init()
         let controller:Controller = Controller(viewer: self)//cсылка на котроллер
         let model: Model = controller.getModel()
         canvas = Canvas(frame:frame,model: model)
         controller.view.addSubview(canvas!)
         window?.contentMode = .scaleToFill
         window?.backgroundColor = UIColor.blue
         window?.rootViewController = controller
         window?.makeKeyAndVisible()
         
    }
     
     public func update() {
         canvas!.update()
     }
}

