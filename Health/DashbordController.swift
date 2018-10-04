//
//  ViewController.swift
//  Health
//
//  Created by Александр Харченко on 10/4/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import UIKit
import UICircularProgressRing

class DashbordController: UIViewController {

    @IBOutlet weak var walkingProgress: UICircularProgressRingView!
    @IBOutlet weak var runningProgress: UICircularProgressRingView!
    
    @IBOutlet weak var walkingDay: UICircularProgressRingView!
    @IBOutlet weak var runningDay: UICircularProgressRingView!
    
    @IBOutlet weak var numderOfStepsPerDay: UILabel!
    @IBOutlet weak var numberOfStepsWalking: UILabel!
    @IBOutlet weak var numberOfStepsRunning: UILabel!
    @IBOutlet weak var lowerPressureLabel: UILabel!
    @IBOutlet weak var upperPressureLabel: UILabel!
    
    let dashbordHelper = DashbordHelper()
    
    let runningSteps = 5000
    let walkingSteps = 1100
    let lowerPressure = 260
    let upperPressure = 120
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dailyWalkingSteps()
        dailyRunningSteps()
        setupLabel()
    }
    
    func setupLabel() {
        numderOfStepsPerDay.text = "\(walkingSteps + runningSteps)"
        numberOfStepsWalking.text = "\(walkingSteps)"
        numberOfStepsRunning.text = "\(runningSteps)"
        lowerPressureLabel.text = "\(lowerPressure)"
        upperPressureLabel.text = "\(upperPressure)"
    }
    

    func dailyWalkingSteps() {
        dashbordHelper.dailyRateInPercent(steps: walkingSteps) { (walkingPercentage) in
            let percent = CGFloat(walkingPercentage)
            self.walkingProgress.value = percent
            self.walkingDay.value = percent
           
            self.runningProgress.startAngle = CGFloat((Double(walkingPercentage) * 3.6) - 90)
        }
    }
    
    func dailyRunningSteps() {
        dashbordHelper.dailyRateInPercent(steps: runningSteps) { (runningSteps) in
            let percent = CGFloat(runningSteps)
            self.runningProgress.value = percent
            self.runningDay.value = percent
            
        }
    }
    
}

