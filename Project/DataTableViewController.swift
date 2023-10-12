import UIKit
import RealmSwift
class DataTableViewController: UITableViewController, UISearchBarDelegate{
    let realm = try! Realm()
    var sortCheck = false
    @IBOutlet var addButtonOutlet: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        itemArray = realm.objects(Project.self)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(sortTapped))
    }
    
    @objc func sortTapped(){
        if self.sortCheck == true {
            itemArray = itemArray!.sorted(byKeyPath: "nameProject", ascending: false)
            sortCheck = false
            
        } else{
            itemArray = itemArray!.sorted(byKeyPath: "nameProject", ascending: true)
            self.sortCheck = true
        }
        tableView.reloadData()
        
    }
    @IBAction func addButton(_ sender: Any) {
        if user == false{
            let newVC = storyboard?.instantiateViewController(withIdentifier: "AddProjectTableViewController")
            navigationController?.pushViewController(newVC!, animated: true)
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return itemArray.count
        }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DataTableViewCell{
            let item = itemArray[indexPath.row]
            cell.refresh(item)
            cell.infoOutlet.tag = indexPath.row
            cell.infoOutlet.addTarget(self, action: #selector(DataTableViewController.infoButtonTapped), for: .touchDown)
            return cell
        }
        return UITableViewCell()
    }
    
    @objc func infoButtonTapped(sender: UIButton){
            let newVC = self.storyboard?.instantiateViewController(withIdentifier: "InfoViewController") as! InfoViewController
        let indexInfoPath = IndexPath(row:sender.tag, section: 0)
        let ind = indexInfoPath.row
        newVC.infoitem = itemArray[ind]
            navigationController?.pushViewController(newVC, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Editing and Delete
    
        override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
                let deleteItem = itemArray[indexPath.row]
                let delete = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
                    if user == false {
                        try! self.realm.write {
                            self.realm.delete(deleteItem)
                        }
                        tableView.deleteRows(at: [indexPath], with: .left)
                    }
                }
    
                let edit = UIContextualAction(style: .normal, title: "Edit"){ _, _, _ in
                    if user == false {
                        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "AddProjectTableViewController") as! AddProjectTableViewController
                        newVC.isDataEdit = true
                        let editItem = itemArray[indexPath.row]
                        let indexForEdit1 = indexPath.row
                        newVC.editItemTo = editItem
                        newVC.indexForEdit = indexForEdit1
                        self.navigationController?.pushViewController(newVC, animated: true)
                    }
                }
                
                let swipe = UISwipeActionsConfiguration(actions: [edit, delete])
                return swipe
        }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

