//
//  BookingController.swift
//  DayCare+
//
//  Created by Samarth Parikh on 2016-09-14.
//  Copyright © 2016 Balantech. All rights reserved.
//

import UIKit

class BookingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
            let vc = storyboard.instantiateViewController(withIdentifier: "ProfileController")
            self.present(vc, animated: false, completion: nil)
        }
        if(sender.direction == .right){
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DayCareController")
            self.present(vc, animated: false, completion: nil)
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
