//
//  TabBarViewController.swift
//  tumblr
//
//  Created by Cameron Stewart on 10/9/15.
//  Copyright © 2015 cameronstewart. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    
    @IBOutlet weak var contentView: UIView!
    
    //create array for buttons
    @IBOutlet var buttons: [UIButton]!
    
    var homeViewController : UIViewController!
    var searchViewController : UIViewController!
    var accountViewController : UIViewController!
    var trendingViewController : UIViewController!
    
    //store view controllers in array
    var viewControllers: [UIViewController]!
    
    //store index # for arrays later
    var selectedIndex: Int = 0
    
    //popup
    @IBOutlet weak var explorePopupImageView: UIImageView!
    
    //compose
    var composeViewController : UIViewController!
    
    //login
    var loginViewController : UIViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController")
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController")
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController")
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController")
        
        //push view controllers to array called
        viewControllers = [homeViewController, searchViewController, accountViewController, trendingViewController]
        
        //default to first tab
        buttons[selectedIndex].selected = true
        didPressTab(buttons[selectedIndex])
        
        // Do any additional setup after loading the view.
        
        //compose view controller storyboard
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController")
        
        //login view controller storyboard
        loginViewController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPressTab(sender: UIButton) {
        
        let previousIndex = selectedIndex
        
        //assign selectedIndex int to button pressed
        selectedIndex = sender.tag
        
        //unassign selected button
        buttons[previousIndex].selected = false
        
        //get current VC
        let previousVC = viewControllers[previousIndex]
        
        //remove current VC
        previousVC.willMoveToParentViewController(nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()
        
        //set button to selected
        sender.selected = true
        
        //get new current VC
        let vc = viewControllers[selectedIndex]
        
        //add VC
        addChildViewController(vc)
        
        //set view's bounds and size
        vc.view.frame = contentView.bounds
        
        //add view as subview
        contentView.addSubview(vc.view)
        
        vc.didMoveToParentViewController(self)
        
        print("selected index is \(selectedIndex)")
        print("button tag is \(sender.tag)")
        print("previous index is \(previousIndex)")
        
        if selectedIndex == 1 {
            UIView.animateWithDuration(0.5, animations: { () -> Void in
                //animate
                self.explorePopupImageView.alpha = 0
            })
        } else {

            UIView.animateWithDuration(0.5, animations: { () -> Void in
                //animate
                self.explorePopupImageView.alpha = 1
                }, completion: { (completed) -> Void in
                    //completed
                    
                    UIView.animateWithDuration(0.8, delay: 0, options: [.Repeat,.Autoreverse], animations: { () -> Void in
                        //animate
                        self.explorePopupImageView.frame.origin.y = 456
                        }, completion: { (completed) -> Void in
                            //completed
                    })
            })
        }
    }
    
    
    
    
    
    
    /*
    @IBAction func onHomeButton(button: UIButton) {
        
        if currentViewController != nil {
            currentViewController.willMoveToParentViewController(nil)
            currentViewController.view.removeFromSuperview()
            currentViewController.removeFromParentViewController()
        }
        
        if previousButton != nil{
            previousButton.selected = false
        }
        button.selected = true
        
        addChildViewController(homeViewController)
        contentView.addSubview(homeViewController.view)
        homeViewController.didMoveToParentViewController(self)
        
        homeViewController.view.frame = contentView.bounds
        
        previousButton = button
        
        currentViewController = homeViewController
        
    }
    
    
    @IBAction func onSearchButton(button: UIButton) {
        
        if currentViewController != nil {
            currentViewController.willMoveToParentViewController(nil)
            currentViewController.view.removeFromSuperview()
            currentViewController.removeFromParentViewController()
        }
        
        if previousButton != nil{
            previousButton.selected = false
        }
        button.selected = true
        
        addChildViewController(searchViewController)
        contentView.addSubview(searchViewController.view)
        searchViewController.didMoveToParentViewController(self)
        
        searchViewController.view.frame = contentView.bounds
        
        previousButton = button
        
        currentViewController = searchViewController
    }
    
    
    @IBAction func onAccountButton(button: UIButton) {
        
        if previousButton != nil{
            previousButton.selected = false
        }
        button.selected = true
        previousButton = button
        
        if currentViewController != nil {
            currentViewController.willMoveToParentViewController(nil)
            currentViewController.view.removeFromSuperview()
            currentViewController.removeFromParentViewController()
        }
        
        addChildViewController(accountViewController)
        contentView.addSubview(accountViewController.view)
        accountViewController.didMoveToParentViewController(self)
        
        accountViewController.view.frame = contentView.bounds
        
        currentViewController = accountViewController
    }
    
    
    @IBAction func onTrendingButton(button: UIButton) {
        
        if previousButton != nil {
            previousButton.selected = false
        }
        button.selected = true
        previousButton = button
        
        if currentViewController != nil {
            currentViewController.willMoveToParentViewController(nil)
            currentViewController.view.removeFromSuperview()
            currentViewController.removeFromParentViewController()
        }
        
        addChildViewController(trendingViewController)
        contentView.addSubview(trendingViewController.view)
        trendingViewController.didMoveToParentViewController(self)
        
        trendingViewController.view.frame = contentView.bounds
        
        currentViewController = trendingViewController
        
    }*/
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
