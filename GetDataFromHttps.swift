//
//  GetDataFromHttps.swift
//  QrBill
//
//  Created by Serhii on 5/7/17.
//  Copyright © 2017 DevChallenge. All rights reserved.
//

import Foundation


func getDataFromHttps() -> NSData {
    var result = NSData()
    
    
    let url = URL(string: "https://ios-devchallenge-11.firebaseio.com/order_id.json")
    URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
        guard let data = data, error == nil else { return }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
            
        let nsStringQrData = NSString(string: "\(json)")
        let qrDataLikeNsData: NSData = nsStringQrData.data(using: String.Encoding.utf8.rawValue)! as NSData
        
        result = qrDataLikeNsData
            print("\(qrDataLikeNsData)")

        } catch let error as NSError {
            print(error)
        }
    }).resume()
    return result
}
