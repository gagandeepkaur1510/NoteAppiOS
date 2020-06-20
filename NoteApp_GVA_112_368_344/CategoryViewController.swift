//
//  ViewController.swift
//  NoteApp_GVA_112_368_344
//
//  Created by Mac on 6/20/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var categorydata = [CategoryData]()
    var filterCategory = [CategoryData]()

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    @IBAction func addCategoryBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "New Category Name",message: "",preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save", style: .destructive) {
            [unowned self] action in
            guard let textField = alert.textFields?.first,
                let categoryNameTxtField = textField.text else {return}
            
            self.saveData(categoryName: categoryNameTxtField)
            self.tableview.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel",style: .cancel)
        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        searchBar.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          filterCategory = categorydata
          guard (UIApplication.shared.delegate as? AppDelegate) != nil else {return}
          
          loadData()
      }
    // Functions
    func saveData(categoryName: String){
        guard (UIApplication.shared.delegate as? AppDelegate) != nil else { return}
        
        let category = CategoryData(context: self.managedContext)
        category.name = categoryName
        categorydata.append(category)
        filterCategory.append(category)
        do {
            try managedContext.save()
        }catch let error as NSError {
            print("Error while saving. \(error), \(error.userInfo)")
        }
    }
    
    
    func loadData(with request : NSFetchRequest<CategoryData> = CategoryData.fetchRequest()){
        do{
            categorydata = try managedContext.fetch(request)
            filterCategory = categorydata
        } catch{
            print("Error while saving.. \(error)")
        }
    }
    
    //Table data
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        let categoryCell = tableview.dequeueReusableCell(withIdentifier: "categorycell", for: indexPath) as! CategoryCell
        categoryCell.categoryName.text = filterCategory[indexPath.row].name
        cell = categoryCell
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "NoteViewController") as? NoteViewController{
            
           
            
            if let navigator = self.navigationController{
                navigator.pushViewController(vc , animated: true)
                
            }
        }
    }
}

class CategoryCell:UITableViewCell{
    @IBOutlet weak var categoryName: UILabel!    
}

extension CategoryViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filterCategory = searchText.isEmpty ? categorydata : categorydata.filter({ (item: CategoryData) -> Bool in
            return item.name!.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        tableview.reloadData()
    }
}
