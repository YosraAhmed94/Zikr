//
//  AthkerList.swift
//  Zikr Azker
//
//  Created by Yousra Ahmed on 19/12/2021.
//

import SwiftUI

struct AthkerList: View {
    @State private var athkars:[English] = []
    @State var showingPopover = false
    @State var remindAtId: Int = 0
    @State var remindAt:[Int:(Int, Int)?] = [:]
    init() {
        UITableView.appearance().backgroundColor = .clear // For tableView
        UITableViewCell.appearance().backgroundColor = .clear // For tableViewCell
    }
    var body: some View {
        ZStack{
            NavigationView {
                List(athkars){ athker in
                    NavigationLink{
                        AthkerDetails(athkar: athker)
                    } label: {
                        if remindAt[athker.id] == nil{
                            
                            AthkerRow(addReminder: reminderPressedAt, athker: athker )
                        }
                        else {
                            
                            AthkerRow(addReminder: reminderPressedAt, time:remindAt[athker.id]!, athker: athker )
                        }
                    }
                    .listRowBackground(Color(hex: 0xFFFFFF, alpha: 0.0))
                    //.padding(.all, 15.0)
                }
                
                .background(Image("vector-2-background"))
                .task {
                    await loadData()
                }
            }
                .navigationTitle("Athkar")
                .foregroundColor(.blue)
             //   .tint(.black)
             //   .listRowSeparatorTint(.yellow)

        //    .preferredColorScheme(.dark)
            if showingPopover{
                AthkerReminder(remindAt:(8,0), setRemind: setRiminderTimeAt, isPresented: $showingPopover, atharName: athkars[remindAtId])
            }
        }

    }
    func setRiminderTimeAt(_ hours: Int, _ minutes: Int){
        remindAt[remindAtId] = (hours,minutes)
    }
    func reminderPressedAt(_ id:Int) {//-> (Int, Int)?{
        remindAtId = id
        showingPopover = true
    }
    func loadData() async {
        guard let url = URL(string: "http://www.hisnmuslim.com/api/en/husn_en.json") else {
            print("Invalid URL")
            return
        }
        let task = URLSession.shared.welcomeTask(with: url) { welcome, response, error in
                if let welcome = welcome {
                    athkars = welcome.english
                 //   athkars.insert(athkars[0], at: 1)
                    
                }
            }
            task.resume()
        }
    
    }


struct AthkerList_Previews: PreviewProvider {
    static var previews: some View {
        AthkerList()
    }
}
