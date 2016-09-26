//
//  FirstViewController.swift
//  DayCare+
//
//  Created by Yogesh Chalodiya on 2016-09-12.
//  Copyright © 2016 Balantech. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       self.navigationItem.title = tabBarItem.title
       self.view.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "pattern"))
        
       /* let leftSwipe = UISwipeGestureRecognizer(target: self, action: Selector(("handleSwipes:")))
        
        
        leftSwipe.direction = .left
        
        
        view.addGestureRecognizer(leftSwipe) */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
       
    }
    /*
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") 
            self.present(vc, animated: false, completion: nil)
            
        }
        
        if (sender.direction == .right) {
            
        }
    }
    */


}

