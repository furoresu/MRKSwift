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
    public var path: String!
    public var parameters: [String: Any]?
    public var headers: HTTPHeaders?
    
    var encoding: ParameterEncoding! = URLEncoding.default
    var method: HTTPMethod!

    //MARK : - Public
    
    public func rxRequest()->Observable<DataRequest>{
        return RxAlamofire.request(
            method,
            path,
            parameters: parameters,
            encoding: encoding,
            headers: headers)
    }
    
    public func rxResponse()->Observable<(HTTPURLResponse, Data)> {
        return rxRequest().flatMap{
            $0.rx.responseData()
        }
    }
}

