//
//  ModalVC.swift
//  Modality
//
//  Created by 양수빈 on 2022/04/30.
//

import UIKit

class ModalVC: UIViewController {
    
    static let identifier = "ModalVC"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
