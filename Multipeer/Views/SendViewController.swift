//
//  SendViewController.swift
//  Multipeer
//
//  Created by Luciano Gucciardo on 06/03/2018.
//  Copyright © 2018 Luciano Gucciardo. All rights reserved.
//

import UIKit

class SendViewController: UIViewController {
    
    var value: Int = 0 {
        didSet {
            Sync.shared.send(data: value)
        }
    }

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBAction func stepper(_ sender: Any) {
        
        label.text = String(stepper.value)
        value = Int(stepper.value)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
