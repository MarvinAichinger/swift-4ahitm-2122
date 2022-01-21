//
//  Model.swift
//  covid
//
//  Created by Aichinger Marvin on 14.01.22.
//

import Foundation

class Model {
    
    var bundeslaender = [String]()
    var fzHosp = [Int]()
    var fzICU = [Int]()
    
    //let queue = DispatchQueue(label: "covid")
    let link = "https://edufs.edu.htl-leonding.ac.at/~c.aberger/download/4ahitm/covid.json"
    
    /*init() {
        /*queue.async {
            let tuple = self.download()
            DispatchQueue.main.async {
                self.bundeslaender = tuple.0
                self.fzHosp = tuple.1
                self.fzICU = tuple.2
                if let view = self.tableView {
                    view.tableView.reloadData()
                }
            }
        }*/
    }*/
    
    func setData(tuple: ([String], [Int], [Int])) {
        self.bundeslaender = tuple.0
        self.fzHosp = tuple.1
        self.fzICU = tuple.2
    }
    
    func download() -> ([String], [Int], [Int]) {
        var bundeslaender = [String]()
        var fzHosp = [Int]()
        var fzICU = [Int]()
        
        if let url = URL(string: link) {
            if let data = try? Data(contentsOf: url) {
                print("data: \(data)")
                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) {
                    if let array = jsonObject as? [ [String: Any] ] {
                        for obj in array {
                            let bundesland = obj["Bundesland"] as! String
                            let hosp = obj["FZHosp"] as! Int
                            let icu = obj["FZICU"] as! Int
                            print(bundesland)
                            bundeslaender.append(bundesland)
                            fzHosp.append(hosp)
                            fzICU.append(icu)
                        }
                    }
                }
            }
        }
        
        return (bundeslaender, fzHosp, fzICU)
    }
}
