//
//  ChannelInvitationTableViewCell.swift
//  PhoGo
//
//  Created by Gilbert Gao on 11/26/16.
//  Copyright © 2016 gb. All rights reserved.
//

import UIKit

class ChannelInvitationTableViewCell: UITableViewCell {
    
    // MARK: - Properties
   
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userDescription: UILabel!
    @IBAction func inviteButton(sender: UIButton) {
        if let username = name.text, id = channelID {
            invite(username, channelID: id)
        }
    }
    
    var channelID: Int?
    var channelInvitationTableViewController: ChannelInvitationTableViewController?
    
    private func invite(username: String, channelID: Int) {
        
        let url:NSURL = NSURL(string: SharingManager.Constant.addMemberToChannelURL)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let param: [String: AnyObject] = ["username_to_be_added": username, "channel_id": channelID]
        
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(param, options: .PrettyPrinted)
        } catch {
            print("error serializing JSON: \(error)")
        }
        
        let task = session.dataTaskWithRequest(request) {
            (let data, let response, let error) in
            
            guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
                print("error: \(error)")
                return
            }
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as! NSDictionary
                if let message = json["message"] as? String {
                    dispatch_async(dispatch_get_main_queue(), {
                        let inviteUserAlert = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
                        inviteUserAlert.addAction(UIAlertAction(title: "Close", style: .Cancel, handler: nil))
                        if let tableViewController = self.channelInvitationTableViewController {
                            tableViewController.presentViewController(inviteUserAlert, animated: true, completion: nil)
                        }
                    })
                }
            } catch {
                print("error serializing JSON: \(error)")
            }
        }
        task.resume()
    }

}
