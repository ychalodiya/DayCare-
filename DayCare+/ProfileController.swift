//
//  ProfileControllerViewController.swift
//  DayCare+
//
//  Created by Samarth Parikh on 2016-09-14.
//  Copyright © 2016 Balantech. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = tabBarItem.title
        self.view.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "pattern"))
        
        let rightg = UISwipeGestureRecognizer(target: self, action: #selector(self.swipes))
        
        
        
        rightg.direction = .right
        view.addGestureRecognizer(rightg)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func swipes(sender:UISwipeGestureRecognizer) {
        
        if(sender.direction == .right){
            
            let selectedIndex: Int = self.tabBarController!.selectedIndex
            self.tabBarController!.selectedIndex = selectedIndex - 1
        }
        
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
