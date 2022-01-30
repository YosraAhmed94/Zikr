//
//  NotificationTask.swift
//  Zikr Azker (iOS)
//
//  Created by Yousra Ahmed on 01/01/2022.
//

import Foundation

struct NotificationTask: Identifiable{//, Codable {
  var id = UUID().uuidString
  var name: String
  var completed = false
  var reminderEnabled = false
  var reminder: Reminder
}

enum ReminderType: Int, CaseIterable, Identifiable{//, Codable {
  case time
  case calendar
//  case location
  var id: Int { self.rawValue }
}

struct Reminder{//: Codable {
  var timeInterval: TimeInterval?
  var date: DateComponents?
//  var date: Date?
//  var location: LocationReminder?
  var reminderType: ReminderType = .time
  var repeats = false
}
