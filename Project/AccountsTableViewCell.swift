//
//  AccountsTableViewCell.swift
//  Kursach
//
//  Created by Дарья Шубич on 5.12.22.
//

import UIKit

class AccountsTableViewCell: UITableViewCell {

    @IBOutlet var RoleOutlet: UILabel!
    @IBOutlet var passwordOutlet: UILabel!
    @IBOutlet var loginOutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func refresh(_ model: Role){
        loginOutlet.text = "Login: " + model.login
        passwordOutlet.text = "Password: " + String(model.password.hashValue)
        RoleOutlet.text = model.role
    }
}
