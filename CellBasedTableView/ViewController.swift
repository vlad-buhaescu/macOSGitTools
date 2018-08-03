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
    let tableViewData = [["Command":"Open directory","lastName":"Doe"],
                         ["Command":"Print Path in console","lastName":"Doe"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self  
        self.tableView.dataSource = self
    }
    
}

extension ViewController: NSTableViewDelegate {
    func tableViewSelectionDidChange(_ notification: Notification) {
        let table = notification.object as! NSTableView
        print(table.selectedRow)
        
        switch table.selectedRow {
        case 0:
            let output1 = "pwd".run()
            print("\(output1!)")
        case 1:
            let output1 = "open .".run()
            print("\(output1!)")
        default:
            break
        }
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
        print("tableColumn?.identifier  \(tableColumn?.identifier)")
        return tableViewData[row][(tableColumn?.identifier)!]
    }
}

