//
//  MRKRequestGET.swift
//  MRKSwift
//
//  Created by MRKTrace on 3/8/18.
//  Copyright © 2018 Marc Flores. All rights reserved.
//

import Foundation

public class MRKRequestGET : MRKRequestBase {
    override init() {
        super.init()
        method = .get
    }
}
