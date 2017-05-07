import Foundation


func xmlParce(sourceString: String ) -> [MenuItem] {
    var currentMenuItem = [MenuItem]()
    
    let separators = CharacterSet(charactersIn: "<,>")
    var currentArrey = [String]()
    var tempArray = sourceString.components(separatedBy: separators)
    var counter = 0
    let item = MenuItem()
    
    for i in tempArray {
        if i == "name" || i == "price" || i == "quantity" {
            currentArrey.append(tempArray[counter])
            currentArrey.append(tempArray[counter + 1])
        }
        counter += 1
    }
    
    counter = 0
    for i in currentArrey {
        if i == "name" {
            item.name = currentArrey[counter+1]
        }
        if i == "price" {
            item.price = Double(currentArrey[counter+1])!
        }
        if i == "quantity"{
            item.quantity = Int(currentArrey[counter+1])!
            currentMenuItem.append(item)
        }
        counter += 1
    }
    return currentMenuItem
}








