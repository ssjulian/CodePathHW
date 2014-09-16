//
//  LoginViewController.swift
//  Carousel
//
//  Created by Sam Julian on 9/15/14.
//  Copyright (c) 2014 Sam Julian. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var descView: UIImageView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var activityIndicator: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        activityIndicator.hidden = true
        
        // Do any additional setup after loading the view.
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
            self.loginView.frame.origin.y = 0
            self.signInView.frame.origin.y = 160
    }
    
    func keyboardWillHide(notification: NSNotification!) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func tapAnywhere(sender: AnyObject) {
        self.loginView.frame.origin.y = 83
        self.signInView.frame.origin.y = 426
        view.endEditing(true)
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    
    @IBAction func signIn(sender: AnyObject) {
        println("i'm here")
        if (emailField.text.isEmpty || passwordField.text.isEmpty){
            var alertView = UIAlertView (title: "Email and password required", message: "Please enter an email and password to sign in", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else if (self.emailField.text == "Sam" && self.passwordField.text == "qwe"){
            activityIndicator.hidden = false
            delay(2){
                self.performSegueWithIdentifier("enter", sender: self)}
        } else {
            var alertView = UIAlertView (title: "Incorrect email or password", message: "Please check your login credentials and try again.", delegate: self, cancelButtonTitle: "OK", otherButtonTitles: "Reset password")
            activityIndicator.hidden = false
            delay(2){
            alertView.show()
            }}
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}