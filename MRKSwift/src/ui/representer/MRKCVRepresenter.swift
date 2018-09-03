//
//  MRKCVRepresenter.swift
//  MRKSwift
//
//  Created by MRKTrace on 3/9/18.
//

import Foundation

public protocol MRKCVRepresenterProtocol {
    
    func registerRepresenter( _ cv : UICollectionView )
    
    func reuseCellFor(cv:UICollectionView, at index:IndexPath, with data:Any )->UICollectionViewCell
    
    func canRepresent( _ data : Any ) -> Bool
}

open class MRKCVRepresenter<C,D> : NSObject, MRKCVRepresenterProtocol where C : UICollectionViewCell , D : Any {
    
    public func registerRepresenter(_ cv: UICollectionView) {
        cv.registerClassNib(C.self)
    }
    
    //MARK : - Protocol
    
    public func reuseCellFor(cv: UICollectionView, at index: IndexPath, with data: Any) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(C.self, for: index)
        return representCellFor(cv: cv, at: index, in: cell, with: data as! D)
    }
    
    public func canRepresent(_ data: Any) -> Bool {
        return data is D
    }
    
    
    //MARK : - Override
    
    open func representCellFor(cv:UICollectionView, at index:IndexPath, in cell:C, with data:D )->C{
        return cell
    }
}
