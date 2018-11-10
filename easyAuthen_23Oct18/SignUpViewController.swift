//
//  SignUpViewController.swift
//  easyAuthen_23Oct18
//
//  Created by Kuntapon Tanikkool on 23/10/2561 BE.
//  Copyright © 2561 Kuntapon Tanikkool. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

//    Explicit
    var nameString: String?
    var userString: String?
    var passwordString: String?
    var myConstant = MyConstant() //การสร้าง Object Class (Instant)
    
    
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnCloudUpload(_ sender: Any) {
        
        nameString = txtName.text
        print("nameString ==> \(String(describing: nameString))")
        let myNameString: String = nameString!
        print("nameString ==> \(myNameString)")
        
        userString = txtUsername.text
        let myUserString: String = userString!
        print("myUserString ==> \(myUserString)")
        
        passwordString = txtPassword.text
        let myPasswordString: String = passwordString!
        print("myPasswordString ==> \(myPasswordString)")
        
        if checkSpace(nameString: myNameString, userString: myUserString, passwordString: myPasswordString) {
            myAlert(titleString: myConstant.titleHaveSpaceString , messageString: myConstant.messageHaveSpaceString )
            
        }
        else {
//            upload to Server
            
        }
        

    
        
    }   // cloudUpload Function
    
    func uploadToServer(nameString: String, userString: String, passwordString: String) -> Void {
        
        
        
    }
    
    
    
    func myAlert(titleString: String, messageString: String) -> Void {
        
        let alertController = UIAlertController (title: titleString, message: messageString, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        
        
        self.present(alertController, animated: true, completion: nil ) //ให้ทำการคืนค่า Class Controller
        
    }
    
    
    
    
    func checkSpace(nameString: String, userString: String, passwordString: String) -> Bool {
        
        var resultBol: Bool = false
        
        if (nameString.count == 0) || (userString.count == 0) || (passwordString == "") {
            resultBol = true
        }
        print("resultBol == > \(resultBol)")
        return resultBol
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
