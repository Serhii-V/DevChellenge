import Foundation

func getJsonAndParceFromHttps(sourceString: String, delegate: HavingMenuItems)
    
{
    //print(sourceString)
    var delegate: HavingMenuItems = delegate

    var tempMenuItems = [MenuItem]()
    let url = URL(string: sourceString)
    URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
        guard let data = data, error == nil else { return }
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            print("jsonResult")
            let jsonMenu = jsonResult?.allValues as! [NSDictionary]
            print("jsonMenu")
            for (index, jsonItem) in jsonMenu.enumerated() {
                let item = MenuItem()
                item.name = jsonItem["name"] as! String
                //print(item.name)
                item.price = jsonItem["price"] as! Double
                //print(item.name)
                item.quantity = jsonItem["quantity"] as! Int
                //print(item.name)
                tempMenuItems.append(item)
                if index == jsonMenu.count-1 {
                    delegate.menuItems = tempMenuItems
                }
            }
        } catch let error as NSError {
            print(error)
        }
    }).resume()
    print("Json_https was parsed")
}



//
//func getXmlAndParceFromHttps(sourceString: String, delegate: HavingMenuItems) {
//    var currentMenuItem = [MenuItem]()
//    print(sourceString)
//    let url = URL(string: sourceString)
//    URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
//        guard let data = data, error == nil else { return }
//
//        do {
//            let xmlResult = "\(data)"
//            var currentMenuItem = [MenuItem]()
//
//            let separators = CharacterSet(charactersIn: "<,>")
//            var currentArray = [String]()
//            var tempArray = xmlResult.components(separatedBy: separators)
//            var counter = 0
//            let item = MenuItem()
//
//            for i in tempArray {
//                if i == "name" || i == "price" || i == "quantity" {
//                    currentArray.append(tempArray[counter])
//                    currentArray.append(tempArray[counter + 1])
//                }
//                counter += 1
//            }
//
//            counter = 0
//            for i in currentArray {
//                if i == "name" {
//                    item.name = currentArray[counter+1]
//                }
//                if i == "price" {
//                    item.price = Double(currentArray[counter+1])!
//                }
//                if i == "quantity"{
//                    item.quantity = Int(currentArray[counter+1])!
//                    currentMenuItem.append(item)
//                }
//                counter += 1
//            }
//        }
//        }).resume()
//    return currentMenuItem
//}

