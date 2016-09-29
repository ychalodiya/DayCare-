//
//  SecondViewController.swift
//  DayCare+
//
//  Created by Yogesh Chalodiya on 2016-09-12.
//  Copyright © 2016 Balantech. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.title = tabBarItem.title
        self.view.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "pattern"))
        
        let SwipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipes))
        let SwipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipes))
        SwipeLeft.direction = .left
        view.addGestureRecognizer(SwipeLeft)
        SwipeRight.direction = .right
        view.addGestureRecognizer(SwipeRight)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func swipes(sender:UISwipeGestureRecognizer) {
        if(sender.direction == .left){
            let selectedIndex: Int = self.tabBarController!.selectedIndex
            self.tabBarController!.selectedIndex = selectedIndex + 1 }
        if(sender.direction == .right){
            let selectedIndex: Int = self.tabBarController!.selectedIndex
            self.tabBarController!.selectedIndex = selectedIndex - 1
        }
    }

}

