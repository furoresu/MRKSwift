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
            guard let vc = self.vc else {
                return
            }
            _ = vc.rx.viewDidLoad.bind{ _ in self.bindView(viewController: vc) }
            _ = vc.rx.viewWillAppear.bind{ _ in self.viewWillAppear(viewController: vc) }
        }
    }
    
    //MARK : - Override
    
    public func bindView( viewController vc:T ){
        //TODO
    }
    
    public func viewWillAppear( viewController vc:T  ){
        //TODO
    }
    
}
