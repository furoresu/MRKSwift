//
//  MRKMapperActioner.swift
//  MRKSwift
//
//  Created by MRKTrace on 14/9/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import ObjectMapper

open class MRKMapperActioner : NSObject {
 
    fileprivate var actions : [MRKMapperActionProtocol] = []
    
    public func register<T:Mappable>(action : @escaping ((_ obj:T)->())){
        let mrkAction = MRKMapperAction(withAction: action)
        actions.append(mrkAction)
    }
    
    public func activate(for value: Any){
        for mrkAction in actions {
            if mrkAction.activateAction(value) {
                return
            }
        }
    }
}
