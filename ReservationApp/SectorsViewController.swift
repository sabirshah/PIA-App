//
//  SectorsViewController.swift
//  ReservationApp
//
//  Created by Sabir Shah on 7/18/16.
//  Copyright © 2016 Pakistan International Airlines. All rights reserved.
//

import UIKit

extension SectorsViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    
}

class SectorsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    @IBOutlet var sectorsTableView: UITableView!        //Outlet varible to reference tableView
    var searchController:UISearchController!            //SearchController reference
    var filteredSectors = [String]()                    //Filtered Sectors Array
    var sectorCode:String = "0"
    var sectors = [String]()
    var sectorsDict = [String: [String]]()
    var sectorsSectionTitles = [String]()
    var sectorType = SectorsType.origin
    var SelectedOrigin : Origin?
    var searchResults:[Origin] = []
    
    
    
    var delegate:sectorSelectionDelegate?
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        
        filteredSectors = sectors.filter { sector in
            return sector.lowercased().contains(searchText.lowercased())
        
        }

        
        print("Filtered Sectors \(filteredSectors)")
        sectorsTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if self.sectorType == SectorsType.origin
        {
            sectors = Origin.OriginNames
        }
        else if self.sectorType == SectorsType.destination{
            
            sectors = SelectedOrigin!.Destinations.map{$0.Name!}
        }
        
        print("Sectors Count \(sectors.count)")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchController = UISearchController(searchResultsController: nil)
        sectorsTableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        searchController.becomeFirstResponder()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func StopButton(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

    

     func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        //If user searches then return filtered Sectors count
        if searchController.isActive && searchController.searchBar.text != "" {
            print("Filtered Sectors count \(filteredSectors.count)")
            return filteredSectors.count
        }
       return sectors.count
    }
    

    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        var selectedOrigin: String = ""
        
        if searchController.isActive && searchController.searchBar.text != "" {
            
            selectedOrigin = filteredSectors[(indexPath as NSIndexPath).row]
            cell.textLabel?.text = selectedOrigin

        } else {
            
            selectedOrigin = sectors[(indexPath as NSIndexPath).row]
            cell.textLabel?.text = selectedOrigin

        
        }
       
        return cell
        
        
        }


    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let indexPath = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath)! as UITableViewCell

        if searchController.isActive && searchController.searchBar.text != "" {
           
            if self.sectorType == SectorsType.origin
            {
                let index = Origin.sharedOrigins.index(where: { (origin) -> Bool in
                    origin.Name == currentCell.textLabel!.text!
                })
                self.delegate?.selectedOrigin(Origin.sharedOrigins[index!])
                searchController.isActive=false


            }
            else
            {
                let index = SelectedOrigin!.Destinations.index(where: { (origin) -> Bool in
                    origin.Name == currentCell.textLabel!.text!
                })
                self.delegate?.selectedDestination(SelectedOrigin!.Destinations[index!])
                searchController.isActive=false

            }
            
        }else{
            
            if self.sectorType == SectorsType.origin
            {
                let origin = Origin.sharedOrigins[ sectors.index(of: currentCell.textLabel!.text!)!]
                self.delegate?.selectedOrigin(origin)
                searchController.isActive=false


            }
            else
            {
                let destination =  SelectedOrigin!.Destinations[sectors.index(of: currentCell.textLabel!.text!)!]
                
                self.delegate?.selectedDestination(destination)
                searchController.isActive=false

            }
            
        }
        
        self.dismiss(animated: true, completion: nil)

        
    }
    
 
    
}
