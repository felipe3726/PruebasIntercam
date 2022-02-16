//
//  ViewController.swift
//  Prueba
//
//  Created by Felipe Martinez on 08/02/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var UserTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var RoundButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserTextField.delegate = self
        UserTextField.addBottomBorder()
        
        PasswordTextField.delegate = self
        PasswordTextField.addBottomBorder()
        
        RoundButton.isEnabled = false
        RoundButton.addTarget(self, action: #selector(clickButton), for: UIControl.Event.touchDown)
        RoundButton.layer.cornerRadius = 10
        RoundButton.clipsToBounds = true
    }

    func textField(_ UserField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if UserField == UserTextField{
        let allowChar = CharacterSet.letters
        let charSet = CharacterSet(charactersIn: string)
        
        let maxLength = 15
        let currentString: NSString = (UserField.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
            
            if currentString.length >= 3{
                //checkUser = true
                RoundButton.isEnabled = true
            }
        
        return allowChar.isSuperset(of: charSet) && newString.length <= maxLength
        }
        
        if UserField == PasswordTextField{
        
        let maxLength = 15
        let currentString: NSString = (UserField.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
            
            if currentString.length >= 7{
                //checkPass = true
                RoundButton.isEnabled = true
            }
        
        return newString.length <= maxLength
        }

        return true
    }
    
    
    @objc func clickButton(src: UIButton)->Void{

        var message:String = ""
        message = "Welcome"
        
        let alertController:UIAlertController = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertController.Style.alert)
        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:nil)
        
        // Add alertAction object to alertController.
        alertController.addAction(alertAction)
        // Popup the alert dialog.
        present(alertController, animated: true, completion: nil)
    }
    
    
    
}

extension UITextField {
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = UIColor.white.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
