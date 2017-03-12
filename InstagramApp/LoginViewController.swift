//
//  LoginViewController.swift
//  InstagramApp
//
//  Created by Palak Jadav on 3/12/17.
//  Copyright © 2017 com.codepath. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: userNameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            if (user != nil) {
                print("You are logged in")
                self.performSegue(withIdentifier:
                    "loginSegue", sender: self)
            }
        }
    }

    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        
        newUser.username = userNameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackground { (success, error) in
            if success { print("Yay! User Created")
                self.performSegue(withIdentifier:
                    "loginSegue", sender: self)
            }
            else {
                print(error?.localizedDescription)
                /* if error?.code == 202 {
                 print("User name is taken")
                 }*/
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
