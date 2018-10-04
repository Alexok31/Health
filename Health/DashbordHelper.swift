//
//  DashbordHelper.swift
//  Health
//
//  Created by Александр Харченко on 10/5/18.
//  Copyright © 2018 Александр Харченко. All rights reserved.
//

import Foundation


class DashbordHelper {
    
    func dailyRateInPercent(steps: Int, completion: @escaping (Int) -> ()) {
        let dailyRate = 10000
        let dailyPercentage = (steps * 100) / dailyRate
        completion(dailyPercentage)
    }
    
}
