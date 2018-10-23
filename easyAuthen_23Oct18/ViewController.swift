//
//  ViewController.swift
//  easyAuthen_23Oct18
//
//  Created by Kuntapon Tanikkool on 23/10/2561 BE.
//  Copyright © 2561 Kuntapon Tanikkool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
//    Explicit
    var userString: String = ""
    var pswString: String = ""
    
    
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnSignin(_ sender: Any) {
        
    // Get Value From TextField
        userString = txtUsername.text!
        pswString = txtPassword.text!
        
    //Show log
        print("user ==> \(userString)  password ==> \(pswString)")
        
        
    }   //singin Function
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

