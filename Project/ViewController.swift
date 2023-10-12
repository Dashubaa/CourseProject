import UIKit
import RealmSwift

class ViewController: UIViewController {
    @IBOutlet var GoOutlet: UIButton!
    @IBOutlet var userOutlet: UIButton!
    @IBOutlet var abminOutlet: UIButton!
    var passForUser = String()
    var logForUser = String()
    var logForAdmin = String()
    var passForAdmin = String()
    var passwordFor = String()
    var loginFor = String()
    var correctLogin: Bool = false
    var check: Bool = false
    let realm = try! Realm()
    let admin = Role(login: "admin", password: String("admin"), role: "admin")
    override func viewDidLoad() {
        print("Realm is located at:", realm.configuration.fileURL!)
        super.viewDidLoad()
        print("Realm is located at:", realm.configuration.fileURL!)
        self.GoOutlet.isUserInteractionEnabled = false
        userArray = realm.objects(Role.self)
        for i in userArray {
            if i.login == admin.login && i.password == admin.password {
                check = true
                break
            }
        }
        if check == false {
            try! realm.write {
                realm.add(admin)
            }
        }
    }
    // MARK: Buttons
    @IBAction func userButton(_ sender: Any) {
        self.loginFor = self.alertLogin(title: "Login", message: "Enter Login", style: .alert, loginFor: loginFor)
    }
    @IBAction func adminButton(_ sender: Any) {
        self.passwordFor = self.alert(title: "Password", message: "Enter password", style: .alert, passwordFor: passwordFor)
    }
    
    // Go to user or admin screen
    @IBAction func GoButton(_ sender: UIButton) {
        if  (passwordFor == self.passForAdmin && loginFor == self.passForAdmin){
            user = false
            let newVC = storyboard?.instantiateViewController(withIdentifier: "AdminViewController")
            navigationController?.pushViewController(newVC!, animated: true)
        }
        if (passwordFor == passForUser && loginFor == logForUser){
            user = true
            let newVC = storyboard?.instantiateViewController(withIdentifier: "DataTableViewController")
            navigationController?.pushViewController(newVC!, animated: true)
        }
    }
    // MARK: Alert
    // Password
    func alert(title: String, message: String, style: UIAlertController.Style, passwordFor: String) -> String {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Enter", style: .default){ [self](action) in
            let text = alertController.textFields?.first
            self.passwordFor = String(text?.text ?? "")
            for i in userArray {
                if i.password == self.passwordFor{
                    
                    if i.role != "admin"{
                        self.passForUser = i.password
                        print("eeee")
                    } else {
                        self.passForAdmin = i.password
                        
                    }
                    if self.correctLogin{
                        self.GoOutlet.isUserInteractionEnabled = true
                    } else {
                        self.GoOutlet.isUserInteractionEnabled = false
                    }
                    break
                }
               
            }
        }
        
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true)
        return passwordFor
    }
    // Login
    func alertLogin(title: String, message: String, style: UIAlertController.Style, loginFor: String) -> String {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Enter", style: .default){[self](action) in
            let text = alertController.textFields?.first
            self.loginFor = String(text?.text ?? "")
            for i in userArray {
                if i.login == self.loginFor{
                    if i.role != "admin"{
                        self.logForUser = i.login
                    } else {
                        self.logForAdmin = i.login
                    }
                    self.correctLogin = true
                    break
                }
            }
        }
        alertController.addTextField(configurationHandler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true)
        return loginFor
    }
}
