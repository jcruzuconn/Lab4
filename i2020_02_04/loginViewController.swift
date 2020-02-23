//
//  loginViewController.swift
//  i2020_02_04
//
//  Created by Jasper Cruz on 2/23/20.
//  Copyright © 2020 Bradford, Phillip. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {
    
    var username = "Jasper"
    
    var password = "abc123"

    @IBOutlet weak var usernameTextBox: UITextField!
    
    @IBOutlet weak var passwordTextBox: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButton(_ sender: Any) {
        if(usernameTextBox.text == username && passwordTextBox.text == password){
            
            performSegue(withIdentifier: "loginSegue", sender: self)
    }}
}
