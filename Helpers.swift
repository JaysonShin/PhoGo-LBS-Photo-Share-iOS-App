//
//  Helpers.swift
//  PhoGo
//
//  Created by Gilbert Gao on 11/26/16.
//  Copyright © 2016 gb. All rights reserved.
//
import Foundation
import UIKit

class Helpers {
    static func showLocationFailAlert(viewController: UIViewController) {
        let locationFailAlert = UIAlertController(title: "Enable Location Services", message: "Open Settings\nTap Location\nSelect 'While Using the App'", preferredStyle: .Alert)
        
        let settingsAction = UIAlertAction(title: "Settings", style: .Default) { (alertAction) in
            if let appSettings = NSURL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.sharedApplication().openURL(appSettings)
            }
        }
        
        locationFailAlert.addAction(settingsAction)
        locationFailAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        viewController.presentViewController(locationFailAlert, animated: true, completion: nil)
    }
}
