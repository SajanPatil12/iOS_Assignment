//
//  ViewController.swift
//  TestiOS
//
//  Copyright © 2019 Sajan. All rights reserved.
//

import UIKit
import SVProgressHUD
import SDWebImage
import Alamofire

public let kBaseUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"

class ViewController: UIViewController,UITableViewDataSource {
    
    var dataArray:[Country] = []

    let countryCellReuseIdentifier = "CountryTableViewCellIdentifier"
    let dataList = CountryDatasource.dataList()
    let countryTableview = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.orange
        self.setUpNavigation()
        self.configureTableView()
        
//        self.getCountryDataApiCallFunc()
        
    }

    func configureTableView() {
        countryTableview.dataSource = self
        countryTableview.estimatedRowHeight = 600
        countryTableview.rowHeight = UITableViewAutomaticDimension
        countryTableview.register(CountryTableViewCell.self, forCellReuseIdentifier: countryCellReuseIdentifier)
        countryTableview.tableFooterView = UIView()
        view.addSubview(countryTableview)
        
        countryTableview.translatesAutoresizingMaskIntoConstraints = false
        countryTableview.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        countryTableview.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        countryTableview.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        countryTableview.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setUpNavigation() {
        navigationItem.title = "About Canada"
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 84/255.0, green: 179/255.0, blue: 200/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
    }


    // MARK:- UITableView DataSource Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = countryTableview.dequeueReusableCell(withIdentifier: countryCellReuseIdentifier, for: indexPath) as! CountryTableViewCell
        
//        let dataObj:Country = self.dataArray[indexPath.row]
        
        let data = dataList[(indexPath as NSIndexPath).row]

        cell.titleLabel.text = data.title
        cell.detailLabel.text = data.desc
        cell.cellImageView.sd_setImage(with: URL(string: data.imageUrl!), placeholderImage: UIImage(named: "placeholder_image"))

        return cell

    }

    // MARK: - Api Call.
    

    func getCountryDataApiCallFunc() {
        SVProgressHUD.show()
        let apiObj = ApiHandler()
        apiObj.getData(url: kBaseUrl) { (json, status) in
            print("Response : \(json)")
            if status
            {
                print(json.count)
                if json.count > 0 {
                    let responseArray = json.arrayValue
                    for (_, dataDict) in responseArray.enumerated() {
                        let dataObj = Country(dict:dataDict.dictionary!)
                        self.dataArray.append(dataObj)
                    }
                    DispatchQueue.main.async {
                        SVProgressHUD.dismiss()
                        self.countryTableview.reloadData()
                    }
                }
                else {
                    DispatchQueue.main.async {
                        SVProgressHUD.dismiss()
                    }
                }
            }
            else
            {
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

