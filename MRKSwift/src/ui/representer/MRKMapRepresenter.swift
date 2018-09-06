//
//  MRKMapRepresenter.swift
//  MRKSwift
//
//  Created by MRKTrace on 4/9/18.
//

import MapKit

public protocol MRKMapRepresenterProtocol {
    
    func reuseAnnotationFor(map:MKMapView, at annotation:MKAnnotation )->MKAnnotationView
    
    func canRepresent( _ data : MKAnnotation ) -> Bool
}

open class MRKMapRepresenter<A,V>: NSObject, MRKMapRepresenterProtocol where A : MKAnnotation, V : MKAnnotationView {

    //MARK : - MRKMapRepresenterProtocol
    
    public func reuseAnnotationFor(map: MKMapView, at annotation: MKAnnotation) -> MKAnnotationView {
        if let reused = map.dequeueReusableAnnotationView(withIdentifier: V.className) as? V {
            return self.annotationView(for: reused, with: annotation as! A)
        }else{
            let view = nibInit(V.self)!
            return self.annotationView(for: view, with: annotation as! A)
        }
    }
    
    public func canRepresent(_ data: MKAnnotation) -> Bool {
        return data is A
    }
    
    //MARK : - Override
    
    open func annotationView(for annotationView:V, with annotation:A )->V {
        return annotationView
    }
}
