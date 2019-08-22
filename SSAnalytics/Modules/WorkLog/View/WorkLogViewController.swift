//
//  WorkLogViewController.swift
//  SSAnalytics
//
//  Created by Nikandr on 8/21/19.
//  Copyright © 2019 startupsoft. All rights reserved.
//

import Foundation
import UIKit
import STT

class WorkLogViewController: SttViewController<WorkLogPresenter>, WorkLogViewDelegate {
    
    @IBOutlet var viewPage: SttViewPagerHeader!
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings()
	}
    
    func settings() {
        
        self.navigationController?.createTransparent()
        
        viewPage.parent = self
        viewPage.scrollView = scrollView
        
        viewPage.titleTextColor = .red
        
        viewPage.setItem(view: storyboard!.instantiateViewController(withIdentifier: "Summary"), title: "Summary")
        viewPage.setItem(view: storyboard!.instantiateViewController(withIdentifier: "LogTime"), title: "LogTime")
    }

	// MARK: - implementation of WorkLogViewDelegate
}
