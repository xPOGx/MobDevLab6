//
//  MyCollectionViewCell.swift
//  MobDev
//
//  Created by POG on 05.12.2020.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        let images: [UIImage] = [
            UIImage(named: "image1"),
            UIImage(named: "image2"),
            UIImage(named: "image3"),
            UIImage(named: "image4"),
            UIImage(named: "image5"),
            UIImage(named: "image6"),
            UIImage(named: "image7"),
            UIImage(named: "image8"),
            UIImage(named: "image9"),
            //UIImage(named: "image10"),//too black
            UIImage(named: "image11"),
            UIImage(named: "image12"),
            UIImage(named: "image13"),
            //UIImage(named: "image14"),//too black
            UIImage(named: "image15"),
            UIImage(named: "image16"),
        ].compactMap({ $0 })
        imageView.image = images.randomElement()
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
}
