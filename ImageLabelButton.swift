//
//  ImageLabelButton.swift
//  ImageLabelButton
//
//  Created by Patrick Gao on 14/12/16.
//  Copyright © 2016 com.patrickgao. All rights reserved.
//

import UIKit

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
    var labelText:String? {
        get {
            return self.buttonLabel.text
        }
        set(textString) {
            self.buttonLabel.text = textString
        }
    }
    @IBInspectable
    var buttonImg: UIImage? {
        get {
            return self.buttonImgView.image
        }
        set(image) {
            self.buttonImgView.image = image
        }
    }
    
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
    
    convenience init() {
        print("ttttt")
        self.init(frame:CGRect.zero)
        self.setUpButton()
    }
    
    override init(frame:CGRect){
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.setUpButton()
    }
    
    // Init for loading in Interface Builder
    override func prepareForInterfaceBuilder() {
        self.setUpButton()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUpButton()
    }
    override func layoutSubviews() {
        self.setUpButton()
    }
    
    func setUpButton(){
        
        self.frame.size.height = 62
        buttonImgView.frame.size = CGSize(width:imageWidth, height:imageHeight)
        buttonImgView.frame.origin = CGPoint(x: self.frame.width / 2.0 - buttonImgView.frame.width / 2.0, y: 15.5)
        buttonImgView.contentMode = .center
        
        buttonLabel.frame.size = CGSize(width: 45.5, height:11.0)
        buttonLabel.frame.origin = CGPoint(x: self.frame.width / 2.0 - buttonLabel.frame.width / 2.0, y: (imageView?.frame.origin.y)! + imageHeight+8.0)
        buttonLabel.font = UIFont.systemFont(ofSize: 11.0)
        
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
}
