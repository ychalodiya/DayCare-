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
    @IBOutlet weak var StateLabel: UILabel!
    @IBOutlet weak var CountryLabel: UILabel!
    
    var CityDataSource = ["Surat", "Sasketchwan", "Navsari", "Blue"];
    var StateDataSource = ["Gujarat", "Goa", "Punjab", "Delhi"];
    var CountryDataSource = ["India", "Pakistan", "China", "Canada"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.init(patternImage: #imageLiteral(resourceName: "pattern"))
        
        self.CityPickerView.dataSource = self;
        self.CityPickerView.delegate = self;
        
        self.StatePickerView.dataSource = self;
        self.StatePickerView.delegate = self;
        
        self.CountryPickerView.dataSource = self;
        self.CountryPickerView.delegate = self;
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
        // return CityDataSource.count;
        
        if (pickerView.tag == 1) {
            return CountryDataSource.count
        } else if (pickerView.tag == 2) {
            return StateDataSource.count
        } else {
            return CityDataSource.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return CityDataSource[row]
        
        if (pickerView.tag == 1) {
            return CountryDataSource[row]
        } else if (pickerView.tag == 2) {
            return StateDataSource[row]
        } else {
            return CityDataSource[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let PickerLabel = UILabel()
        PickerLabel.font = UIFont.boldSystemFont(ofSize: 15)//Font you want here
        PickerLabel.textAlignment = NSTextAlignment.center
        
        if pickerView.tag == 3 {
            PickerLabel.text = CityDataSource[row]
            CityLabel.text = CityDataSource[row]
            return PickerLabel
        } else if pickerView.tag == 2 {
            PickerLabel.text = StateDataSource[row]
            StateLabel.text = StateDataSource[row]
            return PickerLabel
        } else {
            PickerLabel.text = CountryDataSource[row]
            CountryLabel.text = CountryDataSource[row]
            return PickerLabel
        }
    }
    
}
