//
//  MRKMapperAction.swift
//  MRKSwift
//
//  Created by MRKTrace on 14/9/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import ObjectMapper

protocol MRKMapperActionProtocol {
    
    func activateAction( _ data : Any ) -> Bool
    
}


class MRKMapperAction<T:Mappable> : NSObject, MRKMapperActionProtocol{

    fileprivate var action : ((_ obj : T) -> ())!
    
    init( withAction action: @escaping ((_ obj : T) -> ()) ) {
        super.init()
        self.action = action
    }
    
    //MARK : - MRKMapperActionProtocol
    
    func activateAction(_ data: Any) -> Bool {
        
        if let actionData = Mapper<T>().map(JSONObject: data) {
            self.action(actionData)
            return true
        }
        
        return false
    }
}
