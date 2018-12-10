//
//  MRKRequestGET.swift
//  MRKSwift
//
//  Created by MRKTrace on 3/8/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import Foundation
import Alamofire

open class MRKRequestGET : MRKRequestBase {
    public init( _ path : String, params : [String:Any] = [:], headers: HTTPHeaders = [:] ){
        super.init(path, method: .get, params: params, headers: headers)
    }
}
