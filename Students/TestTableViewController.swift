//
//  TestTableViewController.swift
//  Test
//
//  Created by Ben Gohlke on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol AddStudentDelegate {
    func newStudentWasAdded(with name: String)
}

class TestTableViewController: UITableViewController {
    
    var students: [String] = []
    var numberOfAssignments: Int = 0 {
        didSet {
            print("Number of assignments has changed: \(numberOfAssignments)")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Foo")
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = students[indexPath.row]

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddStudentSegue" {
            if let newStudentVC = segue.destination as? NewStudentViewController {
                newStudentVC.delegate = self
            }
        }
    }
}

extension TestTableViewController: AddStudentDelegate {
    func newStudentWasAdded(with name: String) {
        students.append(name)
        tableView.reloadData()
    }
}
