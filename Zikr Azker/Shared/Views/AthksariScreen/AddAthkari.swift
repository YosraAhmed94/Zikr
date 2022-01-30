//
//  AddAthkari.swift
//  Zikr Azker (iOS)
//
//  Created by Yousra Ahmed on 02/01/2022.
//

import SwiftUI

struct AddAthkari: View {
    //@State var hours: Int = 8
    //@State var minutes: Int = 0
    @State var thikr:String = "" //= "Add thizr"
    @FocusState private var thikrIsFocused: Bool
    @State var remindEvery : Int = 10
    var action: ((_ name: String, _ taskID: String, _ remindEvery: Int16) -> Void)
    @Binding var isPresented: Bool
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 20.0)
             .foregroundColor(popoverColor)
             .frame(width: 350, height: 430, alignment: .center)
            VStack(alignment: .center) {
     
                Text("Remind me with")
                    .foregroundColor(secondry600)
                    .bold()
                    TextField(
                        "Add thikr",
                        text: $thikr
                    )
                    .foregroundColor(secondry600)
                    //.keyboardType(.decimalPad)
                    .focused($thikrIsFocused)
                    .multilineTextAlignment(.center)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.all)
                     Text("every")
                    .foregroundColor(secondry600)
                    .bold()
                    Picker("", selection: $remindEvery){
                        ForEach(5..<60, id: \.self) { i in
                                Text(String(format: "%02d", i)).tag(i)
                            }
                        }
                    .frame(width: 50, height: 150, alignment: .center)
                    .clipped()

                    .pickerStyle(WheelPickerStyle())
                    Text("minutes")
                    .foregroundColor(secondry600)
                    .bold()
            
            //        Spacer()
                Divider()
                HStack {
                    Spacer()
                    Button("  Set "){
                        thikrIsFocused = false
                        let task = NotificationTask( name:thikr, completed: false, reminderEnabled: true, reminder: Reminder(timeInterval: (Double(remindEvery)*60), reminderType: .time, repeats: true))
                          NotificationManager.shared.scheduleNotification(task: task)
                        action(thikr, task.id, Int16(remindEvery))
                        print(remindEvery)
                        isPresented = false
                    }
                    .foregroundColor(secondry400)
                    .padding()
                    Spacer()
                    Divider()
                    Spacer()
                    Button("Cancel"){
                        thikrIsFocused = false
                        isPresented = false
                    }
                    .foregroundColor(secondry400)
                    .padding()
                    Spacer()
                }
            }
            .padding()
           // .background(popoverColor)
            //.cornerRadius(20)
    //        .background(secondry400)
      //      .padding(10)
            .frame(width: 350, height: 330, alignment: .center)
    //        .clipShape(RoundedRectangle(cornerRadius: 20.0))
           // .overlay(
             //   RoundedRectangle(cornerRadius: 15))
                    //.stroke(Color(hex: 0x8F6A02), lineWidth: 3))
            .preferredColorScheme(.dark)
            
        }
        
    }
}
/*
struct AddAthkari_Previews: PreviewProvider {
    @Binding var isPresented: Bool
    
    static var previews: some View {
        isPresented = true
     AddAthkari(thikr: "Astaghfirullah", remindEvery: 20, isPresented:  isPresented)
    }
}
*/
