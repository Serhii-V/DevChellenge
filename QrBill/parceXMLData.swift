import Foundation


func xmlParce(sourceString: String ) -> [MenuItem] {
    var currentMenuItem = [MenuItem]()
    
    let separators = CharacterSet(charactersIn: "<,>")
    var currentArray = [String]()
    var tempArray = sourceString.components(separatedBy: separators)
    var counter = 0
    
    
    
    for i in tempArray {
        if i == "name" || i == "price" || i == "quantity" {
            currentArray.append(tempArray[counter])
            currentArray.append(tempArray[counter + 1])
        }
        counter += 1
    }
    
    for i in currentArray {
        print(i)
    }
    
    var items = MenuItem()
    
    for i in 0..<currentArray.count {
        if currentArray[i] == "name" {
            items.name = currentArray[i+1]
        }
        if currentArray[i] == "price" {
            items.price = Double(currentArray[i+1])!
        }
        if currentArray[i] == "quantity"{
            items.quantity = Int(currentArray[i+1])!
           currentMenuItem.append(items)
            items = MenuItem()
            
        }
        
    }
    for i in currentMenuItem {
        print(i.name)
    }
    return currentMenuItem
}








