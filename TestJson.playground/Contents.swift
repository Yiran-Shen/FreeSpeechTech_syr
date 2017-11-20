//: Playground - noun: a place where people can play

import UIKit

func convertDictionaryToString(dict:[String:String]) -> String {
    var result:String = ""
    do {
        let jsonData = try JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        if let JSONString = String(data: jsonData, encoding: String.Encoding.utf8) {
            result = JSONString
        }
        
    } catch {
        result = ""
    }
    return result
}

func convertStringToDictionary(text: String) -> [String:String]? {
    if let data = text.data(using: String.Encoding.utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: [JSONSerialization.ReadingOptions.init(rawValue: 0)]) as? [String:String]
        } catch let error as NSError {
            print(error)
        }
    }
    return nil
}


var str = "Hello, playground"
var my_dict = [String: String]()
my_dict["1"] = "Hello"
my_dict["2"] = "world"

var json_string:String = convertDictionaryToString(dict: my_dict)
print(json_string)




var my_new_dict = convertStringToDictionary(text:json_string)
if(my_new_dict != nil){
    print(my_new_dict!)
}









