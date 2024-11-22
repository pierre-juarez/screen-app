//
//  PopupColorVC.swift
//  ScreenApp
//
//  Created by Jhonatan Chavez on 20/11/24.
//

import UIKit

// MARK: Protocol
protocol TableCustomColorDelegate: AnyObject{
    func didtapSelectedColor(color: UIColor)
}

class PopupColorVC: UIViewController {
    
    weak var delegate: TableCustomColorDelegate?
    
    @IBOutlet weak var viewModal: UIView!
    @IBOutlet weak var tableColors: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModal.layer.cornerRadius = 12
        
        let nib = UINib(nibName: "TableColorCell", bundle: nil)
        tableColors.register(nib, forCellReuseIdentifier: "TableColorCell")
        
        tableColors.delegate = self
        tableColors.dataSource = self
        
        
    }
    
    @IBAction func closeAction(_ sender: Any){
        self.dismiss(animated: true)
    }
    
}

// MARK: Tableview datasource
extension PopupColorVC: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Colors.arrayColors.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableColorCell", for: indexPath) as! TableColorCell
        let optionSelected = Colors.arrayColors[indexPath.row]
        cell.configure(cellColor: optionSelected.color, nameColor: optionSelected.name)
        return cell
    }
}

// MARK: Tableview delegate

extension PopupColorVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionSelected = Colors.arrayColors[indexPath.row]
        self.delegate?.didtapSelectedColor(color: optionSelected.color)
        self.dismiss(animated: true)
    }
}
