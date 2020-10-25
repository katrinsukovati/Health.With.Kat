//
//  ViewController.swift
//  Health.With.Kat
//
//  Created by Katrin Sukovati on 2020-07-24.
//  Copyright © 2020 Katrin Sukovati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    
    var nameText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func firstBtn(_ sender: Any) {
        self.nameText = userName.text!
        performSegue(withIdentifier: "SegueFirst", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! _ndPageViewController
        vc.finalName = self.nameText
        
    }
}

