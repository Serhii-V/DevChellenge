//
//  parceJSONData.swift
//  QrBill
//
//  Created by Serhii on 5/6/17.
//  Copyright © 2017 DevChallenge. All rights reserved.
//

import Foundation

func xmlPars(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) -> [MenuItem] {
    var currentMenuItem = [MenuItem]()
    
    //if elementName == "tag" {
        //let tempTag = [Tag]() ;
//        if let name = attributeDict["name"] {
//            tempTag.name = name;
//            print("\(tempTag.name)")
//        }
//        if let c = attributeDict["price"] {
//            if let count = Double(c) {
//                tempTag.price = count;
//                print("\(tempTag.price)")
//            }
//        }
//        
//        if let c = attributeDict["quantity"] {
//            if let count = Int(c) {
//                tempTag.quantity = count;
//                print("\(tempTag.quantity)")
//            }
//        }
        
//        currentMenuItem.append(tempTag);
  //}
   return currentMenuItem
}



