//
//  UITableView+register.swift
//  MRK-Swift
//
//  Created by Marc Flores on 15/7/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func registerClassNib<T>( _ cellType: T.Type ) where T : UITableViewCell {
        register(cellType.nib, forCellReuseIdentifier: cellType.className)
    }
    
    public func dequeueReusableCell<T>( _ cellType: T.Type, for index:IndexPath) -> T where T : UITableViewCell{
        return self.dequeueReusableCell(withIdentifier: T.className, for: index) as! T
    }
}
