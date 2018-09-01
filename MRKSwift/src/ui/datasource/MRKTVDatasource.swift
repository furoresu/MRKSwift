//
//  MRKTVDatasource.swift
//  MRKSwift
//
//  Created by MRKTrace on 1/9/18.
//

import Foundation

open class MRKTVDatasource : NSObject, UITableViewDataSource {
    
    open var data:[[Any]]?{
        didSet{
            tableView?.reloadData()
        }
    }
    
    open var representers : [MRKTVRepresenterProtocol] {
        return []
    }
    
    public weak var tableView:UITableView? {
        didSet{
            guard let tv = self.tableView else{ return }
            tv.dataSource = self
            representers.forEach{ $0.registerRepresenter(tv)}
        }
    }

    //MARK : - UITableViewDatasource
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?[section].count ?? 0
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return data?.count ?? 0
    }
    
    //MARK : - Utils
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = self.data![indexPath.section][indexPath.row]
        for rep in representers {
            if rep.canRepresent(data){
                return rep.reuseCellFor(tv: tableView, at: indexPath, with: data)
            }
        }
        return UITableViewCell()
    }
}
