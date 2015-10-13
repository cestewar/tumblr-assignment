//
//  SearchViewController.swift
//  tumblr
//
//  Created by Cameron Stewart on 10/9/15.
//  Copyright © 2015 cameronstewart. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var searchFeedImageView: UIImageView!
    
    @IBOutlet weak var loadingImageView: UIImageView!
    
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    
    //store array for images
    var images: [UIImage]!
    
    //create var for animated image
    var animatedImage : UIImage!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: searchFeedImageView.frame.width, height: searchFeedImageView.frame.height)
        
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        
        images = [loading_1, loading_2, loading_3]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // code
        print("Search WILL appear!")
        
        self.scrollView.alpha = 0
        self.loadingImageView.alpha = 1
        animatedImage = UIImage.animatedImageWithImages(images, duration: 1.0)
        loadingImageView.image = animatedImage
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // code
        print("Search DID appear!")
        
        UIView.animateWithDuration(0.4, delay: 0.6, options: [], animations: { () -> Void in
            //animate
            self.loadingImageView.alpha = 0
            
            }) { (completed) -> Void in
                //completed
                
                UIView.animateWithDuration(0.4, delay: 0, options: [], animations: { () -> Void in
                    //animate 2nd
                    self.scrollView.alpha = 1
                    
                    }, completion: { (completed) -> Void in
                        //complete 2nd
                })
        }
        
        /*
        UIView.animateWithDuration(0.3, delay: 0, options: [], animations: { () -> Void in
            //animate
            
            self.loadingImageView.alpha = 1
            
            }) { (completed) -> Void in
                //completed
                
                UIView.animateWithDuration(0.3, delay: 0, options: [], animations: { () -> Void in
                    //animate
                    self.loadingImageView.image = UIImage(named: "loading-2")
                    
                    }, completion: { (completed) -> Void in
                        //completed 2nd
                        
                        UIView.animateWithDuration(0.3, delay: 0, options: [], animations: { () -> Void in
                            //animate
                            self.loadingImageView.image = UIImage(named: "loading-3")
                            
                            }, completion: { (completed) -> Void in
                                //complete 3rd
                        })
                })
        }*/
        /*
        UIView.animateWithDuration(0.4, delay: 0.5, options: [], animations: { () -> Void in
            //animate
            self.scrollView.alpha = 1
            
            }) { (completed) -> Void in
                //completed
        }*/
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        // code
        print("Search WILL disappear!")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        // code
        print("Search DID disappear!")
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
