//
//  defineOfData.swift
//  QrBill
//
//  Created by Serhii on 5/7/17.
//  Copyright © 2017 DevChallenge. All rights reserved.
//

import Foundation

func defineDataType()-> String {
    let nsStringQrData = NSString(string: "\(qrData!)")
    
    if nsStringQrData.contains("https") {
        if nsStringQrData.contains("json") {
            //print("https_Json")
            return "https_Json"
        } else {
           // print("https_xml")
            return "https_xml"
        }
    } else {
        if nsStringQrData.contains("xml") {
            //print("xml")
            return "xml"
        } else {
            //print("Json")
            return "Json"
        }
    }
}
