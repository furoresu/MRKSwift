//
//  MRKGenericMapViewModel.swift
//  MRKSwift
//
//  Created by MRKTrace on 6/9/18.
//

import MapKit

open class MRKGenericMapViewModel : NSObject , MKMapViewDelegate {
    
    //MARK - Override
    
    open var representers : [MRKMapRepresenterProtocol] {
        return []
    }
    
    @available(iOS 11, *)
    
    open var clusterRepresenters : [MRKMapClusterRepresenterProtocol] {
        return []
    }
    
    //MARK : - MKMapViewDelegate
    
    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if #available(iOS 11, *), let cluster = annotation as? MKClusterAnnotation {
            for rep in clusterRepresenters {
                if rep.canRepresent(cluster.memberAnnotations){
                    return rep.reuseAnnotationFor(map: mapView, for: cluster.memberAnnotations)
                }
            }
        }
        
        for rep in representers {
            if rep.canRepresent(annotation){
                return rep.reuseAnnotationFor(map: mapView, at: annotation)
            }
        }
        return nil
    }    
}
