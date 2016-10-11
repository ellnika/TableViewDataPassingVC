//
//  CityDetailedViewController.swift
//  Cities
//
//  Created by User on 10/10/2016.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class CityDetailedViewController: UIViewController {
    
    @IBOutlet weak var displayCityLabel: UILabel!
 @IBOutlet weak var cityName: UINavigationItem!
    var newCity = String()
    override func viewDidLoad() {
        super.viewDidLoad()

        displayCityLabel.text = newCity;
      cityName.title = newCity
        //cityName.title = "Hello"
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
