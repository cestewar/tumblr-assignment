//
//  LoginViewController.swift
//  tumblr
//
//  Created by Cameron Stewart on 10/12/15.
//  Copyright © 2015 cameronstewart. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var isPresenting: Bool = true
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.3
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // TODO: animate the transition in Step 3 below
        print("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            
            containerView!.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            toViewController.view.frame.origin.y = 568
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                toViewController.view.alpha = 1
                toViewController.view.frame.origin.y = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            
            UIView.animateWithDuration(0.5, delay: 0, options: [], animations: { () -> Void in
                //animate
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
            
        }
    }
    
    
    @IBOutlet weak var loginFormView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loginFormView.frame.origin.y = 568
        
        //Detect Keyboards
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }
    
    //DID APPEAR
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            //animate
            self.loginFormView.frame.origin.y = 190
            }) { (completed) -> Void in
                //completed
        }
        
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //KEYBOARD DETECTION
    func keyboardWillShow(notification: NSNotification!) {
        //show keyboard
        print("showing key")
        loginFormView.frame.origin.y = 150
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        //show keyboard
        print("hide key")
        loginFormView.frame.origin.y = 0
    }
    
    
    //CANCEL to dismiss
    @IBAction func onCancelButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //"Login"
    @IBAction func onLoginButton(sender: UIButton) {
        if emailTextField.text!.isEmpty && passwordTextField.text!.isEmpty {
            
            //store alert
            let alertController = UIAlertController(title: "Username & Password Empty", message: "Please enter your username and password", preferredStyle: .Alert)
            
            let okAction = UIAlertAction(title: "OK", style: .Default) {(action) in
                //handler response here
            }
            
            //add okAction to alertcontroller
            alertController.addAction(okAction)
            
            //present controller
            presentViewController(alertController, animated: true) {
                // optional code for what happens after the alert controller has finished presenting
            }
        }
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
