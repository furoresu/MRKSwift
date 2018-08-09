//
//  MRKGenericNavigationViewModel.swift
//  MRKSwift
//
//  Created by MRKTrace on 9/8/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import UIKit

open class MRKGenericNavigationViewModel:MRKGenericViewControllerViewModel<UINavigationController> , UINavigationControllerDelegate{
    
    public override func viewWillAppear() {
        self.bindView()
        super.viewWillAppear()
    }
    
    override public func bindView() {
        super.bindView()
        vc?.delegate = self
    }
    
    /*
     Define your own transitions for specified viewcontrollers
     */
    
    open func transitionRules(forNavigator:UINavigationController)->[MRKTransitionRule]{
        return []
    }
    
    fileprivate lazy var transitionRules: [MRKTransitionRule] = {
        return self.transitionRules(forNavigator: self.vc!)
    }()
    
    
    //MARK : - UINavigationControllerDelegate
    
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let result = transitionRules
                    .filter{  toVC.isKind(of: $0.toVc!) && (fromVC.isKind(of: $0.fromVc!) || $0.fromVc == nil) }
                    .sorted{ (r1,r2) in r1.fromVc != nil }
        
        return result.count > 0 ? result[0].pushTransition : nil
    }
}
