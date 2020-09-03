//
//  ViewControllerTwo.swift
//  VideoPayBackgroundDemo
//
//  Created by Rajesh Kumar Sahil on 07/07/2020.
//  Copyright © 2020 Rajesh Kumar Sahil. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController {

    @IBOutlet weak var showBtn: UIButton!
    let tableView = UITableView()
    
    let height:CGFloat = 250
    var screenSize = UIScreen.main.bounds.size
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showBack))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func onTapShowBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
        
        let transection = CATransition()
        transection.duration = 0.5
        transection.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        transection.type = CATransitionType.push
        transection.subtype = .fromTop
//        self.view.window?.layer.add(transection, forKey: kCATransition)
//        self.present(vc!, animated: true, completion: nil)
        self.navigationController?.view.layer.add(transection, forKey: nil)
        navigationController?.pushViewController(vc!, animated: true)
        
//        tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: height)
//        self.view.addSubview(tableView)
//
//        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
////            self.view.backgroundColor = UIColor.gray.withAlphaComponent(0.9)
//
//            self.view.alpha = 0.5
//            self.tableView.frame = CGRect(x: 0, y: self.screenSize.height - self.height, width: self.screenSize.width, height: self.height)
//        }, completion: nil)
    }
    
    @objc func showBack(){
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
//            self.view.backgroundColor = UIColor.black.withAlphaComponent(1.0)
            self.view.alpha = 1.0
            self.tableView.frame = CGRect(x: 0, y: self.screenSize.height, width: self.screenSize.width, height: self.height)
        }, completion: nil)
    }
}
