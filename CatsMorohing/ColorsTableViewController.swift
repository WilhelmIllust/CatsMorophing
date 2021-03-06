//
//  ColorsTableViewController.swift
//  CatsMorohing
//
//  Created by User10 on 2018/6/26.
//  Copyright © 2018年 WilhelmIllust. All rights reserved.
//

import UIKit

class ColorsTableViewController: UITableViewController {

    var colors=[Color]()

    func rgb2Hex(紅:Float,綠:Float,藍:Float)->String{
            
            
            let rgb:Int = (Int)(紅*255)<<16 | (Int)(綠*255)<<8 | (Int)(藍*255)<<0
            
        return NSString(format:"#%06x", rgb) as String

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let colors=Color.readColorsFromFile(){
            self.colors = colors
        }else{
            self.colors.insert(Color(red: 1, green: 1, blue: 1), at: 0)
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

/*    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }*/

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(colors.count)
        return colors.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath) as! ColorsTableViewCell
        let rgb = colors[indexPath.row]
        cell.backgroundColor = UIColor(red: CGFloat(rgb.red), green: CGFloat(rgb.green), blue: CGFloat(rgb.blue), alpha: 1)
        cell.labelHex.text = rgb2Hex(紅:rgb.red,綠:rgb.green,藍:rgb.blue)
        // Configure the cell...

        return cell
    }

 
    @IBOutlet weak var refreshingControl: UIRefreshControl!
    @IBAction func refreshControl(_ sender: Any) {
        
        if let colors=Color.readColorsFromFile(){
            self.colors = colors
        }else{
            self.colors.insert(Color(red: 1, green: 1, blue: 1), at: 0)
        }
        tableView.reloadData()
        refreshingControl.endRefreshing()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.colors.remove(at: indexPath.row)
            Color.saveColorsToFile(catsColor: colors)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
