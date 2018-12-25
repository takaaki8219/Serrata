//
//  ImageCell.swift
//  Example
//
//  Created by Takuma Horiuchi on 2017/11/29.
//  Copyright © 2017年 Takuma Horiuchi. All rights reserved.
//

import UIKit
import Photos

final class ImageCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.contentMode = .scaleAspectFill
        }
    }

    func configure(image: UIImage) {
        imageView.image = image
    }
    
    func configure(asset: PHAsset) {
        let manager = PHImageManager.default()
        let size: CGSize = .init(width: 100, height: 100)
        manager.requestImage(
            for: asset, targetSize: size,
            contentMode: .aspectFill, options: nil) { [weak self] image, _ in
                guard let weak = self else { return }
                weak.imageView.image = image
        }
    }
}
