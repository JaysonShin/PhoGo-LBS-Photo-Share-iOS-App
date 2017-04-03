//
//  CustomLengthTableViewCell.swift
//  PhoGo
//
//  Created by Gilbert Gao on 11/26/16.
//  Copyright © 2016 gb. All rights reserved.
//

import UIKit

class CustomLengthTableViewCell: UITableViewCell, UITextFieldDelegate {
    @IBOutlet weak var customLengthInput: UITextField!
    @IBOutlet weak var customUnitInput: UITextField!

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true;
    }
}
