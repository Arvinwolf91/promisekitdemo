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
    
    var reposA = [RepositoryA]()
    var reposB = [RepositoryB]()
    var showRepositoryA:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showRepoOne(_ sender: Any) {
        showRepositoryA = true
        reposB.removeAll()
        getRepositoryA()
    }
    
    @IBAction func showRepoTwo(_ sender: Any) {
        showRepositoryA = false
        reposA.removeAll()
        getRepositoryB()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if showRepositoryA {
            return reposA.count
        } else {
            return reposB.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if showRepositoryA {
            cell.textLabel?.text = reposA[indexPath.row].name
            cell.detailTextLabel?.text = reposA[indexPath.row].full_name
        } else {
            cell.textLabel?.text = reposB[indexPath.row].name
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
}

extension RepoTableViewController {
    
    func getRepositoryA() {
        
        APIService.request(request: .getAlexGrayRepos)
            .then { response -> Void in
                
                for (_,repo) in (response.reposA.enumerated()) {
                    self.reposA.append(repo)
                    self.tableView.reloadData()
                }
                
            } .catch { error in
                print(error)
        }
    }
    
    func getRepositoryB() {
        
        APIService.request(request: .getArvinWolf91Repos)
            .then { response -> Void in
                
                for (_,repo) in (response.reposB.enumerated()) {
                    self.reposB.append(repo)
                    self.tableView.reloadData()
                }
                
            } .catch { error in
                print(error)
        }
    }
    
}

