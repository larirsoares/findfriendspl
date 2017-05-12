//
//  CreateAccountViewController.swift
//  findfriendspl
//
//  Created by Jonatas Ferreira Bastos on 9/14/15.
//  Copyright (c) 2015 RiSE. All rights reserved.
//

import UIKit
import Foundation



class CreateAccountViewController: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPhone: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtConfirmPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func createAccount(sender: AnyObject) {
        
        var name:String = txtName.text
        var email:String = txtEmail.text
        var phone:String = txtPhone.text
        var password:String = txtPassword.text
        var confirmPassword:String = txtConfirmPassword.text
        
        
        if ( name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty ) {
            self.alertShow( "Sign Up Failed!", message: "Please enter all Informations", buttonTitle: "OK")
            
        } else if ( !password.isEqual(confirmPassword) ) {
            self.alertShow( "Sign Up Failed!", message: "Passwords doesn't Match", buttonTitle: "OK")
        
        } else {
            let baseURL = "http://localhost:8080/FindFriendWS/facade/saveUser"
            
            var informations : [String: AnyObject] = ["name": name, "email": email, "phone": phone,  "password": password, "confirmPassword": confirmPassword]
            
            var json: JSON
            
            RestApiManager.sharedInstance.makeHTTPPostRequest(baseURL, body: informations, onCompletion : { json, err in})
            
        }
   
        
    }
   
    
    func alertShow( title: String, message: String, buttonTitle: String){
        
        var alertView:UIAlertView = UIAlertView()
        alertView.title = title
        alertView.message = message
        alertView.delegate = self
        alertView.addButtonWithTitle(buttonTitle)
        alertView.show()
        
    }
}
