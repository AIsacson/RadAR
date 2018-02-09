//
//  LocationSearchTable.swift
//  RadAR
//
//  Created by Anna Isacson on 2018-02-09.
//  Edited by Anna Isacson on 2018-02-09.
//  Copyright © 2018 RadAR. All rights reserved.
//

import UIKit
import MapKit

class LocationSearchTable : UITableViewController {
    var places = [Places]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        places = [
            Places(place:"Kista Galleria", coordinate: CLLocationCoordinate2D(latitude: 59.40232025235509, longitude: 17.945716381072998)),
            Places(place:"Skatteverket", coordinate: CLLocationCoordinate2D(latitude: 59.406120928518156, longitude: 17.94839859008789))]
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(places.count)
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: "cell")
        cell.textLabel?.text = places[indexPath.row].place
        return(cell)
    }
}

extension LocationSearchTable : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
    }
}
