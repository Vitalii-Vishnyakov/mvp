//
//  DetailViewController.swift
//  mvp
//
//  Created by Виталий on 27.02.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var commentLabel: UILabel!
    var presenter : DetailViewPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setComment()
       
    }

    
}
extension DetailViewController : DetailViewProtocol{
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
}

