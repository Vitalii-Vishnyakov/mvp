//
//  ViewController.swift
//  mvp
//
//  Created by Виталий on 26.02.2022.
//

import UIKit

class MainViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var greetingLabel : UILabel!
    
    
    var presenter : MainViewPresenterProtocol!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: - IBAction
    @IBAction func didTapButtonAction ( _ sender : Any){
        self.presenter.showGreeting()
    }


}

extension MainViewController : MainViewProtocol{
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
    
    
}

