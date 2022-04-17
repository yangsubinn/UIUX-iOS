//
//  FeedVC.swift
//  TabBar
//
//  Created by 양수빈 on 2022/04/11.
//

import UIKit

class FeedVC: UIViewController {
    
    static let identifier = "FeedVC"
    
    // MARK: - Properties
    
    @IBOutlet weak var button: UIButton!
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red.withAlphaComponent(0.5)
    }
    
    // MARK: - Custom Methods
    
    @IBAction func buttonTapped(_ sender: Any) {
        guard let nextVC = UIStoryboard(name: "Second", bundle: nil).instantiateViewController(withIdentifier: SecondVC.identifier) as? SecondVC else { return }
        
        self.present(nextVC, animated: true)
    }
}
