import UIKit
import RealmSwift
class AddProjectTableViewController: UITableViewController {
    @IBOutlet var addButtonOutlel: UIButton!
    @IBOutlet var projectNameTextField: UITextField!
    @IBOutlet var worker1: UITextField!
    @IBOutlet var count1: UITextField!
    @IBOutlet var cost1: UITextField!
    @IBOutlet var worker2: UITextField!
    @IBOutlet var count2: UITextField!
    @IBOutlet var cost2: UITextField!
    @IBOutlet var worker3: UITextField!
    @IBOutlet var count3: UITextField!
    @IBOutlet var cost3: UITextField!
    @IBOutlet var worker4: UITextField!
    @IBOutlet var count4: UITextField!
    @IBOutlet var cost4: UITextField!
    var isDataEdit = false
    var editItemTo: Project!
    var indexForEdit: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isDataEdit == true {
            projectNameTextField.text = editItemTo.nameProject
            worker1.text = editItemTo.workerName
            worker2.text = editItemTo.workerName2
            worker3.text = editItemTo.workerName3
            worker4.text = editItemTo.workerName4
            cost1.text = editItemTo.costOfHour
            cost2.text = editItemTo.costOfHour2
            cost3.text = editItemTo.costOfHour3
            cost4.text = editItemTo.costOfHour4
            count1.text = editItemTo.hoursOfWork
            count2.text = editItemTo.hoursOfWork2
            count3.text = editItemTo.hoursOfWork3
            count4.text = editItemTo.hoursOfWork4
        }
    }
    
    @IBAction func GoMainScreen(_ sender: Any) {
        let newVC = storyboard?.instantiateViewController(withIdentifier: "ViewController")
        navigationController?.pushViewController(newVC!, animated: true)
    }
    
    @IBAction func AddButton(_ sender: Any) {
        let item = Project(nameProject: projectNameTextField.text!, workerName: worker1?.text ?? "nil", hoursOfWork: count1?.text ?? "1", costOfHour: cost1?.text ?? "1", workerName2: worker2?.text ?? "nil", workerName3: worker3?.text ?? "nil", workerName4: worker4?.text ?? "nil", costOfHour2: cost2?.text ?? "1", costOfHour3: cost3?.text ?? "1", costOfHour4: cost4?.text ?? "1", houseOfWork2: count2?.text ?? "1", houseOfWork3: count3?.text ?? "1", houseOfWork4: count4?.text ?? "1")
        let realm = try! Realm()
        if isDataEdit == false{
            try! realm.write {
                realm.add(item)
            }
        } else {
            try! realm.write {
                realm.delete(itemArray[indexForEdit])
                realm.add(item)
            }
        }
        let newVC = storyboard?.instantiateViewController(withIdentifier: "DataTableViewController") as! DataTableViewController
        navigationController?.pushViewController(newVC, animated: true)
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

