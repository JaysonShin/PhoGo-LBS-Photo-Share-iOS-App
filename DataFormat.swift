//
//  DataFormat.swift
//  PhoGo
//
//  Created by Gilbert Gao on 11/26/16.
//  Copyright © 2016 gb. All rights reserved.
//

import Foundation

func formatDate(date: NSDate) ->  String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MMM d, yyyy, HH:mm"
    let dateStr = dateFormatter.stringFromDate(date)
    return dateStr
}
