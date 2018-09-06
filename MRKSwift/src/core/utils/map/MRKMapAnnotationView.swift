//
//  MRKMapAnnotationView.swift
//  MRKSwift
//
//  Created by MRKTrace on 5/9/18.
//

import MapKit

open class MRKMapAnnotationView : MKAnnotationView {
    override open var reuseIdentifier: String? {
        return type(of: self).className
    }
}
