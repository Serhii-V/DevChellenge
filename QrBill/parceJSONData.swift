//
//  parceJSONData.swift
//  QrBill
//
//  Created by Serhii on 5/6/17.
//  Copyright © 2017 DevChallenge. All rights reserved.
//

import Foundation

func parceJsonData(data: NSData)  -> [MenuItem] {
    var curentMenuItem = [MenuItem]()
    var tempMenuItem = [MenuItem]()

    do {
        let jsonResult = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
        
        let jsonMenu = jsonResult?.allValues as! [NSDictionary]
        for jsonItem in jsonMenu {
            let item = MenuItem()
            item.name = jsonItem["name"] as! String
            item.price = jsonItem["price"] as! Double
            item.quantity = jsonItem["quantity"] as! Int
            tempMenuItem.append(item)
        }
        
    } catch {
        print(error)
    }
    for i in 1...tempMenuItem.count {
        curentMenuItem.append(tempMenuItem[tempMenuItem.count - i])
    }
    return curentMenuItem
}
