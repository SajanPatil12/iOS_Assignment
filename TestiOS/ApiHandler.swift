//
//  ApiHandler.swift
//  TestiOS
//
//  Copyright © 2019 Sajan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ApiHandler: NSObject {
    
    
    func getDataFromURL(urlPath:String, CompletionHandler:(_ result: [String: Any]?,_  error: Error?) -> Void) {
        
        let urlString = urlPath
        let session = URLSession.shared
        let url = URL(string: urlString)!
        
        print("URL send = \(url)")
        
        //getting data from server with URL
        let task = session.dataTask(with: url) { (data, response, err) in
            
            if data != nil {
                
                do {
                    
                    let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                    print(json)
                } catch {
                    print("Could not serialise")
                }
            }
        }
        
        task.resume()
    }
    
    
    func getData(url: String, completionHandler: @escaping (_ json: JSON, _ status: Bool) -> ())
    {
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                if let temp = response.result.value
                {
                    let json = JSON(temp)
                    
                    if json == JSON.null
                    {
                        completionHandler(json, false)
                    }
                    else
                    {
                        completionHandler(json, true)
                    }
                }
                else
                {
                    if let data = response.data {
                        let json = String(data: data, encoding: String.Encoding.utf8)

                        if let data = json?.data(using: .utf8) {
                            if let json = try? JSON(data: data) {

                                completionHandler(json, false)
                            }
                        }
                        completionHandler(JSON.null, false)
                    }

                }
        }
    }

}
