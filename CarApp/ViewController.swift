//
//  ViewController.swift
//  CarApp
//
//  Created by ThuraOo on 10/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableViewContainer: UIView!
    @IBOutlet weak var tableViewContainerOffsetY: NSLayoutConstraint!
    @IBOutlet weak var searchResultBarOffsetY: NSLayoutConstraint!
    @IBOutlet weak var searchBarOffsetY: NSLayoutConstraint!
    @IBOutlet weak var goBtnWidth: NSLayoutConstraint!
    @IBOutlet var searchBarOffsetX: NSLayoutConstraint!
    @IBOutlet weak var searchBarOffsetXEnd: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblRent: UILabel!
    @IBOutlet weak var alertBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        hideTableContainer(animate: false)
    }
    
    @IBAction func backArrowPressed(_ sender: UIButton) {
        hideTableContainer(animate: true)
    }
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
        showTableContainer(animate: true)
    }
    
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: "TableCell")
    }
    private func prepareUI() {
        tableViewContainerOffsetY.constant = self.view.bounds.height
        self.view.layoutIfNeeded()
    }
    
    private func hideTableContainer(animate: Bool) {
        searchResultBarOffsetY.constant = -120
        searchBarOffsetY.constant = self.view.bounds.height - 320
        searchBarOffsetX.constant = 20
        searchBarOffsetXEnd.constant = 20
        goBtnWidth.constant = 60
        tableViewContainerOffsetY.constant = self.view.bounds.height
        
        if (animate) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                self.alertBtn.transform = CGAffineTransform(scaleX: 1, y: 1)
                self.lblRent.layer.opacity = 1
                self.view.backgroundColor = UIColor.secondarySystemBackground
                self.view.layoutIfNeeded()
            }, completion: {res in })
        } else {
            self.alertBtn.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.lblRent.layer.opacity = 1
            self.view.backgroundColor = UIColor.secondarySystemBackground
            self.view.layoutIfNeeded()
        }
    }
    
    private func showTableContainer(animate: Bool) {
        searchResultBarOffsetY.constant = 0
        searchBarOffsetY.constant = 70
        searchBarOffsetX.constant = 0
        searchBarOffsetXEnd.constant = 0
        goBtnWidth.constant = 0
        tableViewContainerOffsetY.constant = 190
        if (animate) {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                self.alertBtn.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
                self.lblRent.layer.opacity = 0
                self.view.backgroundColor = UIColor.white
                self.view.layoutIfNeeded()
            }, completion: {res in })
        } else {
            self.alertBtn.transform = CGAffineTransform(scaleX: 0, y: 0)
            self.lblRent.layer.opacity = 0
            self.view.backgroundColor = UIColor.white
            self.view.layoutIfNeeded()
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        return cell
    }
    
    
}

