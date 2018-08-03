//
//  ViewController.swift
//  CellBasedTableView
//
//  Created by Debasis Das on 5/15/17.
//  Copyright © 2017 Knowstack. All rights reserved.
//

//Cell based NSTableView using datasource.
import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tableView:NSTableView!
    let tableViewData = [["firstName":"John","lastName":"Doe","emailId":"john.doe@knowstack.com"],["firstName":"Jane","lastName":"Doe","emailId":"jane.doe@knowstack.com"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self  
        self.tableView.dataSource = self
    }
    
}

//        let output = "open .".run()
//        let output1 = "pwd".run()
//        print("\(output1)")
//

extension ViewController: NSTableViewDelegate {
    func tableViewSelectionDidChange(_ notification: Notification) {
        let table = notification.object as! NSTableView
        print(table.selectedRow)
    }
}


extension String {
    func run() -> String? {
        let pipe = Pipe()
        let process = Process()
        process.launchPath = "/bin/sh"
        process.arguments = ["-c", self]
        process.standardOutput = pipe
        
        let fileHandle = pipe.fileHandleForReading
        process.launch()
        
        return String(data: fileHandle.readDataToEndOfFile(), encoding: .utf8)
    }
}

extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return tableViewData[row][(tableColumn?.identifier)!]
    }
}

