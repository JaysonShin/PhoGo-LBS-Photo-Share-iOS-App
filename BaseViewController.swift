//
//  BaseViewController.swift
//  PhoGo
//
//  Created by Gilbert Gao on 11/29/16.
//  Copyright © 2016 gb. All rights reserved.
//

import Foundation
import UIKit
import CoreData

// Base class responsible to hold all commons functions and properties for 
// the two view controllers of this project
//
class BaseViewController: UIViewController {
    
    // Core data shared context
    lazy var sharedContext: NSManagedObjectContext = {
        return CoreDataStackManager.sharedInstance().managedObjectContext
        }()
    
    // save the context and handle the error if it occurrs
    func saveContext() {
        do {
            try CoreDataStackManager.sharedInstance().saveContext()
        } catch {
            showErrorAlert("Failed to save the information!")
        }
    }
    
    // show the error alert to the user
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler:nil))
        presentViewController(alert, animated: true, completion: nil)
    }
}
