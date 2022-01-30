//
//  AzkariList.swift
//  Zikr Azker
//
//  Created by Yousra Ahmed on 19/12/2021.
//

import SwiftUI

struct AzkariList: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Athkari.name, ascending: true)],
        animation: .default)
    private var athkaris: FetchedResults<Athkari>
    var counter = 0
    
    @State private var showingPopOver = false
    init() {
        UITableView.appearance().backgroundColor = .clear // For tableView
        UITableViewCell.appearance().backgroundColor = .clear // For tableViewCell
    }
    
    var body: some View {
        ZStack(alignment: .center){
            List {
                Text("Custom Athkar")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(secondry600)
                    .listRowBackground(Color(hex: 0xFFFFFF, alpha: 0.0))

                HStack {
                    Text("\(athkaris.reduce(0, {$0 + 24 * (60 / $1.remindEvery)}))")
                            .fontWeight(.bold)
                                .font(.title2)
                                .padding()
                                .foregroundColor(.white)
                                .frame(width: 100, height: 30 , alignment: .center)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(secondry600, lineWidth: 3))
                    
                    Text("Total notifications in day")
                        .bold()
                        .foregroundColor(.white)
                }
                .listRowBackground(Color(hex: 0xFFFFFF, alpha: 0.0))
 
                ForEach(athkaris, id: \.self) {
                AthkariRow(athkari: $0, deleteAction: deleteAthkari)
                }
                .listRowBackground(Color(hex: 0xFFFFFF, alpha: 0.0))
            }
            .listRowBackground(Color(hex: 0xFFFFFF, alpha: 0.0))
            .background(Image("vector-2-background"))
            .floatingActionButton(color: secondry600,
                                  image: Image(systemName: "plus")
                                    .foregroundColor(.white)) {
                print("action")
                NotificationManager.shared.requestAuthorization { granted in
                  // 2
                  if granted {
                 //   showNotificationSettingsUI = true
                      showingPopOver = true
                  }
                }
                
                }
            if showingPopOver{
                AddAthkari(action: addAthkari, isPresented: $showingPopOver)
              //  .frame(width: 350, height: 400, alignment: .center)
               // .listRowBackground(primary900)
            }
            /*.popover(isPresented: $showingPopOver){
                // 1
                AddAthkari(thikr: "Add zikr", remindEvery: 1, action: addAthkari, isPresented: $showingPopOver)
            }*/
        }
        

    }
    func addAthkari(name: String, taskID: String, remindEvery: Int16){//}, colorHex: Int32 ) {
      // 1
      let newAthkari = Athkari(context: managedObjectContext)

      // 2
      newAthkari.name = name
        newAthkari.colorHEX = Int64(secondry400.hashValue)
        newAthkari.taskID = taskID
        newAthkari.remindEvery = remindEvery
      // 3
      saveContext()
    }
    func deleteAthkari(athkari: Athkari){//(at offsets: IndexSet) {
      // 1
//      offsets.forEach { index in
        // 2
//        let movie = self.athkaris[index]
        // 3
        NotificationManager.shared.removeScheduledNotification(id: athkari.taskID ?? "")
        self.managedObjectContext.delete(athkari)
      
      // 4
      saveContext()
    }
    func saveContext() {
      do {
        try managedObjectContext.save()
      } catch {
        print("Error saving managed object context: \(error)")
      }
    }
    
}


struct AzkariList_Previews: PreviewProvider {
    static var previews: some View {
        AzkariList()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}


