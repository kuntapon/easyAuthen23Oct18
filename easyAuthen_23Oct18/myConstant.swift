//
//  myConstant.swift
//  easyAuthen_23Oct18
//
//  Created by Kuntapon Tanikkool on 10/11/2561 BE.
//  Copyright © 2561 Kuntapon Tanikkool. All rights reserved.
//

import Foundation

class MyConstant {
    
    let titleHaveSpaceString: String = "Have Space"
    let messageHaveSpaceString: String = "Please Fill Every Blank"
    let preUrlString: String = "https://www.androidthai.in.th/kan/addUserKun.php?isAdd=true&Name="
    let columnUserString: String = "&User="
    let columPasswordString: String = "&PSW="
    let preUrlGetUserString: String = "https://www.androidthai.in.th/kan/getDataWhereUserKan.php?isAdd=true&User="
    func findUrlGetUser(userString: String) -> String {
        return preUrlGetUserString + userString
    }
    
    func findUrlAddUser(nameString: String, userString: String, passwordString: String) -> String {
        let resultString: String = preUrlString + nameString + columnUserString + userString + columPasswordString + passwordString
        
        return resultString
    }
    
    
    
    
    
}//MyConstant Class
