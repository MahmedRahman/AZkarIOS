//
//  ViewController.swift
//  azkarApp
//
//  Created by Mohamed on 11/28/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AzkarCategoryObjs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell:AzkarCategoryTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AzkarCategoryRow", for: indexPath) as! AzkarCategoryTableViewCell
              
              Cell.AzkarCategoryName.text = AzkarCategoryObjs[indexPath.row].Name
        
         let ImageUrl = URL(string: "https://azkar.ijadatech.com/files/Category/\(AzkarCategoryObjs[indexPath.row].Image)")!
        
        
            Cell.downloadImage(url: ImageUrl)
        
              return Cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "SegueAzkar", sender: AzkarCategoryObjs[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let dis = segue.destination as? ViewController2 {
             
             if let AzkarCategoryObj = sender as? AzkarCategoryObj {
                 
                 dis.AzkarCategory = AzkarCategoryObj
                 
             }
             
         }
     }
    
    var AzkarCategoryObjs = Array<AzkarCategoryObj>()


    @IBOutlet weak var UITabelList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabelList.dataSource = self
        UITabelList.delegate = self
        let WebUrl = "https://azkar.ijadatech.com/api/Category/Get"
        ReadFromUrl(WebUrl: WebUrl)
    }
    
    
    func ReadFromUrl(WebUrl:String )  {
    
              guard let JsonUrl = URL(string: WebUrl) else { return }

         URLSession.shared.dataTask(with: JsonUrl) { (data, response, err) in
                    guard let data = data else { return }
                           do {
                            self.AzkarCategoryObjs = try JSONDecoder().decode([AzkarCategoryObj].self, from: data)
                            OperationQueue.main.addOperation({
                                 self.UITabelList.reloadData()
                              })
                              } catch let jsonErr {
                                  print("Error serializing json:", jsonErr)
                              }
                }.resume()
    }
    


}

