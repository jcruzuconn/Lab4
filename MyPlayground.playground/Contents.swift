import Foundation
var arrayDict: [String:Int]
func getFromURL ()
{
let url = NSURL(string: "http://139.59.92.46/iOSBlogJSON/days.json")
let request = NSURLRequest(url: url! as URL)

NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main) {(response, data, error) in self.startParsing(data: data! as NSData)
}
}
func startParsing(data :NSData)
{
let dict: NSDictionary!=(try! JSONSerialization.jsonObject (with: data as Data, options: JSONSerialization.ReadingOptions.mutableContainers)) as? NSDictionary

for i in 0..<(dict.value(forKey: "Marvel") as! NSArray).count
{
    arrayDict.add((dict.value(forKey: "Marvel") as! NSArray).object(at: i))
}
for i in 0..<(dict.value(forKey: "DC") as! NSArray).count
{
    arrayDict.add((dict.value(forKey: "DC") as! NSArray).object(at: i))
}
}
