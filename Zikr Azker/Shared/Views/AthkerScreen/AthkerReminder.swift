//
//  AthkerReminder.swift
//  Zikr Azker (iOS)
//
//  Created by Yousra Ahmed on 31/12/2021.
//

import SwiftUI
import UserNotifications

struct AthkerReminder: View {
    //@State var hours: Int = 8
    //@State var minutes: Int = 0
    @State var remindAt:(hours: Int, minutes: Int)
    var setRemind: ((_ hours: Int, _ minutes: Int) -> Void)
    @Binding var isPresented: Bool
    let atharName:English
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20.0)
             .foregroundColor(popoverColor)
             .frame(width: 350, height: 300, alignment: .center)
            VStack {
                Text(atharName.title)
                    .foregroundColor(secondry600)
                    .bold()
                    .padding()
                Spacer()
                HStack {
                    Spacer()
                        .foregroundColor(secondry400)
                    Picker("", selection: $remindAt.hours){
                         ForEach(0..<24, id: \.self) { i in
                                        Text(String(format: "%02d", i)).tag(i)
                                    }
                    
                }
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipped()

                    .pickerStyle(WheelPickerStyle())
                    
                    Text(":")
                        .bold()
                        .foregroundColor(secondry600)
                    Picker("", selection: $remindAt.minutes){
                            ForEach(0..<60, id: \.self) { i in
                                Text(String(format: "%02d", i)).tag(i)
                            }
                        }
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipped()

                    .pickerStyle(WheelPickerStyle())
                    Spacer()
                    }
                Divider()
                .padding(.horizontal)
            //    Text("You've selected \(remindAt.hours):\(remindAt.minutes)")
          //          .padding()
                HStack{
                    Spacer()
                    Button("  Set  "){
                        var components = DateComponents()
                        components.hour = remindAt.hours
                        components.minute = remindAt.minutes
                        //let date = Calendar.current.date(from: components)
                        let task = NotificationTask(name: atharName.title,completed: false, reminderEnabled: true, reminder: Reminder(date: components, reminderType: .calendar, repeats: true))
                        
                          NotificationManager.shared.scheduleNotification(task: task)
                        setRemind(remindAt.hours, remindAt.minutes)
                        isPresented = false
                    }
                    .foregroundColor(secondry400)
                    Spacer()
                    Divider()
                    Spacer()
                    Button("Cancel "){
                        isPresented = false
                    }
                    .foregroundColor(secondry400)
                    Spacer()
                }
            }
      //      .cornerRadius(20)
            .foregroundColor(.white)

            .frame(width: 350, height: 300, alignment: .center)
            .padding()
        }
        
    }
}
/*
struct AthkerReminder_Previews: PreviewProvider {
    static var previews: some View {
        AthkerReminder(remindAt: (8,0), isPresented: true, atharName: "Morning Athar")
    }
}
*/
