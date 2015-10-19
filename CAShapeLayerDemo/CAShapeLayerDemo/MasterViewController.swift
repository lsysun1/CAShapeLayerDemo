//
//  MasterViewController.swift
//  CAShapeLayerDemo
//
//  Created by Guanshan Liu on 27/2/15.
//  Copyright (c) 2015 Guanshan Liu. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    typealias ControllerInfo = (name: String, controller: Void -> UIViewController)

    let infos: [ControllerInfo] = [
        ("Rounded Corners", { return RoundedCornersViewController() } ),
        ("path Animation", { return PathViewController() }),
        ("lineWidth Animation", { return LineWidthViewController() }),
        ("Stroke Animation", { return StrokeViewController() })
    ]


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infos.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) 
        cell.textLabel!.text = infos[indexPath.row].name
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        presentViewController(infos[indexPath.row].controller(), animated: true, completion: nil)
    }

}

