//
//  CircleIcon.swift
//  Zikr Azker
//
//  Created by Yousra Ahmed on 17/12/2021.
//

import SwiftUI

//var athker:AthkarUI
struct AthkerRow: View {
    @State private var showingPopOver = false
    @State var isPreffered : Bool = false
    var addReminder : ((_ id: Int) -> Void)//(Int, Int)?)
    @State var time : (Int, Int)?
//    @State private var currentDate = Date()
    var athker:English
    var body: some View {
 //       ZStack{
//            RoundedRectangle(cornerRadius: 25)
                //.listRowBackground(Color(hex: 0xFFFFFF, alpha: 0.0))
//                .fill(Color(hex: 0xFFFFFF, alpha: 0.5))
                //.frame(width: 340, height: 90)
            HStack {
              /*  Circle().fill(LinearGradient(gradient: Gradient(colors: Color.colorArray(hexArray: athker.colorGradient ?? [])), startPoint: .top, endPoint: .bottom))
                    .frame(width: 50.0, height: 100.0, alignment: .leading)
                    .padding()*/
            
                Button(action:{
                    isPreffered = !isPreffered
                },label:{
                    Image((isPreffered ? "loveMarked" : "loveNotMarked"))
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50.0, height: 50.0, alignment: .leading)
                        .cornerRadius(25)
                        .buttonBorderShape(.roundedRectangle(radius: 25))
                })
                    .buttonStyle(PlainButtonStyle())
                if !(athker.id == 27 || athker.id == 28 || athker.id == 1){
                    Text(athker.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                       // .frame(width: 200.0, alignment: .center)
                }

                else {
                    
                    Text(athker.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                           // .frame(width: 200.0, alignment: .center)
                    Spacer()
                  //  if #available(macOS 12.0, *) {
                    VStack {
                        if time != nil{
                            Text("\(time!.0):\(time!.1)")
                                .foregroundColor(secondry600)
                            
                        }
                        Button(action: {
                            NotificationManager.shared.requestAuthorization { granted in
                              // 2
                              if granted {
                         //         showingPopOver = true
                                 /* if (athker.id == 27){addReminder(0)}
                                  else if (athker.id == 28){addReminder(1)}
                                  else if (athker.id == 1){addReminder(2)}*/
                                  addReminder(athker.id)
                              }
                            }
                            
                        }, label: {
                            Image("icons8-alarm-clock-90")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fill)
                        })
                        .cornerRadius(15)
                        .buttonBorderShape(.roundedRectangle(radius: 15))
                        .frame(width: 28, height: 28 , alignment: .center)
                     //   .padding()
                        .buttonStyle(PlainButtonStyle())
                  //      .popover(isPresented: $showingPopOver){
                            // 1
                 //           AthkerReminder(remindAt:(8,0), isPresented: $showingPopOver, atharName: athker.title)
                 //       }
                    }
                }

           //     Divider()
           //         .foregroundColor(Color(hex: 0x8F6A02))
               // } else {
                    // Fallback on earlier versions
               // }
            
        }.frame(height: 100)
     //       .fill(Color(hex: 0xFFFFFF, alpha: 0.5))
           // .frame(width: 320, height: 90)
        }
        
//    }
}

/*
struct AthkerRow_Previews: PreviewProvider {
    static var previews: some View {
        AthkerRow(athker:athker)
            .previewLayout(.fixed(width: 300, height: 60))
    }
}

*/
