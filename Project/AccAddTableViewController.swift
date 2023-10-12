//
//  AccAddTableViewController.swift
//  Kursach
//
//  Created by Дарья Шубич on 5.12.22.
//

import UIKit
import RealmSwift
class AccAddTableViewController: UITableViewController, UITextFieldDelegate{

    @IBOutlet var LoginOutlet: UITextField!
    @IBOutlet var PassOutlet: UITextField!
    @IBOutlet var Role: UITextField!
    @IBOutlet var add: UIButton!
    var checkAcc: Bool = true
    var isDataEdit = false
    var editItemTo: Role!
    var indexForEdit: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginOutlet.delegate = self
        if isDataEdit == true {
            LoginOutlet.text = editItemTo.login
            PassOutlet.text = editItemTo.password
        }
        self.add.isUserInteractionEnabled = true
    }
    
    @IBAction func AddEditButton(_ sender: Any) {
        if checkAcc == true{
            let item = Kursach.Role(login: LoginOutlet.text ?? "login", password: String(PassOutlet.text?.hashValue ?? 123) , role: Role.text ?? "user")
            let realm1 = try! Realm()
            if isDataEdit == false{
                try! realm1.write {
                    realm1.add(item)
                }
                
            } else {
                try! realm1.write {
                    realm1.delete(userArray[indexForEdit])
                    realm1.add(item)
                }
            }
            let newVC = storyboard?.instantiateViewController(withIdentifier: "AccountsTableViewController") as! AccountsTableViewController
            navigationController?.pushViewController(newVC, animated: true)
        } else {
            let newVC = storyboard?.instantiateViewController(withIdentifier: "AccountsTableViewController") as! AccountsTableViewController
            navigationController?.pushViewController(newVC, animated: true)
        }
    }
    
    @IBAction func change(_ sender: Any) {
        for i in userArray {
            if i.login == LoginOutlet.text {
                checkAcc = false
            }
        }
    }
    @IBAction func MainScreenButton(_ sender: Any) {
        let newVC = storyboard?.instantiateViewController(withIdentifier: "ViewController")
        navigationController?.pushViewController(newVC!, animated: true)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
 
