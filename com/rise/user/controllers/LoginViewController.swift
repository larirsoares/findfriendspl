//
//  LoginViewController.swift
//  findfriendspl
//
//  Created by Leandro Souza on 9/14/15.
//  Copyright (c) 2015 RiSE. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var loginButton: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Login"
        // Do any additional setup after loading the view.
        
        if(FBSDKAccessToken.currentAccessToken() == nil){
            println("User is not logged in")
        }else{
            println("User is logged in")
        }
        
        loginButton.delegate = self
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBOutlet var loginField: UITextField?
    @IBOutlet var passwordField: UITextField?
    
    // login
    @IBAction func login(){
        if loginField == nil || passwordField == nil {
            return
        }
        
        let login = loginField!.text
        let password = passwordField!.text
        
        println("Login: \(login)")
        println("Password: \(password)")
        println("connecting...")
    }
    
    //Facebook login
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        if(error != nil)
        {
            println(error.localizedDescription)
            return
        }
        
        if let userToken = result.token
        {
            //Get user access token
            let token:FBSDKAccessToken = result.token
            
            println("Token = \(FBSDKAccessToken.currentAccessToken().tokenString)")
            
            println("User ID = \(FBSDKAccessToken.currentAccessToken().userID)")
            
            /*let protectedPage = self.storyboard?.instantiateViewControllerWithIdentifier("ProtectedPageViewController") as! ProtectedPageViewController
            
            let protectedPageNav = UINavigationController(rootViewController: protectedPage)
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            
            appDelegate.window?.rootViewController = protectedPageNav */
        }
        
    }
    
    //Facebook logout
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!){
        
        println("user is logged out")
    }
    
    @IBAction func signUp(sender: AnyObject) {
        
        
            let createAccount = CreateAccountViewController(nibName: "CreateAccountViewController", bundle: nil)
            
            if let navigation = navigationController {
                navigation.pushViewController(createAccount, animated: true)
            }
            
       
    }

    
    
}
