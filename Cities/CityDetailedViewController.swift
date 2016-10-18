//
//  CityDetailedViewController.swift
//  Cities
//
//  Created by User on 10/10/2016.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class CityDetailedViewController: UIViewController {

    @IBOutlet var cityDetailsNavBar: UINavigationItem!
    @IBOutlet var ratingLabel: UILabel!
    
    var detailedCityName:String!
    var rating:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        displayCityLabel.text = newCity;
//        let newNavigationbar = "City Details -" + newCity
//        
//        cityDetailsNavBar.title = newNavigationbar

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        cityDetailsNavBar.title = detailedCityName
        ratingLabel.text = String(rating)
    }
    
    
    @IBAction func dismissButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: {});
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
