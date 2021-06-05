//
//  AddVC.swift
//  ToDo List
//
//  Created by Ahmed Ashraf on 02/06/2021.
//

import UIKit
protocol addNewItemBack {
    func addNewItem(Item:String)
}




class AddVC: UIViewController {
    
    
    //MARK: -OutLets

    @IBOutlet weak var textAddTF: UITextField!
    @IBOutlet weak var addBtnOutLtes: UIButton!
    

//MARK: -Constrans
    var Delegat: addNewItemBack?
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if textAddTF.text != ""{
        self.Delegat?.addNewItem(Item: self.textAddTF.text!)
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //MARK: -IBActions
    
    @IBAction func addBtnPressed(_ sender: UIButton) {
        if textAddTF.text != ""{
            self.navigationController?.popViewController(animated: true)
        }else{
            //TODO: -Alert
            
            let alert = UIAlertController.init(title: "Alert", message: "There is no Item Found", preferredStyle: .alert)
            
            let alertBTN = UIAlertAction.init(title: "Cancel", style: .destructive, handler: nil)
            
            
            alert.addAction(alertBTN)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    
    //MARK: -Helper Functions
    
    
}
