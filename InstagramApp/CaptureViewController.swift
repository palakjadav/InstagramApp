//
//  CaptureViewController.swift
//  InstagramApp
//
//  Created by Palak Jadav on 3/12/17.
//  Copyright © 2017 com.codepath. All rights reserved.
//

import UIKit
import Parse

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var addPhotoImageView: UIImageView!
    @IBOutlet weak var addCaptionTextField: UITextField!

    let imagePickControl = UIImagePickerController()
    var image: UIImage!
    var imgPickControl = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image selected by the UIImagePickerController
        let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        // Let the user move the image in the frame and save the position they set
        //        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Do something with the images (based on your use case)
        //        image = editedImage
        image = originalImage
        addPhotoImageView.image = image
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }

    @IBAction func onPhotoLibraryButton(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func onSubmitPost(_ sender: Any) {
        //built-in Parse method that posts the image
        //Specifically, creates an object that is saved on Parse servers
        UserPost.postUserImage(image: image, withCaption: addCaptionTextField.text) { (success: Bool, error: Error?) in
            
            //If success
            if success {
                print("Photo got posted")
                
                // Clear out old data and return to homefeed view
                
                self.tabBarController?.selectedIndex = 0
                self.image = nil
                self.addPhotoImageView.image = nil
                self.addCaptionTextField.text = ""
                //                self.addCaptionTextField.placeholder = "Caption your photo here..."
                
                //Error
            } else {
                print("Error posting to \"Instagram\" in function onSubmitPost(): \(error?.localizedDescription)")
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
