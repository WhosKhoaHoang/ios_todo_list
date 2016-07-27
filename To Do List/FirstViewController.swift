//
//  FirstViewController.swift
//  To Do List
//
//  Created by Khoa Hoang on 7/25/16.
//  Copyright © 2016 KhoaHoang. All rights reserved.
//

import UIKit

var todoItems:Array = [String](); //<--How you instantiate empty array
//. ^Declare this variable outside of the class so that it can be accessible to SecondViewController. To access the variable from SecondViewController, just say todoItems.
//. There are many ways of making variables accessible between view controllers, but this is the simplest way. As long as you don't have a bunch of variables that need to be shared, this way is fine.

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var todoTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Load data if any
        if let savedList = NSUserDefaults.standardUserDefaults().objectForKey("todoList") {
            todoItems = savedList as! [String];
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //Returns an integer representing the number of rows in a section
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todoItems.count;
        
    }
    
    
    //Generates the content for a particular cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell");
        
        cell.textLabel?.text = todoItems[indexPath.row];
        
        return cell
    
    }
    
    
    
    //This is a useful method that is called whenever this View Controller appears (e.g., during segues -- not just when the View is first loaded!!!)
    override func viewDidAppear(animated: Bool) {
        
        todoTableView.reloadData();
        
    }
    
    
    //This method is called whenever a user tries editing an item (e.g., swiping to the left) in the Table View
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if (editingStyle == UITableViewCellEditingStyle.Delete) {  //A "delete" editing style is regarded as a swipe to the left
            todoItems.removeAtIndex(indexPath.row);
            NSUserDefaults.standardUserDefaults().setObject(todoItems, forKey: "todoList"); //Saved the modified table
            todoTableView.reloadData();
        }
        
    }

}

