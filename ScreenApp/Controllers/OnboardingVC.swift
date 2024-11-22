//
//  OnboardingVC.swift
//  ScreenApp
//
//  Created by Jhonatan Chavez on 18/11/24.
//

import UIKit

class OnboardingVC: UIViewController {
    
    // IBoutlets
    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionPresentation: UICollectionView!
    @IBOutlet weak var btnConfig: UIButton!
    @IBOutlet weak var btnResetBackground: UIButton!

    // Variables
    let titleArray = ["¿Cansado de navegar en el caos?", "Prioriza tus ideas", "Sumérgete en un mundo nuevo"]
    
    let subtitleArray = ["Ordena tus ideas, y apunta al éxito", "Y ocupa más tiempo en ti, y en los tuyos", "¿Estás preparado para iniciar el camino?"]
    
    let imageArray = [
        ImageHelper.img1,
        ImageHelper.img2,
        ImageHelper.img3
    ]
    
    
}

// MARK: View life cycle
extension OnboardingVC{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionPresentation.dataSource = self
        collectionPresentation.delegate = self
        
        btnSignUp.layer.cornerRadius = 12
        btnLogin.layer.cornerRadius = 12
        btnConfig.layer.cornerRadius = 20
        btnResetBackground.layer.cornerRadius = 20
        btnLogin.layer.borderWidth = 1
        btnLogin.layer.borderColor = UIColor(named: "primaryColor")?.cgColor
        btnSignUp.isHidden = true
        btnLogin.isHidden = true
        
        pageControl.page = 0
        
    }
}

// MARK: IBActions

extension OnboardingVC{
    
    
    @IBAction func skipAction(_ sender: Any) {
        //showItem(at: 2)
        //skipShow(false)
        showPopupSkip()
    }
    
    
    @IBAction func pageControlAction(_ sender: Any) {
        showItem(at: pageControl.currentPage)
    }
    
    @IBAction func configAction(_ sender: Any){
        showPopupConfig()
    }
    
    @IBAction func resetAction(_ sender: Any){
        resetBackground()
    }
    
    
}


// MARK: Private functions
extension OnboardingVC{
    private func skipShow(_ bool: Bool){
        btnSkip.isHidden = !bool
        btnSignUp.isHidden = bool
        btnLogin.isHidden = bool
    }
    
    private func showItem(at index: Int){
        skipShow(index != 2)
        pageControl.page = index
        let indexPath = IndexPath(item: index, section: 0)
        collectionPresentation.scrollToItem(at: indexPath, at: [.centeredHorizontally, .centeredVertically], animated: true)
    }
    
    func normalize(value: CGFloat) -> CGFloat {
        let scale = UIScreen.main.bounds.width / 375.0
        return value * scale
    }
    
    func showPopupSkip(){
        let popupVC = PopupVC(nibName: "PopupVC", bundle: nil)
        popupVC.delegate = self
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.modalTransitionStyle = .crossDissolve
        self.present(popupVC, animated: true)
    }
    
    func showPopupConfig(){
        let popupColorVC = PopupColorVC(nibName: "PopupColorVC", bundle: nil)
        popupColorVC.delegate = self
        popupColorVC.modalPresentationStyle = .overFullScreen
        popupColorVC.modalTransitionStyle = .crossDissolve
        self.present(popupColorVC, animated: true)
    }
    
    func resetBackground(){
        view.backgroundColor = UIColor.systemBackground
    }
    
    
}

// MARK: UICollectionView Delegate and Datasources
extension OnboardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCell
        
        cell.widthCustomImage.constant = normalize(value: 260)
        cell.imgCustom.image = imageArray[indexPath.row]
        cell.lblTitle.text = titleArray[indexPath.row]
        cell.lblSubtitle.text = subtitleArray[indexPath.row]
        
        return cell
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.size.width
        let page = Int(floor((scrollView.contentOffset.x - pageWidth / 2)) / pageWidth + 1)
        pageControl.page = page
        skipShow(page != 2)
    }
    
}

extension UIPageControl{
    var page: Int{
        get {
            return currentPage
        }
        
        set{
            currentPage = newValue
            
            for index in 0..<numberOfPages where index != newValue{
                setIndicatorImage(ImageHelper.page, forPage: index)
            }
            setIndicatorImage(ImageHelper.pageSelected, forPage: newValue)
        }
    }
}

// MARK: PopupVC protocol
extension OnboardingVC: PopupVCDelegate{
    func didTapButton1() {
        let screen = Screen1VC(nibName: "Screen1VC", bundle: nil)
        if let navigationController = self.navigationController{
            navigationController.pushViewController(screen, animated: true)
        }
    }
    func didTapButton2() {
        let screen = Screen2VC(nibName: "Screen2VC", bundle: nil)
        if let navigationController = self.navigationController{
            navigationController.pushViewController(screen, animated: true)
        }
    }
}

// MARK: TableCustomColor Protocol
extension OnboardingVC: TableCustomColorDelegate{
    func didtapSelectedColor(color: UIColor) {
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = color
        }
    }
}
