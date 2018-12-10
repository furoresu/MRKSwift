//
//  MRKRequestPOST.swift
//  MRKSwift
//
//  Created by MRKTrace on 3/8/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import Foundation
import Alamofire

open class MRKRequestPOST : MRKRequestBase {
    public init( _ path : String, params : [String:Any] = [:], headers: HTTPHeaders = [:] ){
        super.init(path, method: .post, params: params, headers: headers)
    }
}
