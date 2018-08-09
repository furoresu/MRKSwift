//
//  MRKFlipViewTransition.swift
//  MRKSwift
//
//  Created by MRKTrace on 9/8/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import UIKit

open class MRKFlipViewTransition : MRKGenericViewTransition {
    override public func animateTransitionFor(fromView: UIView, toView: UIView, withTime time: TimeInterval, inContainer container: UIView, withContext context: UIViewControllerContextTransitioning) {
        let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
        container.addSubview(toView)
        
        UIView.transition(from: fromView, to: toView, duration: time, options: transitionOptions) { completed in
            context.completeTransition(completed)
        }
    }
}
