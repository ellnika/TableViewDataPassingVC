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
    func resultOfBusinessLogic(valueSent:[String])
}

class AddCityViewController: UIViewController {

    var delegate : AddCityViewDelegate?
    @IBOutlet weak var inputCityName: UITextField!
    var oneCity : String = String()
    var cities : [String]! = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButton1(_ sender: AnyObject) {
        
        oneCity = inputCityName.text!
        cities.append(oneCity)
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
            destViewController.resultOfBusinessLogic(valueSent: cities)
        destViewController.labelText=inputCityName.text!
        }
    }

}
