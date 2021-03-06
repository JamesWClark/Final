//
//  GetViewController.swift
//  Ops
//
//  Created by J.W. Clark on 12/6/16.
//  Copyright © 2016 J.W. Clark. All rights reserved.
//

import Alamofire
import SwiftyJSON
import UIKit

class GetViewController: UIViewController {
    
    @IBOutlet weak var lblSubject: UILabel!
    @IBOutlet weak var lblDescription: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblSubject.text = ""
        lblDescription.text = ""
        
        let geturl = "http://localhost:3000/tasks"
        
        Alamofire.request(geturl , method: .get, encoding: JSONEncoding(options: [])).responseJSON { response in
            debugPrint(response)
            
            if let result = response.result.value {
                let json = JSON(result as! NSDictionary)
                let tasks = json["data"].arrayValue

                // display only the last task
                let subject = tasks[tasks.count - 1]["subject"].string
                let description = tasks[tasks.count - 1]["description"].string
                self.lblSubject.text = subject
                self.lblDescription.text = description
                
            } else {
                self.lblSubject.text = "Error loading data"
                self.lblDescription.text = "Error loading data"
            }
        }
    }
}
