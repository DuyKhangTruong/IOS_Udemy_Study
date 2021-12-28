//
//  ViewController.swift
//  ToDoList
//
//  Created by Nguyen Truong Duy Khang on 12/23/21.
//

import UIKit

class ToDoListViewController: UITableViewController {
    
    //var itemArray = ["Buy Pizza","Go to Walmart","Pick up kids"]
    var itemArray = [Item]()
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let newItem = Item()
//        newItem.tittle = "Buy Pizza"
//        itemArray.append(newItem)
//
//        let newItem1 = Item()
//        newItem1.tittle = "Go to Walmart"
//        itemArray.append(newItem1)
//
//        let newItem2 = Item()
//        newItem2.tittle = "Pick up kids"
//        itemArray.append(newItem2)
//        
        //        if let items = defaults.array(forKey: "ToDoList") as? [Item] {
        //            itemArray = items
        //        }
        loadItems()
    }
    
    // MARK:  Tableview DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.tittle
        cell.accessoryType = item.done == true ? .checkmark : .none
        return cell
    }
    
    // MARK:  Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done.toggle()
        saveItems()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK:  Add New Item
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            let newItem = Item()
            newItem.tittle = textField.text!
            self.itemArray.append(newItem)
            
            self.saveItems()
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Type task here..."
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func saveItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("ERROR!!! \(error)")
        }
        
        self.tableView.reloadData()
    }
    
    func loadItems() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("[ERORR] Decoding data process")
            }
        }
    }
    
}

