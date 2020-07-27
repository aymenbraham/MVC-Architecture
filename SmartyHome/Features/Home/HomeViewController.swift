//
//  HomeViewController.swift
//  SmartyHome
//
//  Created by aymen braham on 26/07/2020.
//  Copyright © 2020 AymenBraham. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var listeRoomTableView: UITableView!
    
    // MARK: Variables
    let listRooms = [Room(roomName: "Living Room", numberDevice: 4, image: "livingroom"),
                     Room(roomName: "Media Room", numberDevice: 6, image: "mediaroom"),
                     Room(roomName: "Bath Room", numberDevice: 1, image: "bathroom"),
                     Room(roomName: "Bed Room", numberDevice: 3, image: "bedroom")]
    
    var name: String = ""
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        name = UserDefaults.standard.value(forKey: "userName") as! String
    }
    
    // MARK: SetUp TableView
    public func setupTableView() {
             // Registre Cell
            listeRoomTableView.register(DateViewCell.self, forCellReuseIdentifier: "DateViewCell")
            listeRoomTableView.register(RoomsViewCell.self, forCellReuseIdentifier: "RoomsViewCell")
            // Datasource
            listeRoomTableView.dataSource = self
            // Delegate
            listeRoomTableView.delegate = self
            listeRoomTableView.separatorStyle = .none
            listeRoomTableView.reloadData()
          }
    

}

// MARK: TableView Delegate && DataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 2
     }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return listRooms.count
        }
        
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0  {
            return 80
        } else {
            return 160
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = Bundle.main.loadNibNamed("DateViewCell", owner: self, options: nil)?.first as? DateViewCell
            guard let currentcell = cell else {
            fatalError("Error with the identifier of this cell")
                }
            currentcell.selectionStyle = .none
            currentcell.configCell(name: name)
            return currentcell
        } else {
            let cell = Bundle.main.loadNibNamed("RoomsViewCell", owner: self, options: nil)?.first as? RoomsViewCell
            guard let currentcell = cell else {
            fatalError("Error with the identifier of this cell")
                }
            currentcell.selectionStyle = .none
            currentcell.populateRooms(listRooms: listRooms, indexPath: indexPath)
            return currentcell
        }
    }
    
}
