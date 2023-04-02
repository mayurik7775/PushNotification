//
//  ViewController.swift
//  PushNotification
//
//  Created by Mac on 05/03/23.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        //notificationCenter
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: [.alert,.sound]){(granted, error) in
        }
    //NotificationContent
        let content = UNMutableNotificationContent()
        content.title = "ios New Batch"
        content.body = "iOS New Batch is Stsrting in nxet Week"
        
        let date = Date().addingTimeInterval(50)
        let dateComponent = Calendar.current.dateComponents([Calendar.Component.year,Calendar.Component.day,.hour,.minute,.second], from: date)
        
        
        //Nootification Trigger
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        let uuidString = UUID().uuidString
        print(uuidString)
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        notificationCenter.add(request){
            (error) in
        }
    }


}

