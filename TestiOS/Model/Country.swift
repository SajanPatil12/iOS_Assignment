//
//  Country.swift
//  TestiOS
//
//  Copyright © 2019 Sajan. All rights reserved.
//

import UIKit
import SwiftyJSON

class Country: NSObject {

    var title : String?
    var desc: String?
    var imageUrl : String?
    
    init(dict:[String : JSON]) {
        
        self.title = dict["title"]?.stringValue
        self.desc = dict["description"]?.stringValue
        self.imageUrl = dict["imageHref"]?.stringValue
    }

    init(title: String, desc: String, imageUrl: String) {
        self.title = title
        self.desc = desc
        self.imageUrl = imageUrl
    }

}
