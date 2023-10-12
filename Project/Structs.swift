import Foundation
import RealmSwift
class Project: Object{
     @Persisted var nameProject: String
     @Persisted var workerName: String
     @Persisted var workerName2: String
     @Persisted var workerName3: String
     @Persisted var workerName4: String
     @Persisted var hoursOfWork: String
     @Persisted var costOfHour: String
     @Persisted var hoursOfWork2: String
     @Persisted var costOfHour2: String
     @Persisted var hoursOfWork3: String
     @Persisted var costOfHour3: String
     @Persisted var hoursOfWork4: String
     @Persisted var costOfHour4: String
    convenience init(nameProject: String, workerName: String, hoursOfWork: String, costOfHour: String, workerName2: String, workerName3: String, workerName4: String, costOfHour2: String, costOfHour3: String, costOfHour4: String, houseOfWork2: String, houseOfWork3: String, houseOfWork4: String) {
        self.init()
        self.nameProject = nameProject
        self.workerName = workerName
        self.hoursOfWork = hoursOfWork
        self.costOfHour = costOfHour
        self.workerName2 = workerName2
        self.workerName3 = workerName3
        self.workerName4 = workerName4
        self.costOfHour2 = costOfHour2
        self.hoursOfWork2 = houseOfWork2
        self.costOfHour3 = costOfHour3
        self.hoursOfWork3 = houseOfWork3
        self.costOfHour4 = costOfHour4
        self.hoursOfWork4 = houseOfWork4
    }
}
var itemArray: Results<Project>!
var user: Bool = false // false - admin true - simpele user

class Role: Object {
        @Persisted var login: String
        @Persisted var password: String
        @Persisted var role: String
        convenience init(login: String, password: String, role: String) {
            self.init()
            self.password = password
            self.login = login
            self.role = role
        }
}
var userArray: Results<Role>!

