//
//  ViewController.swift
//  tableViewScrollToTop
//
//  Created by Amir Zucker on 02/07/2020.
//  Copyright © 2020 Amir Zucker. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "\(indexPath.row)"
        
        return cell ?? UITableViewCell()
    }
}


extension ViewController: UITextViewDelegate
{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    {
        if text == "\n"
        {
            myTableView.setContentOffset(.zero, animated: true)
        }
        
        return true
    }
}
