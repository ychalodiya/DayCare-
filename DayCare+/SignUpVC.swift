//
//  SignUpVC.swift
//  DayCare+
//
//  Created by Samarth Parikh on 2016-09-26.
//  Copyright © 2016 Balantech. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{

    @IBOutlet weak var CityPickerView: UIPickerView!
    @IBOutlet weak var StatePickerView: UIPickerView!
    @IBOutlet weak var CountryPickerView: UIPickerView!
    
    @IBOutlet weak var CityLabel: UILabel!
    
    var CityDataSource = ["White", "Sasketchwan", "Green", "Blue"];
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "pattern"))
        
        self.CityPickerView.dataSource = self;
        self.CityPickerView.delegate = self;
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return CityDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return CityDataSource[row]
    }
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        CityLabel.isEnabled = true
//        CityLabel.text = CityDataSource[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if let titleLabel = view as? UILabel {
            titleLabel.text = CityDataSource[row]
            return titleLabel
        } else {
            let titleLabel = UILabel()
            titleLabel.font = UIFont.boldSystemFont(ofSize: 15)//Font you want here
            titleLabel.textAlignment = NSTextAlignment.center
            titleLabel.text = CityDataSource[row]
            CityLabel.text = CityDataSource[row]
            return titleLabel
        }
    }

}
