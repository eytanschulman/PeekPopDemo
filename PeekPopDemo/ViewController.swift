//
//  ViewController.swift
//  PeekPopDemo
//
//  Created by Eytan Schulman on 10/18/15.
//  Copyright © 2015 MultiEducator. All rights reserved.
//

import UIKit

class ViewController: UITableViewController,UIViewControllerPreviewingDelegate {
    
    let contentArray = ["One","Two","Three","Four","Five","Six","Seven","Eight"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIApplication.sharedApplication().keyWindow?.traitCollection.forceTouchCapability == UIForceTouchCapability.Available {
            self.registerForPreviewingWithDelegate(self, sourceView: self.tableView)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = contentArray[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("dvc", sender: contentArray[indexPath.row])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "dvc" {
            let dvc = segue.destinationViewController as! DetailViewController
            dvc.selectedItem = sender as! String
        }
    }
    
    //MARK: UIViewControllerPreviewingDelegate functions
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let indexPath = self.tableView.indexPathForRowAtPoint(location)
        let cell = self.tableView.cellForRowAtIndexPath(indexPath!)
        let dvc = self.storyboard?.instantiateViewControllerWithIdentifier("DVC") as! DetailViewController
        dvc.selectedItem = contentArray[indexPath!.row]
        previewingContext.sourceRect = cell!.frame
        
        return dvc
    }
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        self.navigationController?.pushViewController(viewControllerToCommit, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

