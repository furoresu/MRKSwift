//
//  MRKGenericViewControllerViewModel.swift
//  MRKSwift
//
//  Created by MRKTrace on 9/8/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import UIKit
import RxCocoa

open class MRKGenericViewControllerViewModel<T>: NSObject where T:UIViewController {
    
    public var vc: T? {
        didSet{
            _ = vc?.rx.viewDidLoad.bind{ _ in self.bindView() }
            _ = vc?.rx.viewWillAppear.bind{ _ in self.viewWillAppear() }
        }
    }
    
    //MARK : - Override
    
    public func bindView(){
        //TODO
    }
    
    public func viewWillAppear(){
        //TODO
    }
    
}
