//
//  ProfileViewController.swift
//  InstagramApp
//
//  Created by Palak Jadav on 3/12/17.
//  Copyright © 2017 com.codepath. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    @IBAction func onLogOutButton(_ sender: Any) {
        
        // Log the user out of the backend
        PFUser.logOutInBackground { (error: Error?) in
            // If no error, return user to the login view controller
            if error == nil {
                self.performSegue(withIdentifier: "logoutSegue", sender: nil)
            } else {
                print("Error logging out")
            }
            
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
