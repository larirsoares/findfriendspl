//
//  ViewController.swift
//  findfriendspl
//
//  Created by Jonatas Ferreira Bastos on 9/7/15.
//  Copyright (c) 2015 RiSE. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    //keep reference for MapView
    @IBOutlet weak var myLocation: MKMapView!
    
    //Keeps reference of LocationManager
    var locationManager : CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
             
        self.locationManager = CLLocationManager()        
        locationManager.requestWhenInUseAuthorization()
        myLocation.showsUserLocation = true
        
        // Login UIBotton
        let newItemButton = UIBarButtonItem(title: "Login",
            style: UIBarButtonItemStyle.Plain,
            target: self,
           
            action: Selector("showLoginView"))
        navigationItem.rightBarButtonItem = newItemButton

    }

   
   
    // Show the Login View
    @IBAction func showLoginView(){
        
        let login = LoginViewController(nibName: "LoginViewController", bundle: nil)
        if let navigation = navigationController {
            navigation.pushViewController(login, animated: true)
        }
        
        println("login")
        
    }

}

