import Foundation

func defineDataType()-> String {
    let nsStringQrData = NSString(string: "\(qrData!)")
    
    if nsStringQrData.contains("https") {
        if nsStringQrData.contains("json") {
            print("https_Json")
            return "https_JSON"
        } else {
            print("https_xml")
            return "https_XML"
        }
    } else {
        if nsStringQrData.contains("xml") {
            //print("xml")
            return "XML"
        } else {
            //print("Json")
            return "JSON"
        }
    }
}
