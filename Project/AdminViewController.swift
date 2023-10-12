//
//  AdminViewController.swift
//  Kursach
//
//  Created by Дарья Шубич on 7.11.22.
//

import UIKit

class AdminViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func goEditAccounts(_ sender: Any) {
        let newVC = storyboard?.instantiateViewController(withIdentifier: "AccountsTableViewController")
        navigationController?.pushViewController(newVC!, animated: true)
    }
    @IBAction func goDataPage(_ sender: Any) {
        let newVC = storyboard?.instantiateViewController(withIdentifier: "DataTableViewController")
        navigationController?.pushViewController(newVC!, animated: true)
    }
    
}
