import UIKit

var globalValue = [MenuItem]()

class ResultTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, XMLParserDelegate{

    var menuItem = [MenuItem]()
    var reverseMenuItem = [MenuItem]()
    var json: [String:AnyObject] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        prepereDataForCell()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.numberOfLines = 0
        
      
       // cell.textLabel?.text = "Item: \(menuItem[indexPath.row].name) " + " Price: \(menuItem[indexPath.row].price) " + "\n" + " Quantity: \(menuItem[indexPath.row].quantity) "// + " Sum:\(Double(menuItem[indexPath.row].price) * Double(menuItem[indexPath.row].quantity) ) "
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    
    func prepereDataForCell() {
        let nsStringQrData = NSString(string: "\(qrData!)")
        let qrDataLikeNsData: NSData = nsStringQrData.data(using: String.Encoding.utf8.rawValue)! as NSData

        let typeOfData = defineDataType()
        
        switch typeOfData {
        case "JSON":
            print(nsStringQrData)
            menuItem =  parceJsonData(data: qrDataLikeNsData)
            break
        case "XML":
            print(nsStringQrData)
            menuItem = xmlParce(sourceString: "\(nsStringQrData)")
            break
        case "https_XML":
            print("Fuck xml vs https parsing")
            break
        case "https_JSON":
            
            menuItem = getJsonAndParceFromHttps()
            for i in menuItem {
                print(i.name)
                print(i.price)
                print(i.quantity)
            }
            print("Json vs https parsing")
            break
        default:
            print("Ololo")
        }
        
  
    }
    

}
