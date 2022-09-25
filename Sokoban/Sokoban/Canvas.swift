//
//  Canvas.swift
//  Sokoban
//
//  Created by Erzhan Kasymov on 15/9/22.
//

import Foundation
import UIKit

public class Canvas:UIView {
    private let model: Model
    
    private var imageGamer: UIImage?
    private var imageWall: UIImage?
    private var imageBox: UIImage?
    private var imageGoal: UIImage?
    
    public init(frame: CGRect,model: Model) {
        print("Im Canvas object")
        self.model = model
        
        imageGamer = UIImage(named: "hero")
        imageWall = UIImage(named: "wall")
        imageBox = UIImage(named: "box")
        imageGoal = UIImage(named: "box_goal_v2")
        
        super.init(frame: frame)
        backgroundColor = UIColor.black
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func update() {
        setNeedsDisplay()
    }
    
    public override func draw(_ rect: CGRect) {
        
        let desktop: [[Int]] = model.getDesktop()
        
        var xDesktop = 30.0
        var yDesktop = 30.0
        
        let widthDesktop = 30.0
        let heightDesktop = 30.0
        let offset = 0.0
        for i in 0...desktop.count - 1 {
            for j in 0...desktop[i].count - 1 {
                let element = desktop[i][j]
                
                if (element == 1) {
                    imageGamer?.draw(at: CGPoint(x: xDesktop, y: yDesktop))
                } else if (element == 3) {
                    imageBox?.draw(at: CGPoint(x: xDesktop, y: yDesktop))
                }else if (element == 2) {
                    imageWall?.draw(at: CGPoint(x: xDesktop, y: yDesktop))
                }else if (element == 4) {
                    imageGoal?.draw(at: CGPoint(x: xDesktop, y: yDesktop))
                }
                xDesktop = xDesktop + widthDesktop + offset
            }
            xDesktop = 30.0
            yDesktop = yDesktop + heightDesktop + offset
        }
    }
}
