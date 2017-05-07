import Foundation

func getJsonAndParceFromHttps() -> [MenuItem] {
    var currentMenuItem = [MenuItem]()
    var tempMenuItem = [MenuItem]()
    
    let url = URL(string: "https://ios-devchallenge-11.firebaseio.com/order_id.json")
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
