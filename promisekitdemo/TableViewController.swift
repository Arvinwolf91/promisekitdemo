//
//  TableViewController.swift
//  promisekitdemo
//
//  Created by Arvin Sanmuga Rajah on 26/02/2018.
//  Copyright © 2018 Arvin Sanmuga Rajah. All rights reserved.
//

import UIKit
import PromiseKit

class TableViewController: UITableViewController {
    
    var contacts = [Contact]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIService.getContactList()
            .then { response -> Void in
                print(response)
                
                for (_,contact) in (response.contacts.enumerated()) {
                    self.contacts.append(contact)
                    self.tableView.reloadData()
                }
                
            } .catch { error in
                print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row].name
        cell.detailTextLabel?.text = contacts[indexPath.row].email
        return cell
    }
}




