//
//  Model.swift
//  studyComments
//
//  Created by AHITM01 on 12.01.22.
//

import Foundation

class Model {
    
    var comments = [String]()
    var link = "https://jsonplaceholder.typicode.com/comments"
    
    let queue = DispatchQueue(label: "download")
    
    init() {
        queue.async {
            let comments = self.download()
            DispatchQueue.main.async {
                //self.comments = comments
                self.comments.append(comments[0])
            }
        }
    }
    
    func download() -> [String] {
        var comments = [String]()
        
        if let url = URL(string: link) {
            if let data = try? Data(contentsOf: url) {
                if let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) {
                    if let array = jsonObject as? [[String: Any]] {
                        for comment in array {
                            let text = comment["body"] as! String
                            comments.append(text)
                        }
                    }
                }
            }
        }
        
        return comments
    }
    
}
