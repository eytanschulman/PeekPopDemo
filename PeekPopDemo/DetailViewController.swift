//
//  DetailViewController.swift
//  PeekPopDemo
//
//  Created by Eytan Schulman on 10/18/15.
//  Copyright © 2015 MultiEducator. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedItem : String!
    @IBOutlet var selectedItemLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedItemLabel?.text = selectedItem
        self.title = selectedItem
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
