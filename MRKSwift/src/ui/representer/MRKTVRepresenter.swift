//
//  MRKTVRepresenter.swift
//  MRKSwift
//
//  Created by MRKTrace on 1/9/18.
//

import Foundation

public protocol MRKTVRepresenterProtocol {
    
    func registerRepresenter( _ tv : UITableView )
    
    func reuseCellFor(tv:UITableView, at index:IndexPath, with data:Any )->UITableViewCell
    
    func canRepresent( _ data : Any ) -> Bool
}

open class MRKTVRepresenter<C,D> : NSObject, MRKTVRepresenterProtocol where C : UITableViewCell , D : Any {

    public func registerRepresenter(_ tv: UITableView) {
        tv.registerClassNib(C.self)
    }
    
    //MARK : - Protocol
    
    public func reuseCellFor(tv: UITableView, at index: IndexPath, with data: Any) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(C.self, for: index)
        return representCellFor(tv: tv, at: index, in: cell, with: data as! D)
    }
    
    public func canRepresent(_ data: Any) -> Bool {
        return data is D
    }
    
    
    //MARK : - Override
    
    open func representCellFor(tv:UITableView, at index:IndexPath, in cell:C, with data:D )->C{
        return cell
    }
}
