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
    public var method: HTTPMethod!
    public var encoding: ParameterEncoding!

    //MARK : - Public
    
    public init( _ path : String , method : HTTPMethod, params : [String:Any] = [:], headers: HTTPHeaders = [:], encoding: ParameterEncoding! = URLEncoding.default  ){
        self.path = path
        self.method = method
        self.parameters = params
        self.headers = headers
        self.encoding = encoding
    }
    
    open func rxRequest()->Observable<DataRequest>{
        return RxAlamofire.request(
            method,
            path,
            parameters: parameters,
            encoding: encoding,
            headers: headers)
    }
    
    open func rxResponse()->Observable<(HTTPURLResponse, Any)> {
        return rxRequest().flatMap{
            $0.rx.responseJSON()
        }
    }
}

