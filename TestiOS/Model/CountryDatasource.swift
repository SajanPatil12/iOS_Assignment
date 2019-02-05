//
//  CountryDatasource.swift
//  TestiOS
//
//  Copyright © 2019 Sajan. All rights reserved.
//

import UIKit

class CountryDatasource: NSObject {

    class func dataList() -> [Country] {
        let dataList = [
            Country(title: "Beavers", desc: "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony", imageUrl: "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"),
            Country(title: "Flag", desc: "http://images.findicons.com/files/icons/662/world_flag/128/flag_of_canada.png", imageUrl: ""),
            Country(title: "Transportation", desc: "It is a well known fact that polar bears are the main mode of transportation in Canada. They consume far less gas and have the added benefit of being difficult to steal.", imageUrl: "http://1.bp.blogspot.com/_VZVOmYVm68Q/SMkzZzkGXKI/AAAAAAAAADQ/U89miaCkcyo/s400/the_golden_compass_still.jpg"),
            Country(title: "Hockey Night in Canada", desc: "These Saturday night CBC broadcasts originally aired on radio in 1931. In 1952 they debuted on television and continue to unite (and divide) the nation each week.", imageUrl: "http://fyimusic.ca/wp-content/uploads/2008/06/hockey-night-in-canada.thumbnail.jpg"),
            Country(title: "Eh", desc: "A chiefly Canadian interrogative utterance, usually expressing surprise or doubt or seeking confirmation.", imageUrl: ""),
            Country(title: "Housing", desc: "Warmer than you might think.", imageUrl: "http://icons.iconarchive.com/icons/iconshock/alaska/256/Igloo-icon.png"),
        ]
        return dataList
    }

}
