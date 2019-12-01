//
//  AzkarCategoryCollectionViewCell.swift
//  azkarApp
//
//  Created by Mohamed on 11/28/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import UIKit

class AzkarCategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var AzkarCategoryName: UILabel!
    
    @IBOutlet weak var AzkarCategoryImage: UIImageView!
    

    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(url: URL) {
        print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                self.AzkarCategoryImage.image = UIImage(data: data)
                self.AzkarCategoryImage.contentMode = .center
                self.AzkarCategoryImage.frame.size.height=100
                self.AzkarCategoryImage.frame.size.width=100
        }
    }
    
}
}
