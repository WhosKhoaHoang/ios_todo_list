//
//  SecondViewController.swift
//  To Do List
//
//  Created by Khoa Hoang on 7/25/16.
//  Copyright © 2016 KhoaHoang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userItemInput: UITextField!
    @IBOutlet weak var errorMsg: UILabel!
    
    
    @IBAction func addItem(sender: AnyObject) {
        errorMsg.text = "";

        if (userItemInput.text != "") {
            todoItems.append(userItemInput.text!);
            userItemInput.text = "";
            
            //Persist the data
            NSUserDefaults.standardUserDefaults().setObject(todoItems, forKey: "todoList");
        }
        else {
            errorMsg.text = "Please enter an item!";
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.userItemInput.delegate = self;
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }

}

