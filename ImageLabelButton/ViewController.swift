//
//  ViewController.swift
//  ImageLabelButton
//
//  Created by Patrick Gao on 14/12/16.
//  Copyright © 2016 com.patrickgao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: ImageLabelButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonClicked(_ sender: ImageLabelButton) {
        self.button.isSelected = !self.button.isSelected
    }

}

