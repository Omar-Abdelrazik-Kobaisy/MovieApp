//
//  testViewController.swift
//  swift_9_task
//
//  Created by Omar on 11/02/2023.
//

import UIKit

class testViewController: UIViewController {

    @IBOutlet weak var scroll_v: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        scroll_v.contentSize.height = 3000
        
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
