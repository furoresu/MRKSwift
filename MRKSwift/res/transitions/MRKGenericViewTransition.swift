//
//  MRKGenericViewTransition.swift
//  MRKSwift
//
//  Created by MRKTrace on 9/8/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import Foundation

open class MRKGenericViewTransition : NSObject, UIViewControllerAnimatedTransitioning {
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView
        let time = transitionDuration(using: transitionContext)

        guard let fromView = transitionContext.view(forKey: .from),
            let toView = transitionContext.view(forKey: .to) else {
                return
        }
        
        animateTransitionFor(fromView: fromView, toView: toView, withTime: time, inContainer: container, withContext: transitionContext)
    }
    
    //MARK : - Override
    
    public func animateTransitionFor(fromView:UIView, toView:UIView, withTime time:TimeInterval, inContainer container:UIView, withContext context:UIViewControllerContextTransitioning){
        //TODO
    }
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
}
