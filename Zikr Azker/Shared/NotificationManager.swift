//
//  NotificationManager.swift
//  Zikr Azker
//
//  Created by Yousra Ahmed on 01/01/2022.
//

import Foundation

import Foundation
import UserNotifications
//import CoreLocation

enum NotificationManagerConstants {
  static let timeBasedNotificationThreadId =
    "TimeBasedNotificationThreadId"
  static let calendarBasedNotificationThreadId =
    "CalendarBasedNotificationThreadId"
//  static let locationBasedNotificationThreadId =
//    "LocationBasedNotificationThreadId"
}

class NotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate{
    
  static let shared = NotificationManager()
  @Published var settings: UNNotificationSettings?
    let notificationCenter = UNUserNotificationCenter.current()
    
    private override init(){
        super.init()
        //This assigns the delegate
        notificationCenter.delegate = self
    }

  func requestAuthorization(completion: @escaping  (Bool) -> Void) {
    UNUserNotificationCenter.current()
      .requestAuthorization(options: [.alert, .sound, .badge]) { granted, _  in
        self.fetchNotificationSettings()
        completion(granted)
      }
  }

  func fetchNotificationSettings() {
    // 1
      notificationCenter.getNotificationSettings { settings in
      // 2
      DispatchQueue.main.async {
        self.settings = settings
      }
    }
  }

  //func removeScheduledNotification(task: NotificationTask) {
  func removeScheduledNotification(id: String) {
      notificationCenter
      .removePendingNotificationRequests(withIdentifiers: [id])
  }

  // 1
  func scheduleNotification(task: NotificationTask) {
    // 2
    let content = UNMutableNotificationContent()
    content.title = task.name
    content.subtitle = "‏لا يزال لسانك رطبًا من ذكر الله"
    content.body = "Keep your tongue wet with the remembrance of Allah."
    content.categoryIdentifier = "AthkariCategory"
 //   let taskData = try? JSONEncoder().encode(task)
 //   if let taskData = taskData {
 //     content.userInfo = ["Task": taskData]
 //   }

    // 3
    var trigger: UNNotificationTrigger?
    switch task.reminder.reminderType {
    case .time:
      if let timeInterval = task.reminder.timeInterval {
        trigger = UNTimeIntervalNotificationTrigger(
          timeInterval: timeInterval,
          repeats: task.reminder.repeats)
      }
      content.threadIdentifier =
        NotificationManagerConstants.timeBasedNotificationThreadId
    case .calendar:
      if let date = task.reminder.date {
          print(date)
          //print(date.ISO8601Format())
          print(Date().ISO8601Format())
        trigger = UNCalendarNotificationTrigger(
          dateMatching: date,
          repeats: task.reminder.repeats)
      }
      content.threadIdentifier =
        NotificationManagerConstants.calendarBasedNotificationThreadId
/*    case .location:
      // 1
      guard CLLocationManager().authorizationStatus == .authorizedWhenInUse else {
        return
      }
      // 2
      if let location = task.reminder.location {
        // 3
        let center = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        let region = CLCircularRegion(center: center, radius: location.radius, identifier: task.id)
        trigger = UNLocationNotificationTrigger(region: region, repeats: task.reminder.repeats)
      }
      content.threadIdentifier =
        NotificationManagerConstants.locationBasedNotificationThreadId*/
    }

    // 4
    if let trigger = trigger {
      let request = UNNotificationRequest(
        identifier: task.id,
        content: content,
        trigger: trigger)
      // 5
      notificationCenter.add(request) { error in
        if let error = error {
          print(error)
        }
      }
    }
  }
}
