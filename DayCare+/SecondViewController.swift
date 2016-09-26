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
        
        
        
        let leftg = UISwipeGestureRecognizer(target: self, action: #selector(self.swipes))

        let rightg = UISwipeGestureRecognizer(target: self, action: #selector(self.swipes))

        leftg.direction = .left
        view.addGestureRecognizer(leftg)
        
        rightg.direction = .right
        view.addGestureRecognizer(rightg)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func swipes(sender:UISwipeGestureRecognizer) {
        if(sender.direction == .left){
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DayCareController")
           
            self.present(vc, animated: false, completion: nil)
        }
        if(sender.direction == .right){
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "FirstViewController")
            self.present(vc, animated: false, completion: nil)
        }
        
    }


}

