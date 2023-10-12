//
//  InfoViewController.swift
//  Kursach
//
//  Created by Дарья Шубич on 20.11.22.
//

import UIKit

class InfoViewController: UIViewController {
  
    @IBOutlet var priceStage4: UILabel!
    @IBOutlet var numberofWork4: UILabel!
    @IBOutlet var cost4: UILabel!
    @IBOutlet var count4: UILabel!
    @IBOutlet var work4: UILabel!
    @IBOutlet var priceStage3: UILabel!
    @IBOutlet var numberWork3: UILabel!
    @IBOutlet var cost3: UILabel!
    @IBOutlet var count3: UILabel!
    @IBOutlet var work3: UILabel!
    @IBOutlet var PriceStage2: UILabel!
    @IBOutlet var numberOfWork2: UILabel!
    @IBOutlet var cost2: UILabel!
    @IBOutlet var count2: UILabel!
    @IBOutlet var work2: UILabel!
    @IBOutlet var PriceStage1: UILabel!
    @IBOutlet var numberWork1: UILabel!
    @IBOutlet var cost1: UILabel!
    @IBOutlet var nameOfProj: UILabel!
    @IBOutlet var work1: UILabel!
    @IBOutlet var count1: UILabel!
    @IBOutlet var finalPrice: UILabel!
    var infoitem: Project!
    var counterOfWorkers: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOfProj.text = infoitem.nameProject
        count1.text = infoitem.hoursOfWork
        count2.text = infoitem.hoursOfWork2
        count3.text = infoitem.hoursOfWork3
        count4.text = infoitem.hoursOfWork4
        cost1.text = infoitem.costOfHour
        cost2.text = infoitem.costOfHour2
        cost3.text = infoitem.costOfHour3
        cost4.text = infoitem.costOfHour4
        work1.text = infoitem.workerName
        work2.text = infoitem.workerName2
        work3.text = infoitem.workerName3
        work4.text = infoitem.workerName4
        PriceStage1.text = String(Double(infoitem.costOfHour)! * Double(infoitem.hoursOfWork)!)
        PriceStage2.text = String(Double(infoitem.costOfHour2)! * Double(infoitem.hoursOfWork2)!)
        priceStage3.text = String(Double(infoitem.costOfHour3)! * Double(infoitem.hoursOfWork3)!)
        priceStage4.text = String(Double(infoitem.costOfHour4)! * Double(infoitem.hoursOfWork4)!)
        finalPrice.text =  String(Double(infoitem.costOfHour)! * Double(infoitem.hoursOfWork)!
        + Double(infoitem.costOfHour2)! * Double(infoitem.hoursOfWork2)!
        + Double(infoitem.costOfHour3)! * Double(infoitem.hoursOfWork3)!
        + Double(infoitem.costOfHour4)! * Double(infoitem.hoursOfWork4)!)
        numberWork1.text = String(workersCount(infoitem.workerName))
        numberOfWork2.text = String(workersCount(infoitem.workerName2))
        numberWork3.text = String(workersCount(infoitem.workerName3))
        numberofWork4.text = String(workersCount(infoitem.workerName4))
    }
    func workersCount(_ workers: String) -> Int {
        counterOfWorkers = 0
        for i in workers {
            if i == ","{
                counterOfWorkers += 1
            }
        }
        return counterOfWorkers+1
    }
}

