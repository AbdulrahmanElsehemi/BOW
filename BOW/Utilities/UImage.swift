//
//  UImage.swift
//  BOW
//
//  Created by Abdelrahman on 9/24/20.
//

import Foundation
import UIKit

extension UIImage {
    
    func getImageRatio() -> CGFloat {
        let widthRatio = CGFloat(self.size.width / self.size.height)
        return widthRatio
    }
    
}
