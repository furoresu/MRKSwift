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
import ObjectMapper

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
    
    //MARK : - MAPPING
    
    open func rxResponseJSON() -> Observable<(HTTPURLResponse, [String:Any])> {
        return rxResponse().map{ (response:HTTPURLResponse, any:Any) in
            guard let data = any as? [String:Any] else{
                throw NSError(
                    domain: "mapping",
                    code: 0,
                    userInfo: [
                        "reason" : "the object was not a json"
                    ])
            }
            return (response, data)
        }
    }
    
    open func rxResponseMappable<T:BaseMappable>( _ class : T.Type )->Observable<(HTTPURLResponse, T)> {
        return rxResponseJSON().map{ (response:HTTPURLResponse, data:[String:Any]) in
            guard let obj = Mapper<T>().map(JSON: data) else{
                throw NSError(
                    domain: "mapping",
                    code: 0,
                    userInfo: [
                        "reason" : "the object was not \(T.self)"
                    ])
            }
            return (response, obj)
        }
    }
}

