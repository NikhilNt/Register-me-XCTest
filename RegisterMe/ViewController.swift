//
//  ViewController.swift
//  RegisterMe
//
//  Created by  Nikhil Tanappagol on 11/19/16.
//  Copyright © 2016 Nikhil Tanappagol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField_name: UITextField!

    @IBOutlet weak var textField_email: UITextField!
  
    @IBOutlet weak var default_label: UILabel!
    
    @IBOutlet weak var webview_info: UIWebView!

    @IBAction func OnSubmit(_ sender: Any)
    {
        if((textField_name.text?.isEmpty)! && (textField_email.text?.isEmpty)!)
        {
            default_label.text = "Please enter a valid name and email address"
            default_label.textColor = UIColor.red
        }
        else
        {
            if(textField_name.text?.isEmpty)!
            {
                default_label.text = "Please enter a valid name"
                default_label.textColor = UIColor.red
                
            }
            else{
                
                
                if(textField_email.text?.isEmpty)!
                {
                    default_label.text = "Please enter a valid email address"
                    default_label.textColor = UIColor.red
                
                }
                else{
                    default_label.text = ""
                }
            }
        }
       
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

