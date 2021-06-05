//
//  ToDoTVCell.swift
//  ToDo List
//
//  Created by Ahmed Ashraf on 02/06/2021.
//

import UIKit

class ToDoTVCell: UITableViewCell {
    
    
    //MARK: -OutLets
    
    
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = backView.frame.height / 9
//            backView.layer.borderWidth = 3
//            backView.layer.borderColor = #colorLiteral(red: 0.4125531356, green: 0.5797008168, blue: 0.2997710136, alpha: 1)
            backView.layer.shadowOpacity = 0.5
            backView.layer.shadowOffset = CGSize(width: 0, height: 4)
            
            
        }
    }
    @IBOutlet weak var inputToDoOutlets: UILabel!
    @IBOutlet weak var upBtnOutLets: UIButton!
    @IBOutlet weak var downBtnOutLets: UIButton!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    
    
    
    //MARK: -IBAction
    
    @IBAction func upBtnPressed(_ sender: UIButton) {
    }
    
    
    
    
    @IBAction func downBtnPressed(_ sender: UIButton) {
    }
    
    
    //MARK: -HelperFunctions


}
