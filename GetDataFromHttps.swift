import Foundation

func getJsonAndParceFromHttps(sourceString: String) -> [MenuItem] {
    //print(sourceString)
    var currentMenuItem = [MenuItem]()
    var tempMenuItem = [MenuItem]()
    
    let url = URL(string: sourceString)
    URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
        guard let data = data, error == nil else { return }
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
            print("jsonResult")
            let jsonMenu = jsonResult?.allValues as! [NSDictionary]
            print("jsonMenu")
            for jsonItem in jsonMenu {
                let item = MenuItem()
                item.name = jsonItem["name"] as! String
                //print(item.name)
                item.price = jsonItem["price"] as! Double
                //print(item.name)

                item.quantity = jsonItem["quantity"] as! Int
                //print(item.name)
                tempMenuItem.append(item)
                
                
            }
            //return currentMenuItem
            
        } catch let error as NSError {
            print(error)
            print("errrrrrr")
        }
    }).resume()
    for i in 0..<tempMenuItem.count {
        currentMenuItem.append(tempMenuItem[tempMenuItem.count - i])
    }
    print("Json_https was parsed")
    return currentMenuItem
}

func getXmlAndParceFromHttps(sourceString: String) -> [MenuItem] {
    var currentMenuItem = [MenuItem]()
    print(sourceString)
    let url = URL(string: sourceString)
    URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
        guard let data = data, error == nil else { return }
        
        do {
            let xmlResult = "\(data)"
            var currentMenuItem = [MenuItem]()
            
            let separators = CharacterSet(charactersIn: "<,>")
            var currentArray = [String]()
            var tempArray = xmlResult.components(separatedBy: separators)
            var counter = 0
            let item = MenuItem()
            
            for i in tempArray {
                if i == "name" || i == "price" || i == "quantity" {
                    currentArray.append(tempArray[counter])
                    currentArray.append(tempArray[counter + 1])
                }
                counter += 1
            }
            
            counter = 0
            for i in currentArray {
                if i == "name" {
                    item.name = currentArray[counter+1]
                }
                if i == "price" {
                    item.price = Double(currentArray[counter+1])!
                }
                if i == "quantity"{
                    item.quantity = Int(currentArray[counter+1])!
                    currentMenuItem.append(item)
                }
                counter += 1
            }
        }
        }).resume()
    return currentMenuItem
}

