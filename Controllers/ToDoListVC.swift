//
//  ViewController.swift
//  ToDo List
//
//  Created by Ahmed Ashraf on 02/06/2021.
//

import UIKit
import DGElasticPullToRefresh


class ToDoListVC: UIViewController {
    
    //MARK: -OutLets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: -Constants
    
    var toDoArr: [String] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isHiddenHairline = true

        
        pullToRefresh()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
         tableView.separatorStyle = .none

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        tableView.dg_removePullToRefresh()
        navigationController?.isHiddenHairline = false

    }

    //MARK: -IBActions
    
    @IBAction func addNewBtnPressed(_ sender: UIBarButtonItem) {
        
        let addvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AddVC") as! AddVC
            
        addvc.Delegat = self
        
      //  addvc.modalPresentationStyle = .fullScreen
        
      //  present(addvc, animated: true, completion: nil)
        
        self.navigationController?.pushViewController(addvc, animated: true)   // علشان اروح بالنفيجيشن 
    }
    
    
    //MARK: -Helper Fuctions
    @objc func upBtnPressed(_ sender: UIButton){
        
        if sender.tag != 0{
            toDoArr.swapAt(sender.tag, sender.tag - 1)
            tableView.reloadData()
        }
        
    }
    @objc func downBynPressed(_ sender: UIButton){
        
        if sender.tag < toDoArr.count - 1 {
            toDoArr.swapAt(sender.tag, sender.tag + 1)
            tableView.reloadData()
            
        }
        
    }
    
    func pullToRefresh(){
          
          // Initialize tableView
          let loadingView = DGElasticPullToRefreshLoadingViewCircle()
          loadingView.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
              // Add your logic here
              // Do not forget to call dg_stopLoading() at the end
              self?.tableView.dg_stopLoading()
          }, loadingView: loadingView)
        tableView.dg_setPullToRefreshFillColor(#colorLiteral(red: 0.2041296959, green: 0.7789589763, blue: 0.3484356999, alpha: 1))
        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
      }
    
    
}

extension ToDoListVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToDoTVCell
        
        cell.inputToDoOutlets.text = toDoArr[indexPath.row]
        
        cell.upBtnOutLets.tag  = indexPath.row
        cell.downBtnOutLets.tag  = indexPath.row
        
        cell.upBtnOutLets.addTarget(self, action: #selector(self.upBtnPressed(_:)), for: .touchUpInside)
        cell.downBtnOutLets.addTarget(self, action: #selector(self.downBynPressed(_:)), for: .touchUpInside)
        
        
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        let removeArr = UIContextualAction(style: .destructive, title: "Delete") { (action, view, swip) in
            
            self.toDoArr.remove(at: indexPath.row)
            self.tableView.reloadData()
            
        }
//        let removeArr1 = UIContextualAction(style: .destructive, title: "Delete") { (action, view, swip) in
//
//            self.toDoArr.remove(at: indexPath.row)
//            self.tabeView.reloadData()
//
//        }
        removeArr.backgroundColor = .white
        removeArr.image = #imageLiteral(resourceName: "pin")
        
        
        let perform = UISwipeActionsConfiguration(actions: [removeArr,])
        
        perform.performsFirstActionWithFullSwipe = false
        return perform
    }
    
}
extension ToDoListVC: addNewItemBack{
    func addNewItem(Item: String) {
        toDoArr.append(Item)
        tableView.reloadData()
    }
    
    
}
