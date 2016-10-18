//
//  ViewController.swift
//  Cities
//
//  Created by User on 09/10/2016.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

//create protocol with one method that communication all information we need

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddCityViewDelegate {
    @IBOutlet var tableView: UITableView!
    
    //will hold the value sent from the second view controller for a city
    var cityAddedFromAddCityViewController = [String]()
    
    //will hold the value sent from the second view controller for a rating
    var ratingAddedFromAddCityViewController = [Int]()
    
    //single cell content
    var city : String = String ()
    
    var rating = Int()
    
    var valueToPass:String!
    var valueToPassRating:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonClicked(_ sender: AnyObject) {
        //segue to VC2
    }
    

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return cityAddedFromAddCityViewController.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //let cell : customCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:"Cell") as! customCell
     let cell : customCell = self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! customCell
        city = cityAddedFromAddCityViewController[indexPath.row]
        //what content we want within the cell
        rating = ratingAddedFromAddCityViewController[indexPath.row]
        cell.textLabel?.text=city
        cell.ratingToPass = rating

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "vc2")  {
            let destViewController : AddCityViewController = segue.destination as! AddCityViewController
            destViewController.delegate = self
            destViewController.citiesCreatedInAddCityViewController = cityAddedFromAddCityViewController
            destViewController.ratingsForAllCitiesArray = ratingAddedFromAddCityViewController
            
        }
  
            if (segue.identifier == "vc3")  {
                let destViewController1 : CityDetailedViewController = segue.destination as! CityDetailedViewController
                destViewController1.detailedCityName = valueToPass
                destViewController1.rating = valueToPassRating
                print (destViewController1.detailedCityName)
        }
    }
    
    
    func resultOfBusinessLogic(valueSent:[String], ratingSent:[Int] ) {
        self.cityAddedFromAddCityViewController = valueSent
        self.ratingAddedFromAddCityViewController = ratingSent
        
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        
    {
        let indexPath = tableView.indexPathForSelectedRow;
        let currentCell : customCell = tableView.cellForRow(at: indexPath!)! as UITableViewCell as! customCell;
        
        valueToPass = (currentCell.textLabel?.text)
        valueToPassRating = (currentCell.ratingToPass)
        print(currentCell.textLabel?.text)
        performSegue(withIdentifier: "vc3", sender: indexPath)
    }
}

