//
//  AnimalOpenData.swift
//  PinterestDemo
//
//  Created by 默司 on 2017/4/25.
//  Copyright © 2017年 默司. All rights reserved.
//

import UIKit

enum AnimalOpenDataResult {
    case ok([Animal])
    case fail(AnimalOpenDataError)
}

enum AnimalOpenDataError: Error {
    case unkown(Error)
    case nodata
    
    var localizedDescription: String {
        switch self {
        case .nodata:
            return "無法取得資料"
        case .unkown(let error):
            return error.localizedDescription
        }
    }
    
    func present() {
        let ac = UIAlertController(title: "Oooooooooops", message: localizedDescription, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel))
        UIApplication.shared.topViewController?.present(ac, animated: true)
    }
}

class AnimalOpenData: NSObject {
    static let shared = AnimalOpenData()
    
    private let url = "http://data.coa.gov.tw/Service/OpenData/AnimalOpenData.aspx"
    
    func get(_ completion: @escaping (_ result: AnimalOpenDataResult) -> Void) {
        
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
            
            DispatchQueue.main.async {
                if let error = error {
                    completion(.fail(.unkown(error)))
                    return
                }
                
                guard let data = data, let jsonItems = (try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)) as? [[String: Any]] else {
                    completion(.fail(.nodata))
                    return
                }
                
                let animals = jsonItems.map({ (json) -> Animal in
                    return Animal(json: json)
                })
                
                completion(.ok(animals))
            }
        }.resume()
    }
}
