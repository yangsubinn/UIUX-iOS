//
//  ViewController.swift
//  Modality
//
//  Created by 양수빈 on 2022/04/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /// default
    @IBAction func automaticButtonTap(_ sender: Any) {
        guard let modalVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ModalVC.identifier) as? ModalVC else { return }
        modalVC.modalPresentationStyle = .automatic
        present(modalVC, animated: true)
    }
    
    /// fullscreen
    @IBAction func fullscreenButtonTap(_ sender: Any) {
        guard let modalVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ModalVC.identifier) as? ModalVC else { return }
        modalVC.modalPresentationStyle = .fullScreen
        present(modalVC, animated: true)
    }
    
    /// popover
    @IBAction func popoverButtonTap(_ sender: Any) {
        guard let modalVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ModalVC.identifier) as? ModalVC else { return }
        modalVC.modalPresentationStyle = .popover
        present(modalVC, animated: true)
    }
    
    /// pagesheet
    @IBAction func pagesheetButtonTap(_ sender: Any) {
        guard let modalVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ModalVC.identifier) as? ModalVC else { return }
        modalVC.modalPresentationStyle = .pageSheet
        present(modalVC, animated: true)
    }
    
    /// formsheet
    @IBAction func formsheetButtonTap(_ sender: Any) {
        guard let modalVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ModalVC.identifier) as? ModalVC else { return }
        modalVC.modalPresentationStyle = .fullScreen
        present(modalVC, animated: true)
    }
    
    /// currentContext
    @IBAction func currentcontextButtonTap(_ sender: Any) {
        guard let modalVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ModalVC.identifier) as? ModalVC else { return }
        modalVC.modalPresentationStyle = .currentContext
        present(modalVC, animated: true)
    }
    
    /// custom
    @IBAction func customButtonTap(_ sender: Any) {
        guard let modalVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ModalVC.identifier) as? ModalVC else { return }
        modalVC.modalPresentationStyle = .custom
        present(modalVC, animated: true)
    }
    
    /// overCurrentContext
    @IBAction func overCurrentContextButtonTap(_ sender: Any) {
        guard let modalVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ModalVC.identifier) as? ModalVC else { return }
        modalVC.modalPresentationStyle = .overCurrentContext
        present(modalVC, animated: true)
    }
    
    /// overFullscreen
    @IBAction func overFullscreenButtonTap(_ sender: Any) {
        guard let modalVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: ModalVC.identifier) as? ModalVC else { return }
        modalVC.modalPresentationStyle = .overFullScreen
        present(modalVC, animated: true)
    }
}

