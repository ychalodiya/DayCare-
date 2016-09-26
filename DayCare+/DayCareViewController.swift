//
//  DayCareViewController.swift
//  DayCare+
//
//  Created by Samarth Parikh on 2016-09-14.
//  Copyright © 2016 Balantech. All rights reserved.
//

import UIKit

class DayCareViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
     
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = tabBarItem.title
        
//        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tappedRightButton:)];
//        [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
//        [self.view addGestureRecognizer:swipeLeft];
//        
//        UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tappedLeftButton:)];
//        [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
//        [self.view addGestureRecognizer:swipeRight];
//    }
//    
//    - (IBAction)tappedRightButton:(id)sender
//    {
//    NSUInteger selectedIndex = [rootVC.tabBarController selectedIndex];
//    
//    [rootVC.tabBarController setSelectedIndex:selectedIndex + 1];
//    }
//    
//    - (IBAction)tappedLeftButton:(id)sender
//    {
//    NSUInteger selectedIndex = [rootVC.tabBarController selectedIndex];
//    
//    [rootVC.tabBarController setSelectedIndex:selectedIndex - 1];
        
//        let recognizer: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: "swipeLeft:")
//        recognizer.direction = .Left
//        self.view .addGestureRecognizer(recognizer)
        
    
    
//        let FavouritesVC = FavouritesViewController(nibName: "DayCareViewController", bundle: nil)
//        
//        self.addChildViewController(FavouritesVC)
//        self.scrollView.addSubview(FavouritesVC.view)
//        FavouritesVC.didMove(toParentViewController: self)
//        
//        let InviteVC = InviteViewController(nibName: "InviteViewController", bundle:nil)
//        
//        var frame1 = InviteVC.view.frame
//        frame1.origin.x = self.view.frame.size.width
//        InviteVC.view.frame = frame1
//        
//        self.addChildViewController(InviteVC)
//        self.scrollView.addSubview(InviteVC.view)
//        InviteVC.didMove(toParentViewController: self)
        
//        let InviteVC = InviteViewController(nibName: "InviteViewController", bundle:nil)
//        
//        var frame2 = InviteVC.view.frame
//        frame2.origin.x = self.view.frame.size.width * 2
//        InviteVC.view.frame = frame2
//        
//        self.addChildViewController(InviteVC)
//        self.scrollView.addSubview(InviteVC.view)
//        InviteVC.didMove(toParentViewController: self)
        
//        let vc3 = ViewController2(nibName: "ViewController3", bundle:nil)
//        
//        var frame3 = vc3.view.frame
//        frame3.origin.x = self.view.frame.size.width * 3
//        vc3.view.frame = frame3
//        
//        self.addChildViewController(vc3)
//        self.scrollView.addSubview(vc3.view)
//        vc3.didMoveToParentViewController(self)
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width * 2, height: self.view.frame.height - 66)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
