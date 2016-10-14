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
    //will hold the value sent from the second view controller
    var valueSentFromSecondViewController : [String] = []

    var labelText = String ()
       var city : String = String ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addButtonClicked(_ sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    {
        return valueSentFromSecondViewController.count
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:"Cell")
     
        city = valueSentFromSecondViewController[indexPath.row]
        //what content we want within the cell
        cell.textLabel?.text=city
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "vc2")  {
            let destViewController : AddCityViewController = segue.destination as! AddCityViewController
            destViewController.delegate = self
            destViewController.cities = valueSentFromSecondViewController
        }
  
            if (segue.identifier == "vc3")  {
                let destViewController1 : CityDetailedViewController = segue.destination as! CityDetailedViewController
                destViewController1.newCity = self.city
                print (destViewController1.newCity)
        }
    }
    
    
    func resultOfBusinessLogic(valueSent:[String]) {
        self.valueSentFromSecondViewController = valueSent
        
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        
    {   performSegue(withIdentifier: "vc3", sender: self)
    }
}

