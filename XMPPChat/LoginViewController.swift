//
//  LoginViewController.swift
//  XMPPChat
//
//  Created by Patel Meet on 08/12/22.
//

import UIKit

protocol GetCountry{
    func CountryCode(name: String)
}

class LoginViewController: UIViewController, GetCountry {
    
    @IBOutlet weak var btnCountry: UIButton!
    @IBOutlet weak var buttonbottomConstrint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)

    }
    
    @objc internal func keyboardWillShow(_ notification : Notification?) -> Void {
           
           var _kbSize:CGSize!
           
           if let info = notification?.userInfo {

               let frameEndUserInfoKey = UIResponder.keyboardFrameEndUserInfoKey
               
               //  Getting UIKeyboardSize.
               if let kbFrame = info[frameEndUserInfoKey] as? CGRect {
                   
                   let screenSize = UIScreen.main.bounds
                   
                   //Calculating actual keyboard displayed size, keyboard frame may be different when hardware keyboard is attached (Bug ID: #469) (Bug ID: #381)
                   let intersectRect = kbFrame.intersection(screenSize)
                   
                   if intersectRect.isNull {
                       _kbSize = CGSize(width: screenSize.size.width, height: 0)
                   } else {
                       _kbSize = intersectRect.size
                   }
                   print("Your Keyboard Size \(_kbSize.height)")
                   buttonbottomConstrint.constant = _kbSize.height
               }
           }
       }

    func CountryCode(name: String) {
        btnCountry.setTitle(name, for: .normal)
    }
    @IBAction func OnClickSelectCountryCode(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "CountryViewController") as! CountryViewController
        vc.countryDelegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func OnClickSend(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
