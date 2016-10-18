//
//  AddCityViewController.swift
//  Cities
//
//  Created by User on 09/10/2016.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit
protocol AddCityViewDelegate

{
    func resultOfBusinessLogic(valueSent:[String] , ratingSent:[Int]  )
}

class AddCityViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var ratingTypes = ["0", "1", "2","3","4","5"]
    
    var citiesCreatedInAddCityViewController : [String]! = []

    var newCityAdded : String = String()
    
    var ratingsForAllCitiesArray : [Int] = []
    
    @IBOutlet var pickerView: UIPickerView!
    var delegate : AddCityViewDelegate?
    @IBOutlet weak var inputCityName: UITextField!

    
    var newRatingAdded=Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self //so its able to control it
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton1(_ sender: AnyObject) {
        
        //saving new city into a variable
        newCityAdded = inputCityName.text!
        
        citiesCreatedInAddCityViewController.append(newCityAdded)
        ratingsForAllCitiesArray.append(newRatingAdded)
        
        performSegue(withIdentifier: "vc1", sender: sender)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "vc1")  {
        let destViewController : ViewController = segue.destination as! ViewController
            destViewController.resultOfBusinessLogic(valueSent: citiesCreatedInAddCityViewController, ratingSent: ratingsForAllCitiesArray)
       // destViewController.labelText=inputCityName.text!
          //  destViewController.ratingAddedFromAddCityViewController.append(newRatingAdded)

            print("The rating value is\(destViewController.ratingAddedFromAddCityViewController)")
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ratingTypes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return ratingTypes.count
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        newRatingAdded = row
       // newRatingAdded = row + 1
    }
}
