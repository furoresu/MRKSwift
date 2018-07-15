//
//  UICollectionView+register.swift
//  MRK-Swift
//
//  Created by Marc Flores on 15/7/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    public func registerClassNib<T>( _ cellType: T.Type ) where T : UICollectionViewCell {
        register(cellType.nib, forCellWithReuseIdentifier: cellType.className)
    }
    
    public func dequeueReusableCell<T>( _ cellType: T.Type, for index:IndexPath) -> T where T : UICollectionViewCell{
        return dequeueReusableCell(withReuseIdentifier: T.className, for: index) as! T
    }
}
