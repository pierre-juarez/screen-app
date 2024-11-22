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
    let presentData : Int = 3
    
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
        return countCellsByMethod(at: presentData)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return didSelectByMethod(at: presentData, indexPath: indexPath, tableView: tableView)
    }
}

// MARK: Tableview delegate

extension PopupColorVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.didtapSelectedColor(color: colorByMethod(at: presentData, row: indexPath.row))
        self.dismiss(animated: true)
    }
}

// MARK: Custom functions
func cellForArray(indexPath: IndexPath, tableView: UITableView) -> TableColorCell{
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableColorCell", for: indexPath) as! TableColorCell
    let optionSelected = Colors.arrayColors[indexPath.row]
    cell.configure(cellColor: optionSelected.color, nameColor: optionSelected.name)
    return cell
}

func cellForDictionary(indexPath: IndexPath, tableView: UITableView) -> TableColorCell{
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableColorCell", for: indexPath) as! TableColorCell
    let keys = Array(Colors.dicColors.keys)
    let colorName = keys[indexPath.row]
    let cellColor = Colors.dicColors[colorName]!
    cell.configure(cellColor: cellColor, nameColor: colorName)
    return cell
}

func cellForStruct(indexPath: IndexPath, tableView: UITableView) -> TableColorCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TableColorCell", for: indexPath) as! TableColorCell
    let colorItem = Colors.arrayStruct[indexPath.row]
    cell.configure(cellColor: colorItem.color, nameColor: colorItem.name)
    return cell
}

func countCellsByMethod(at index : Int) -> Int{
    switch index {
    case 1:
        return Colors.arrayColors.count
    case 2:
        return Colors.dicColors.count
    case 3:
        return Colors.arrayStruct.count
    default:
        return 0
    }
}

func colorByMethod(at index: Int, row: Int)-> UIColor{
    switch index {
    case 1:
        let optionSelected = Colors.arrayColors[row]
        return optionSelected.color
    case 2:
        let keys = Array(Colors.dicColors.keys)
        let colorName = keys[row]
        let cellColor = Colors.dicColors[colorName]!
        return cellColor
    case 3:
        let optionSelected = Colors.arrayStruct[row]
        return optionSelected.color
    default:
        return UIColor.systemBackground
    }
}

func didSelectByMethod(at index: Int, indexPath: IndexPath, tableView: UITableView) -> TableColorCell{
    switch index {
    case 1:
        return cellForArray(indexPath: indexPath, tableView: tableView)
    case 2:
        return cellForDictionary(indexPath: indexPath, tableView: tableView)
    case 3:
        return cellForStruct(indexPath: indexPath, tableView: tableView)
    default:
        fatalError("Index not found")
    }
}
