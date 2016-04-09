//
//  SearchCityVC.swift
//  weatherApp
//
//  Created by Christella on 4/8/16.
//  Copyright © 2016 Christella. All rights reserved.
//

import UIKit

class SearchCityVC: UIViewController {
    
    var resultSearchController: UISearchController? = nil
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let locationSearchTableVC = storyboard!.instantiateViewControllerWithIdentifier("LocationSearchTable") as! LocationSearchTableVC
        resultSearchController = UISearchController(searchResultsController: locationSearchTableVC)
        resultSearchController?.searchResultsUpdater = locationSearchTableVC
        
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = resultSearchController?.searchBar
        
        resultSearchController?.hidesNavigationBarDuringPresentation = false
        resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        
    }

}


