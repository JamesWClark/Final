//
//  PostViewController.swift
//  Ops
//
//  Created by J.W. Clark on 12/6/16.
//  Copyright © 2016 J.W. Clark. All rights reserved.
//

import Alamofire
import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var txtSubject: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var lblError: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        lblError.text = "";
    }
    
    @IBAction func btnSend_Tap(_ sender: UIButton) {
        let url = "http://localhost:3000/task"
        
        let params: Parameters = [
            "subject" : txtSubject.text!,
            "description" : txtDescription.text!
        ]
        
        Alamofire.request(url , method: .post, parameters: params, encoding: JSONEncoding.default).responseString { response in
            debugPrint(response)
            
            // todo: check successful creation
            self.txtSubject.text = ""
            self.txtDescription.text = ""
        }
    }
}
