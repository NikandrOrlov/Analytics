//
//  TableViewViewController.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/13/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import UIKit
import STT

class TableViewViewController: SttViewController<TableViewPresenter>, TableViewViewDelegate, SearchBarDelegate {
    
    @IBOutlet var listBastard: UIBarButtonItem!
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var search: UIBarButtonItem!
    
    var searchBar: UISearchBar!
    var searchHandler: SttHanlderSearchBar!
    var searchDelegate: SearchBarDelegate!
    
    private var _source: CellTableViewSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.tableFooterView = UIView()
        
        settings()
        setHandler()
	}
    
    func settings() {
        
        searchHandler = SttHanlderSearchBar()
        navigationItem.leftBarButtonItem = listBastard
        searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 50))
        searchBar.showsCancelButton = true
        search.target = self
        search.action = #selector(didNavItemTap(_:))
        searchBar.delegate = self
    }
    
    func setHandler() {
        searchHandler.addTarget(
            type: .shouldBeginEditing,
            delegate: self,
            handler: { [weak self] (_, bar) in
                self?.presenter.input.value = bar.text ?? ""
        })
    }
    
    @IBAction func didNavItemTap(_ sender: AnyObject) {
//       _ = navigationItem.titleView = searchBar
        navigationItem.leftBarButtonItem?.customView = searchBar
//        searchBar.delegate = self
    }
    
    var set: SttBindingSet<TableViewViewController>!
    
    override func bind() {
        super.bind()
        set = SttBindingSet(parent: self)
        
        _source = CellTableViewSource(tableView: tableView, collection: presenter.collection)
        
        set.apply()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.leftBarButtonItem?.customView = nil
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.input.value = searchText
    }
    
    func updateCellHeight(index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        tableView.reloadRows(at: [indexPath], with: .none)
    }
    
    
	// MARK: - implementation of TableViewViewDelegate
    //MARK: - implementation of SearchBarDelegate
}
