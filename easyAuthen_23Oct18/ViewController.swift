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
    var myConstant = MyConstant()
    
    
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func btnSignin(_ sender: Any) {
        
    // Get Value From TextField
        userString = txtUsername.text!
        pswString = txtPassword.text!
        
    //Show log
        print("user ==> \(userString)  password ==> \(pswString)")
        
        if (userString.count == 0) || (pswString.count == 0) {
            myAlert(titleString: myConstant.titleHaveSpaceString, messageString: myConstant.messageHaveSpaceString)
        }
        else {
            
        }
        checkUserAnPass()
        
        
    }   //singin Function
    
    func checkUserAnPass() -> Void {
        
        let urlString = myConstant.findUrlGetUser(userString: userString)
        let urlJSON = URL(string: urlString)
        let request = NSMutableURLRequest(url: urlJSON!)
        let myTask = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if (error != nil) {
                print("Error")
            }
            else {
                
                if let myReadAbleData = data {
                    
                    let canReadAbleData = NSString(data: myReadAbleData, encoding: String.Encoding.utf8.rawValue)
                    //print("canReadAbleData ==> \(String(describing: canReadAbleData))")
                    
                    let jsonString: String = canReadAbleData! as String
                    print("jsionString ==> \(jsonString)")
                    
                    // Split Prefix
                    let blockPrefix = "["
                    //var noBlockPreFixString: String = ""
                    let contentArray1 = jsonString.components(separatedBy: blockPrefix)
                    print("contenArray1[1] ==>\(contentArray1[1])")

                    let blockSuffix = "]"
                    let contentArray2 = contentArray1[1].components(separatedBy: blockSuffix)
                    print("contenArray2[0] ==>\(contentArray2[0])")
                    
                    self.convertJSONtoDictionary(jsonString: contentArray2[0])
                }// if 2
                
            }//if 1
            
        }// myTask
        myTask.resume()
        
        
    }// checkUserAnPass
    
    func convertJSONtoDictionary(jsonString: String) -> Void {
        
        var dictionary: NSDictionary?
        
        if let data = jsonString.data(using: String.Encoding.utf8) {
        
            do {
                dictionary = try (JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary)
                if let myDictionary = dictionary {
                    print("myDict ==>\(myDictionary)")
                    checkPassword(pswString: myDictionary["Password"] as! String, nameString: myDictionary["Name"] as! String)
                } // if
                
            }// do
            catch let error as NSError {
                print("Error ==> \(error)")
                
                
            }// cacth
            
        }// if 1
        
        
        
    } // Convert JSON
    
    func checkPassword(pswString: String, nameString: String ) -> Void {
        
        
        
        

        
    }// CheckPassword
    
    
    func myAlert(titleString: String, messageString: String) -> Void {
        
        let alertController = UIAlertController (title: titleString, message: messageString, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        
        
        self.present(alertController, animated: true, completion: nil ) //ให้ทำการคืนค่า Class Controller
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

