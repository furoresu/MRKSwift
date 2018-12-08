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
    
    public weak var vc: T? {
        didSet{

            _ = vc?.rx.viewDidLoad.bind{ [weak vc] _ in
                guard let vc = vc else { return }
                self.viewDidLoad(vc)
            }
            
            _ = vc?.rx.viewWillAppear.bind{ [weak vc]  _ in
                guard let vc = vc else { return }
                self.viewWillAppear(vc)
            }
            
            _ = vc?.rx.viewDidAppear.bind{ [weak vc]  _ in
                guard let vc = vc else { return }
                self.viewDidAppear(vc)
            }
            
            _ = vc?.rx.viewWillDisappear.bind{ [weak vc]  _ in
                guard let vc = vc else { return }
                self.viewWillDisappear(vc)
            }
            
            _ = vc?.rx.viewDidDisappear.bind{ [weak vc]  _ in
                guard let vc = vc else { return }
                self.viewDidDisappear(vc)
            }
        }
    }
    
    //MARK : - Override
    
    open func viewDidLoad( _ vc:T ){
        //TODO
    }
    
    open func viewWillAppear( _ vc:T  ){
        //TODO
    }
    
    open func viewDidAppear( _ vc:T  ){
        //TODO
    }
    
    open func viewWillDisappear( _ vc:T  ){
        //TODO
    }
    
    open func viewDidDisappear( _ vc:T  ){
        //TODO
    }
    
}
