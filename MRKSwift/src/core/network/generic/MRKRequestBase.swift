//
//  MRKRequestBase.swift
//  MRKSwift
//
//  Created by MRKTrace on 3/8/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import Alamofire
import RxSwift
import RxAlamofire

open class MRKRequestBase {
    internal(set) var path: String!
    internal(set) var method: HTTPMethod!
    internal(set) var parameters: [String: Any]?
    internal(set) var encoding: ParameterEncoding! = URLEncoding.default
    internal(set) var headers: HTTPHeaders?
    
    //MARK : - Public
    
    public func rxRequest()->Observable<DataRequest>{
        return RxAlamofire.request(
            method,
            path,
            parameters: parameters,
            encoding: encoding,
            headers: headers)
    }
}

