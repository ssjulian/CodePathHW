//
//  SignInViewController.swift
//  Carousel
//
//  Created by Sam Julian on 9/15/14.
//  Copyright (c) 2014 Sam Julian. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textFieldView: UIView!
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.activityIndicator.hidden = true
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        self.textFieldView.frame.origin.y = 0
        self.signInView.frame.origin.y = 170
    }

    func keyboardWillHide(notification: NSNotification!) {
    }

    
    
    @IBAction func onBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

    @IBAction func onSignIn(sender: AnyObject) {
        println("I'm here")
        if (emailField.text.isEmpty || passwordField.text.isEmpty){
            var alertView = UIAlertView (title: "Email and password required", message: "Please enter an email and password to sign in", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
        } else if (self.emailField.text == "sam" && self.passwordField.text == "123"){
            self.activityIndicator.startAnimating()
            delay(2){
                self.performSegueWithIdentifier("enter", sender: self)}
        } else {
            var alertView = UIAlertView (title: "Incorrect email or password", message: "Please check your login credentials and try again.", delegate: self, cancelButtonTitle: "OK", otherButtonTitles: "Reset password")
            self.activityIndicator.startAnimating()
            delay(2){
                alertView.show()
                self.activityIndicator.stopAnimating()
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
