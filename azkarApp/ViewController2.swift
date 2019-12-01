//
//  ViewController2.swift
//  azkarApp
//
//  Created by Mohamed on 11/28/19.
//  Copyright © 2019 Mohamed. All rights reserved.
//

import UIKit

class ViewController2: UIViewController,UITableViewDataSource,UITableViewDelegate {
  
    
    
    
    @IBOutlet weak var UIAzkarCellList: UITableView!
    
    
    var AzkarCategory:AzkarCategoryObj!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Azkars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        
        let Cell:UIAzkarCell = tableView.dequeueReusableCell(withIdentifier: "AzkarCell", for: indexPath) as! UIAzkarCell
        
        Cell.AzkarName.text = Azkars[indexPath.row].Name
    
        Cell.AzkarBody.text = Azkars[indexPath.row].Body
        
        return Cell
    
    }
    

    var Azkars = Array<Azkar>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIAzkarCellList.dataSource = self
        UIAzkarCellList.delegate = self
        
        let WebUrl = "https://azkar.ijadatech.com/api/Azkar/Get/\(AzkarCategory.Id)"
        
        ReadFromUrl(WebUrl: WebUrl)
        // Do any additional setup after loading the view.
    }
    
    func ReadFromUrl(WebUrl:String )  {
    
              guard let JsonUrl = URL(string: WebUrl) else { return }

         URLSession.shared.dataTask(with: JsonUrl) { (data, response, err) in
                    guard let data = data else { return }
                           do {
                            self.Azkars = try JSONDecoder().decode([Azkar].self, from: data)
                            
                           // print (self.Azkars.count)
                            OperationQueue.main.addOperation({
                              self.UIAzkarCellList.reloadData()
                              })
                              } catch let jsonErr {
                                  print("Error serializing json:", jsonErr)
                              }
                }.resume()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
