//
//  MessageViewController.swift
//  Mailbox
//
//  Created by Sam Julian on 9/22/14.
//  Copyright (c) 2014 Sam Julian. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    @IBOutlet weak var message: UIImageView!
    
    @IBOutlet var background: UIView!
    
    @IBOutlet weak var leftIcon: UIView!
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var deleteIcon: UIImageView!
    
    @IBOutlet weak var rightIcon: UIView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var listIcon: UIImageView!
    
    var originalCenter: CGPoint!
    var leftIconDefault: CGPoint!
    var rightIconDefault: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background.backgroundColor = UIColor.lightGrayColor()
        leftIcon.alpha = 0
        deleteIcon.alpha = 0
        rightIcon.alpha = 1
        listIcon.alpha = 0
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPan(sender: AnyObject) {
        var location = sender.locationInView(view)
        var velocity = sender.velocityInView(view)
        var translation = sender.translationInView(view)
        
//        message.frame.origin.x = location.x
        
        if(sender.state == UIGestureRecognizerState.Began){
            originalCenter = message.center
            leftIconDefault = leftIcon.center
            rightIconDefault = rightIcon.center
        } else if (sender.state == UIGestureRecognizerState.Changed){
            
            message.center.x = originalCenter.x + translation.x
            leftIcon.alpha = (translation.x / 100) * 1.2
            rightIcon.alpha = (-translation.x / 100) * 1.2
            if (translation.x >= 260){
                background.backgroundColor = UIColor(red: 239/255, green: 84/255, blue: 12/255, alpha: 1)
                deleteIcon.alpha = 1
                archiveIcon.alpha = 0
            } else
                if (translation.x >= 60){
                leftIcon.center.x = translation.x - 30
                background.backgroundColor = UIColor(red: 98/255, green: 217/255, blue: 98/255, alpha: 1)
            } else
            if (translation.x <= -260){
                background.backgroundColor = UIColor(red: 216/255, green: 166/255, blue: 117/255, alpha: 1)
                laterIcon.alpha = 0
                listIcon.alpha = 1
            } else
            if (translation.x <= -60){
                rightIcon.center.x = translation.x + 350
                background.backgroundColor = UIColor(red: 255/255, green: 211/255, blue: 32/255, alpha: 1)
            }
            if (translation.x >= 0 && translation.x <= 60 || translation.x >= -60 && translation.x <= 0){
                background.backgroundColor = UIColor.lightGrayColor()
            }
        } else if(sender.state == UIGestureRecognizerState.Ended){
            if (translation.x >= 260){
                delete()
            } else if (translation.x >= 60){
                archive()
            } else if (translation.x <= -260){
                list()
            } else if (translation.x <= -60){
                later()
            } else {
                close()
            }
        }
    }
    
    func archive(){
        println("archive")
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.message.center.x = 540
            self.leftIcon.center.x = 340
            }, completion: nil)
        removeCell()
    }
    func delete() {
        println("delete")
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.message.center.x = 540
            self.leftIcon.center.x = 340
            }, completion: nil)
        removeCell()
    }
    func list(){
        println("list")
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.message.center.x = -540
            self.rightIcon.center.x = -70
            }, completion: nil)
        self.performSegueWithIdentifier("list", sender: self)
    }
    func later(){
        println("later")
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.message.center.x = -600
            self.rightIcon.center.x = -70
            }, completion: nil)
    }
    func close(){
        println("return")
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            self.message.center = self.originalCenter
            }, completion: nil)
        leftIcon.alpha = 0
        leftIcon.center = leftIconDefault
        rightIcon.center = rightIconDefault
        background.backgroundColor = UIColor.lightGrayColor()
    }
    func removeCell(){
        
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
