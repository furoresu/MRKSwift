//
//  MRKTransitionRule.swift
//  MRKSwift
//
//  Created by MRKTrace on 9/8/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import Foundation

infix operator ~ : AdditionPrecedence

public struct MRKTransitionRule {
    var fromVc:UIViewController.Type?
    var pushTransition:UIViewControllerAnimatedTransitioning
    var toVc:UIViewController.Type?
    
    public init( _ fromVc:UIViewController.Type?, _ pushTransition:UIViewControllerAnimatedTransitioning, _ toVc:UIViewController.Type?){
        self.fromVc = fromVc
        self.pushTransition = pushTransition
        self.toVc = toVc
    }
}

public func ~(fromVC:UIViewController.Type?, pushTransition:UIViewControllerAnimatedTransitioning) -> MRKTransitionRule {
    return MRKTransitionRule(fromVC, pushTransition, nil)
}

public func ~(rule:MRKTransitionRule, toVC:UIViewController.Type) -> MRKTransitionRule {
    return MRKTransitionRule(rule.fromVc,rule.pushTransition, toVC)
}
