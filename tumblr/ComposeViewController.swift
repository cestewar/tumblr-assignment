//
//  ComposeViewController.swift
//  tumblr
//
//  Created by Cameron Stewart on 10/9/15.
//  Copyright © 2015 cameronstewart. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
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
            //toViewController.view.frame.origin.y = 568
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                toViewController.view.alpha = 1
                //toViewController.view.frame.origin.y = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            
            UIView.animateWithDuration(0.5, delay: 0.6, options: [], animations: { () -> Void in
                //animate
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        textIcon.frame.origin.y = 568
        textIcon.alpha = 0
        
        photoIcon.frame.origin.y = 568
        photoIcon.alpha = 0
        
        quoteIcon.frame.origin.y = 568
        quoteIcon.alpha = 0
        
        linkIcon.frame.origin.y = 568
        linkIcon.alpha = 0
        
        chatIcon.frame.origin.y = 568
        chatIcon.alpha = 0
        
        videoIcon.frame.origin.y = 568
        videoIcon.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //outlets for icons below
    @IBOutlet weak var textIcon: UIImageView!
    @IBOutlet weak var photoIcon: UIImageView!
    @IBOutlet weak var quoteIcon: UIImageView!
    @IBOutlet weak var linkIcon: UIImageView!
    @IBOutlet weak var chatIcon: UIImageView!
    @IBOutlet weak var videoIcon: UIImageView!
    
    
    
    
    //DID APPEAR ANIMATE ICONS
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // code
        print("compose Will appear!")
        
        UIView.animateWithDuration(0.4, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [UIViewAnimationOptions.CurveEaseOut], animations: { () -> Void in
            
            //animate
            self.textIcon.frame.origin.y = 150
            self.textIcon.alpha = 1
            
            }) { (completed) -> Void in
                //complete
        }
        
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [UIViewAnimationOptions.CurveEaseOut], animations: { () -> Void in
            
            //animate
            self.photoIcon.frame.origin.y = 150
            self.photoIcon.alpha = 1
            
            }) { (completed) -> Void in
                //complete
        }
        
        UIView.animateWithDuration(0.4, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [UIViewAnimationOptions.CurveEaseOut], animations: { () -> Void in
            
            //animate
            self.quoteIcon.frame.origin.y = 150
            self.quoteIcon.alpha = 1
            
            }) { (completed) -> Void in
                //complete
        }
        
        UIView.animateWithDuration(0.4, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [UIViewAnimationOptions.CurveEaseOut], animations: { () -> Void in
            
            //animate
            self.linkIcon.frame.origin.y = 285
            self.linkIcon.alpha = 1
            
            }) { (completed) -> Void in
                //complete
        }
        
        UIView.animateWithDuration(0.4, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [UIViewAnimationOptions.CurveEaseOut], animations: { () -> Void in
            
            //animate
            self.chatIcon.frame.origin.y = 285
            self.chatIcon.alpha = 1
            
            }) { (completed) -> Void in
                //complete
        }
        
        UIView.animateWithDuration(0.4, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [UIViewAnimationOptions.CurveEaseOut], animations: { () -> Void in
            
            //animate
            self.videoIcon.frame.origin.y = 285
            self.videoIcon.alpha = 1
            
            }) { (completed) -> Void in
                //complete
        }
        
    }
    
    
    //
    //
    //DID DISAPPEAR ANIMATE AWAY ICONS
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("compose WILL disappear!")
        
        UIView.animateWithDuration(0.4, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [UIViewAnimationOptions.CurveEaseIn], animations: { () -> Void in
            
            //animate
            self.textIcon.frame.origin.y = -95
            self.textIcon.alpha = 0
            
            }) { (completed) -> Void in
                //complete
        }
        
        UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [UIViewAnimationOptions.CurveEaseIn], animations: { () -> Void in
            
            //animate
            self.photoIcon.frame.origin.y = -95
            self.photoIcon.alpha = 0
            
            }) { (completed) -> Void in
                //complete
        }
        
        UIView.animateWithDuration(0.4, delay: 0.1, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [UIViewAnimationOptions.CurveEaseIn], animations: { () -> Void in
            
            //animate
            self.quoteIcon.frame.origin.y = -95
            self.quoteIcon.alpha = 0
            
            }) { (completed) -> Void in
                //complete
        }
        
        UIView.animateWithDuration(0.4, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [UIViewAnimationOptions.CurveEaseIn], animations: { () -> Void in
            
            //animate
            self.linkIcon.frame.origin.y = -95
            self.linkIcon.alpha = 0
            
            }) { (completed) -> Void in
                //complete
        }
        
        UIView.animateWithDuration(0.4, delay: 0.2, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [UIViewAnimationOptions.CurveEaseIn], animations: { () -> Void in
            
            //animate
            self.chatIcon.frame.origin.y = -95
            self.chatIcon.alpha = 0
            
            }) { (completed) -> Void in
                //complete
        }
        
        UIView.animateWithDuration(0.4, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [UIViewAnimationOptions.CurveEaseIn], animations: { () -> Void in
            
            //animate
            self.videoIcon.frame.origin.y = -95
            self.videoIcon.alpha = 0
            
            }) { (completed) -> Void in
                //complete
        }
    }
    
    
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }
    
    
    //NEVERMIND BUTTON TO DISMISS
    @IBAction func onNevermindButton(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
        print("nevermind!")
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
