//
//  Rx+Mappable.swift
//  MRKSwift
//
//  Created by MRKTrace on 3/8/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import Foundation

import RxSwift
import RxAlamofire
import ObjectMapper

fileprivate let mappingError = NSError(
    domain: "MAPPING ERROR",
    code: -1,
    userInfo: [NSLocalizedDescriptionKey: "Object can't be mapped"]
)

extension ObservableType {
    public func flatMappable<T:Mappable>(_ mappableType:T.Type) -> Observable<T>{
        return flatMap{ data -> Observable <T> in
            guard let mappedResult = Mapper<T>().map(JSONObject: data) else {
                throw mappingError
            }
            return Observable.just(mappedResult)
        }
    }
    
    public func flatMappableArray<T:Mappable>(_ mappableType:T.Type) -> Observable<[T]>{
        return flatMap{ data -> Observable <[T]> in
            guard let mappedResult = Mapper<T>().mapArray(JSONObject: data) else {
                throw mappingError
            }
            return Observable.just(mappedResult)
        }
    }
}
