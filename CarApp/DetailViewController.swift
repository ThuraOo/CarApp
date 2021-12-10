//
//  DetailViewController.swift
//  CarApp
//
//  Created by ThuraOo on 10/12/2021.
//

import UIKit

class DetailViewController : UIViewController {
    
    @IBAction func goBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
