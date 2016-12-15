//
//  ImageLabelButton.swift
//  ImageLabelButton
//
//  Created by Patrick Gao on 14/12/16.
//  Copyright © 2016 com.patrickgao. All rights reserved.
//

import UIKit

@IBDesignable
class ImageLabelButton: UIButton{
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    let buttonImgView = UIImageView()
    let buttonLabel = UILabel()
    //    let stackView = UIStackView()
    
    
    
    
    @IBInspectable
    var imageWidth: CGFloat {
        get {
            return self.buttonImgView.frame.width
        }
        set(width) {
            self.buttonImgView.frame.size.width = width
        }
    }
    
    @IBInspectable
    var imageHeight: CGFloat {
        get {
            return self.buttonImgView.frame.size.height
        }
        
        set(height) {
            self.buttonImgView.frame.size.height = height
        }
    }
    
    @IBInspectable
    var imageLabelDistance: CGFloat = 8.0
    
    
    
    
    // Porperties for default state
    @IBInspectable
    var textColor:UIColor? {
        
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var labelText:String? {
        didSet{
            self.setNeedsDisplay()
        }
    }
    @IBInspectable
    var buttonImg: UIImage? {
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    // Porperties for default selected
    @IBInspectable
    var selectedTextColor:UIColor? {
        
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    @IBInspectable
    var selectedLabelText:String? {
        didSet{
            self.setNeedsDisplay()
        }
    }
    @IBInspectable
    var selectedButtonImg: UIImage? {
        didSet{
            self.setNeedsDisplay()
        }
    }
    
    override var isSelected: Bool {
        didSet{
            print(self.isSelected)
            if isSelected{
                self.buttonLabel.textColor = self.selectedTextColor
                self.buttonLabel.text = selectedLabelText
                self.buttonImgView.image = selectedButtonImg
            }
            else {
                self.buttonLabel.textColor = self.textColor
                self.buttonLabel.text = self.labelText
                self.buttonImgView.image = self.buttonImg
            }
           // self.setNeedsDisplay()
        }
    }
    
    
    
    convenience init() {
        self.init(frame:CGRect.zero)
        // Init button
        self.initButton()
        self.updateButton()
    }
    
    override init(frame:CGRect){
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.initButton()
    }
    
    // Init for loading in Interface Builder
    override func prepareForInterfaceBuilder() {
        self.initButton()
        self.updateButton()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initButton()
        self.updateButton()
    }
    override func layoutSubviews() {
        self.updateButton()
    }
    
    func initButton(){
        // Init computed properties
        self.imageLabelDistance = 8.0
        self.imageWidth = 35.0
        self.imageHeight = 35.0
//        self.labelText = "Button Label"
//        self.textColor = UIColor(red: 216.0/255.0, green: 216.0/255.0, blue: 216.0/255.0, alpha: 1.0)
        
        
        buttonImgView.frame.size = CGSize(width:imageWidth, height:imageHeight)
        buttonImgView.frame.origin = CGPoint(x: self.frame.width / 2.0 - buttonImgView.frame.width / 2.0, y: 8.0)
        buttonImgView.contentMode = .center
        
        buttonLabel.frame.size = CGSize(width: 45.5, height:17.0)
        buttonLabel.frame.origin = CGPoint(x: self.frame.width / 2.0 - buttonLabel.frame.width / 2.0, y: (imageView?.frame.origin.y)! + imageHeight+8.0)
        buttonLabel.font = UIFont(name: "HelveticaLight", size: 17.0)
        self.frame.size.height = 8.0 + self.imageHeight + self.imageLabelDistance + self.buttonLabel.frame.size.height + 8.0
        
        //        stackView.addArrangedSubview(buttonImgView)
        //        stackView.addArrangedSubview(buttonLabel)
        //
        //        stackView.alignment = .Center
        //        stackView.distribution = .EqualSpacing
        //        stackView.axis = .Vertical
        
        
        
        self.addSubview(buttonImgView)
        self.addSubview(buttonLabel)
        //        stackView.centerXAnchor.constraintEqualToAnchor((superview?.centerXAnchor)!).active = true
        //        stackView.centerYAnchor.constraintEqualToAnchor((superview?.centerYAnchor)!).active = true
    }
    
    func updateButton() {
        print(self.isSelected)
        if isSelected{
            self.buttonLabel.textColor = self.selectedTextColor
            self.buttonLabel.text = selectedLabelText
            self.buttonImgView.image = selectedButtonImg
        }
        else {
            self.buttonLabel.textColor = self.textColor
            self.buttonLabel.text = self.labelText
            self.buttonImgView.image = self.buttonImg
        }

    }
    
    func scaleOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }, completion: nil)
    }
    
    func scaleIn() {
        UIView.animate(withDuration: 0.3, animations: {
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.scaleOut()
        self.scaleIn()
    }
}
