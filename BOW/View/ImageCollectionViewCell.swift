//
//  ImageCollectionViewCell.swift
//  BOW
//
//  Created by Abdelrahman on 9/25/20.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    var data:String?{
        didSet{
            manageData()
        }
    }
    
    let imgView: CustomImageView = {
        let img = CustomImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.borderColor = UIColor(red: 230/255, green: 230/255, blue:230/255, alpha: 1).cgColor
        img.layer.borderWidth = 0.5
        img.layer.cornerRadius = 8
        return img
    }()
    
    let backView: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        v.layer.cornerRadius = 8
        v.alpha = 0.5
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backView)
        addSubview(imgView)
        imgView.pin(to: self)
        backView.pin(to: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func manageData(){
        guard let data = data else {return}
        imgView.cacheImageWithLoader(withURL: data, view: backView)
    }
    
}
