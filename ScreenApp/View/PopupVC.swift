//
//  PopupVC.swift
//  ScreenApp
//
//  Created by Jhonatan Chavez on 19/11/24.
//

import UIKit

// MARK: Definition protocols
protocol PopupVCDelegate: AnyObject{
    func navigateToScreen(at screen: Int)
}


class PopupVC: UIViewController {
    
    weak var delegate: PopupVCDelegate?
    
    @IBOutlet weak var btnDoor1: UIButton!
    @IBOutlet weak var btnDoor2: UIButton!
    @IBOutlet weak var viewModal: UIView!
    
    
// MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnDoor1.layer.cornerRadius = 12
        btnDoor2.layer.cornerRadius = 12
        viewModal.layer.cornerRadius = 20
        
        
    }
    
// MARK: IBActions
    @IBAction func actionDoor1(_ sender: Any) {
        dismiss(animated: true) {
            self.delegate?.navigateToScreen(at: 1)
        }
    }
    
    @IBAction func actionDoor2(_ sender: Any) {
        dismiss(animated: true) {
            self.delegate?.navigateToScreen(at: 2)
        }
    }
    
    @IBAction func closePopup(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
