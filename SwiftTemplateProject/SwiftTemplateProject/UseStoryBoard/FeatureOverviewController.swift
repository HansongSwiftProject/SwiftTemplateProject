//
//  FeatureOverviewController.swift
//  SwiftTemplateProject
//
//  Created by hansong on 10/10/20.
//
import Capable
import UIKit

class FeatureOverviewController: UITableViewController {
    var alert: UIAlertController?
    var objects: [String: String]?
    var capable: Capable?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        capable = Capable()
        registerObservers()
        refreshData()
    }
   

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerObservers()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterObservers()
    }
    func refreshData() {
        if let capable = self.capable {
            objects = capable.statusMap
        }
    }
    func sendMetrics() {
        // The purpose of this function is to test API compatibility. To actually send telemetry, register each SDK
        // in the AppDelegate's didFinishLaunchingWithOptions callback
        #if os(iOS)
            if let statusMap = self.capable?.statusMap {
                let eventName = "Capable features received"
//                MSAnalytics.trackEvent(eventName, withProperties: statusMap)
//                Analytics.logEvent(eventName, parameters: statusMap)
//                Answers.logCustomEvent(withName: eventName, customAttributes: statusMap)
            }
        #endif
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: - Table View

extension FeatureOverviewController {
    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return objects?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let feature = value(forRow: indexPath.row)
        cell.textLabel!.text = feature.key
        cell.detailTextLabel!.text = feature.value

        return cell
    }

    private func value(forRow row: Int) -> (key: String, value: String) {
        if let objects = self.objects {
            let featuresArray = Array(objects)
            return featuresArray[row]
        }
        fatalError("Requested item does not exist")
    }
}
// MARK: Capable Notification

extension FeatureOverviewController {
    @objc private func featureStatusChanged(notification: NSNotification) {
        if let featureStatus = notification.object as? FeatureStatus {
            showAlert(for: featureStatus)
            refreshData()
            tableView.reloadData()
        }
    }

    func registerObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(featureStatusChanged),
            name: .CapableFeatureStatusDidChange,
            object: nil
        )
    }

    func unregisterObservers() {
        NotificationCenter.default.removeObserver(self)
    }
}
// MARK: Alert

extension FeatureOverviewController {
    private func showAlert(for featureStatus: FeatureStatus) {
        let showNewAlert = {
            let alertTitle = "Feature status changed"
            let alertMessage = "\(featureStatus.feature.rawValue) changed to \(featureStatus.statusString)"
            self.alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
            if let alert = self.alert {
                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }

        dismissAlertIfNeeded(completion: showNewAlert)
    }

    private func dismissAlertIfNeeded(completion: @escaping () -> Void) {
        if alert != nil, presentedViewController == alert {
            alert!.dismiss(animated: false) {
                completion()
            }
        } else {
            completion()
        }
    }
}
