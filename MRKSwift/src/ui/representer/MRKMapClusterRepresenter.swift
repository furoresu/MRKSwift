//
//  MRKMapClusterRepresenter.swift
//  MRKSwift
//
//  Created by MRKTrace on 6/9/18.
//

import MapKit

public protocol MRKMapClusterRepresenterProtocol {
    
    func reuseAnnotationFor(map:MKMapView, for members:[MKAnnotation])->MKAnnotationView
    
    func canRepresent( _ data : [MKAnnotation] ) -> Bool
}

open class MRKMapClusterRepresenter<V>: NSObject, MRKMapClusterRepresenterProtocol where V : MKAnnotationView {
    
    //MARK : - MRKMapRepresenterProtocol
    
    public func reuseAnnotationFor(map: MKMapView, for members:[MKAnnotation]) -> MKAnnotationView {
        if let reused = map.dequeueReusableAnnotationView(withIdentifier: V.className) as? V {
            return self.annotationView(in: reused, for: members)
        }else{
            let view = nibInit(V.self)!
            return self.annotationView(in: view, for: members)
        }
    }
    
    open func canRepresent(_ members: [MKAnnotation]) -> Bool {
        return true
    }
    
    //MARK : - Override
    
    open func annotationView(in annotationView:V, for members:[MKAnnotation] )->V {
        return annotationView
    }
}
