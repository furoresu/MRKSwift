//
//  MRKRequestPOST.swift
//  MRKSwift
//
//  Created by MRKTrace on 3/8/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import Foundation

open class MRKRequestPOST : MRKRequestBase {
    override init() {
        super.init()
        method = .post
    }
}
