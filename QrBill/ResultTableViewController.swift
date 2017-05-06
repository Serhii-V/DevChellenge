//
//  ResultTableViewController.swift
//  QrBill
//
//  Created by Serhii on 5/6/17.
//  Copyright © 2017 DevChallenge. All rights reserved.
//

import UIKit

class ResultTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var menuItem = [MenuItem]()
    var reverseMenuItem = [MenuItem]()
    var json: [String:AnyObject] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let nsStringQrData: NSString = NSString(string: "\(qrData!)")
        let qrDataLikeNsData: NSData = nsStringQrData.data(using: String.Encoding.utf8.rawValue)! as NSData
        
        menuItem =  parceJsonData(data: qrDataLikeNsData)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "Item: \(menuItem[indexPath.row].name) " + " Price: \(menuItem[indexPath.row].price) " + "\n" + " Quantity: \(menuItem[indexPath.row].quantity) " + " Sum:\(Double(menuItem[indexPath.row].price) * Double(menuItem[indexPath.row].quantity) ) "
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    

}
