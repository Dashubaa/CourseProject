//
//  AccountsTableViewController.swift
//  Kursach
//
//  Created by Дарья Шубич on 5.12.22.
//

import UIKit
import RealmSwift
class AccountsTableViewController: UITableViewController {

    @IBOutlet var AddAccountOutlet: UIButton!
    let realm1 = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func AddAccountsButton(_ sender: Any) {
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "AccAddTableViewController")
        navigationController?.pushViewController(newVC!, animated: true)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let accCell = tableView.dequeueReusableCell(withIdentifier: "AccCell", for: indexPath) as? AccountsTableViewCell{
            let item = userArray[indexPath.row]
            accCell.refresh(item)
            return accCell
        }
        return UITableViewCell()
    }

    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    // Editing and Delete
    
        override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
                let deleteItem = userArray[indexPath.row]
            
                let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in

                        try! self.realm1.write {
                            self.realm1.delete(deleteItem)
                        }
                        tableView.deleteRows(at: [indexPath], with: .left)

                }
            
            let edit = UIContextualAction(style: .normal, title: "Edit"){ _, _, _ in
                    let newVC = self.storyboard?.instantiateViewController(withIdentifier: "AccAddTableViewController") as! AccAddTableViewController
                    newVC.isDataEdit = true
                    let editItem = userArray[indexPath.row]
                    let indexForEdit1 = indexPath.row
                    newVC.editItemTo = editItem
                    newVC.indexForEdit = indexForEdit1
                    self.navigationController?.pushViewController(newVC, animated: true)
                }
                let swipe = UISwipeActionsConfiguration(actions: [edit, delete])
                return swipe
        }
}
