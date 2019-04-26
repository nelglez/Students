//
//  NewStudentViewController.swift
//  Test
//
//  Created by Ben Gohlke on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class NewStudentViewController: UIViewController {

    @IBOutlet weak var studentNameTextField: UITextField!
    
    var delegate: AddStudentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action Handlers
    
    @IBAction func addStudentTapped(_ sender: Any) {
        // TODO: Send student name back to table view controller
        delegate?.newStudentWasAdded(with: studentNameTextField.text!)
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private Methods
    
}
