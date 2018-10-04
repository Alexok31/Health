//
//  Pedometer.swift
//  Health
//
//  Created by Александр Харченко on 10/4/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation
import CoreMotion

class Pedometer {
    
    private let activityManager = CMMotionActivityManager()
    private let pedometer = CMPedometer()
    
    private func startTrackingActivityType() {
        activityManager.startActivityUpdates(to: OperationQueue.main) { (activity: CMMotionActivity?) in
             guard let activity = activity else { return }
            DispatchQueue.main.async {
                print(activity.walking)
            }
        }
    }
    
    private func startCountingSteps() {
        pedometer.startUpdates(from: Date(), withHandler: { (pedometerData, error) in
            guard let pedometerData = pedometerData, error == nil else { return }
            let numberOfSteps = pedometerData.numberOfSteps.stringValue
            DispatchQueue.main.async {
               print(numberOfSteps)
            }
        })
    }
    
    private func startUpdating() {
        if CMMotionActivityManager.isActivityAvailable() {
            startTrackingActivityType()
        }
        
        if CMPedometer.isStepCountingAvailable() {
            startCountingSteps()
        }
    }
}
