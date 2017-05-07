//
//  parceJSONData.swift
//  QrBill
//
//  Created by Serhii on 5/6/17.
//  Copyright © 2017 DevChallenge. All rights reserved.
//

import Foundation


func xmlParce(sourceString: String ) -> [MenuItem] {
    var currentMenuItem = [MenuItem]()
    
    print("_____________")
    print(sourceString)
    print("_____________")
    
    let separators = CharacterSet(charactersIn: "<,>")
    
    
    var currentArrey = [String]()
    
   var tempArray = sourceString.components(separatedBy: separators)
    var counter = 0
    for i in tempArray {
        
        if i == "name" || i == "price" || i == "quantity" {
            currentArrey.append(tempArray[counter])
            currentArrey.append(tempArray[counter + 1])
        
        
        }
        counter += 1
    }

    
    for i in currentArrey {
        print(i)
    }
    print("xml was parsed")
    
    var count = 0
    
    let item = MenuItem()
    
    for i in currentArrey {
        
        if i == "name" {
            item.name = currentArrey[count+1]
        }
        if i == "price" {
            item.price = Double(currentArrey[count+1])!
        }
        if i == "quantity"{
            item.quantity = Int(currentArrey[count+1])!
            currentMenuItem.append(item)
            
        }
        count += 1
    }
    
    
    
    
    return currentMenuItem
}








//func xmlPars(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) -> [MenuItem] {
   // var currentMenuItem = [MenuItem]()
    
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
//


