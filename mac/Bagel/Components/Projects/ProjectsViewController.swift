//
//  ProjectsViewController.swift
//  Bagel
//
//  Created by Yagiz Gurgul on 30/08/2018.
//  Copyright © 2018 Yagiz Lab. All rights reserved.
//

import Cocoa

class ProjectsViewController: BaseViewController, NSTableViewDelegate, NSTableViewDataSource
{
    var viewModel: ProjectsViewModel?
    var onProjectSelect : ((String) -> ())?
    
    @IBOutlet weak var tableView: BaseTableView!
    
    override func setup() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.viewModel?.onChange = { [weak self] in
            
            self?.refresh()
        }
        
    }
    
    func refresh() {
        
        self.tableView.reloadData()
    }
}

extension ProjectsViewController
{
    func numberOfRows(in tableView: NSTableView) -> Int {
        
        return self.viewModel?.itemCount() ?? 0
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        let cell:ProjectTableCellView = self.tableView.makeView(withOwner: nil)!
        cell.project = self.viewModel?.item(at: row)
        
        return cell
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        
        let selectedRow = self.tableView.selectedRow
        
        self.onProjectSelect?("asdas")
    }
}