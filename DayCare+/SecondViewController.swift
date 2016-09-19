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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

