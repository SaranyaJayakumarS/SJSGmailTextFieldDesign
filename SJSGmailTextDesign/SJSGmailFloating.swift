//
//  SJSGmailFloating.swift
//  DemoGmailDesign
//
//  Created by Saranya Jayakumar on 17/01/19.
//  Copyright © 2019 Vimal Das. All rights reserved.
//

import UIKit

@IBDesignable
class SJSGmailFloating: UIView,UITextFieldDelegate {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    @IBInspectable
    var cornerRadius:CGFloat = 5 {
        didSet{
            
            vw.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var bordercolor:UIColor = .gray {
        didSet{
            
            vw.layer.borderColor = bordercolor.cgColor
        }
    }
    @IBInspectable
    var borderWidth:CGFloat = 5 {
        didSet{
            
            vw.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var placeHolderString:String = "" {
        didSet{
            
            placeholder.text = placeHolderString
        }
    }
    
    @IBInspectable
    var bgColor:UIColor = .white {
        didSet{
            
            vw.backgroundColor = bgColor
        }
    }
    
    @IBInspectable
    var secureText:Bool = false
    {
        didSet{
            txtfld.isSecureTextEntry = secureText
            
        }
    }
    
    var placeholder:UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    var txtfld:UITextField = {
        let txt = UITextField()
        return txt
    }()
    var vw:UIView = {
        let view = UIView()
        return view
    }()
    
    var constraint: NSLayoutConstraint?
    
    func setupUI(){
        txtfld.delegate = self
        
        addSubview(vw)
        vw.addSubview(txtfld)
        addSubview(placeholder)
      self.backgroundColor = .clear
        
        
        vw.translatesAutoresizingMaskIntoConstraints = false
        vw.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        vw.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        vw.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        vw.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        
        txtfld.translatesAutoresizingMaskIntoConstraints = false
        txtfld.leftAnchor.constraint(equalTo: vw.leftAnchor, constant: 16).isActive = true
        txtfld.rightAnchor.constraint(equalTo: vw.rightAnchor, constant: -16).isActive = true
        txtfld.topAnchor.constraint(equalTo: vw.topAnchor, constant: 8).isActive = true
        txtfld.bottomAnchor.constraint(equalTo: vw.bottomAnchor, constant: -8).isActive = true
        
        
        
        placeholder.translatesAutoresizingMaskIntoConstraints = false
        placeholder.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
        placeholder.heightAnchor.constraint(equalToConstant: 20).isActive = true
        constraint = placeholder.bottomAnchor.constraint(equalTo: vw.topAnchor, constant: self.bounds.height/2 + 13 )
            
        constraint?.isActive = true
        
        placeholder.backgroundColor = .clear
        
//        placeholder.translatesAutoresizingMaskIntoConstraints = false
//        placeholder.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
//        placeholder.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        constraint?.constant = self.bounds.height/2 - 20
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == ""{
            
            
            
            
            constraint?.constant = self.bounds.height/2 + 10
            UIView.animate(withDuration: 0.3) {
                self.layoutIfNeeded()
            }
        }
        else{
            
            
        }
    }
}
