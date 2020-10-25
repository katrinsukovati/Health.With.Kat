//
//  2ndPageViewController.swift
//  Health.With.Kat
//
//  Created by Katrin Sukovati on 2020-07-24.
//  Copyright © 2020 Katrin Sukovati. All rights reserved.
//

import UIKit

class _ndPageViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    var finalName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = "Weclome " + finalName + "!"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
