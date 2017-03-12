//
//  HomeViewController.swift
//  InstagramApp
//
//  Created by Palak Jadav on 3/12/17.
//  Copyright © 2017 com.codepath. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
     var posts: [PFObject]?
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        let refreshControl = UIRefreshControl()
       refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
       // refreshControl.addTarget(self, action: #selector(refreshControlAction(_refreshControl:)), for: UIControlEvents.valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        // Get timeline with network call
        //networkCall()
        self.tableView.reloadData()

    }
    
    func refreshControlAction(_ refreshControl: UIRefreshControl) {
        
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.limit = 20
        
        // Look through Parse
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            
            if let posts =  posts {
                print("We got some posts")
                self.posts = posts
                self.tableView.reloadData()
                refreshControl.endRefreshing()
            } else {
                print("Error fetching timeline in function networkCall(): \(error!.localizedDescription)")
            }
            
            // Tell the refreshControl to stop spinning
            refreshControl.endRefreshing()
        }
        //task.resume()
    }
    /*
    func networkCall() {
    
    let query = PFQuery(className: "Post")
    query.order(byDescending: "createdAt")
    query.limit = 20
    
    // Look through Parse
    query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
    
    if let posts =  posts {
    print("We got some posts")
    self.posts = posts
    self.tableView.reloadData()
    } else {
    print("Error fetching timeline in function networkCall(): \(error!.localizedDescription)")
    }
    }
    
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Count returned: ", self.posts?.count ?? 0)
        //        let post = posts![0]
        //        print("Photopath: \(post["media"]!)")
        return self.posts?.count ?? 0
        //        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        if posts != nil {
            let post = posts![indexPath.row]
            cell.userPost = post
            print("💗 Your post:", cell.userPost)
        }
        return cell
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
