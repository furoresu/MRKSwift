//
//  MRKCVDatasource.swift
//  MRKSwift
//
//  Created by MRKTrace on 3/9/18.
//

import Foundation

open class MRKCVDatasource : NSObject, UICollectionViewDataSource {
    
    open var data:[[Any]]?{
        didSet{
            collectionView?.reloadData()
        }
    }
    
    open var representers : [MRKCVRepresenterProtocol] {
        return []
    }
    
    public weak var collectionView:UICollectionView? {
        didSet{
            guard let cv = self.collectionView else{ return }
            cv.dataSource = self
            representers.forEach{ $0.registerRepresenter(cv)}
        }
    }
    
    //MARK : - UITableViewDatasource
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?[section].count ?? 0
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data?.count ?? 0
    }
    
    //MARK : - Utils
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = self.data![indexPath.section][indexPath.row]
        for rep in representers {
            if rep.canRepresent(data){
                return rep.reuseCellFor(cv: collectionView, at: indexPath, with: data)
            }
        }
        return UICollectionViewCell()
    }
}
