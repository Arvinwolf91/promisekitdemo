//
//  RepoTableViewController.swift
//  promisekitdemo
//
//  Created by Arvin Sanmuga Rajah on 27/02/2018.
//  Copyright © 2018 Arvin Sanmuga Rajah. All rights reserved.
//

import UIKit
import PromiseKit

class RepoTableViewController: UITableViewController {
    
    var repos = [Repo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRepoList()
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
        return repos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = repos[indexPath.row].name
        cell.detailTextLabel?.text = repos[indexPath.row].full_name
        return cell
    }
}

extension RepoTableViewController {
    
    func getRepoList() {
        
        APIService.getRepoList()
            .then { response -> Void in
                
                for (_,repo) in (response.repos.enumerated()) {
                    self.repos.append(repo)
                    self.tableView.reloadData()
                }
                
            } .catch { error in
                print(error)
        }
    }
    
}

