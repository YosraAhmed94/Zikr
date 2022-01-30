//
//  ContentView.swift
//  Shared
//
//  Created by Yousra Ahmed on 14/12/2021.
//

import SwiftUI
let popoverColor = Color(hex: 0x040722)

let primary900 = Color(hex: 0x212e54)
let primary700 = Color(hex: 0x314879)
let primary500 = Color(hex: 0x40598e)

let secondry800 = Color(hex: 0x544721)
let secondry600 = Color(hex: 0x8b7b52)
let secondry400 = Color(hex: 0xd5c296)
struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    var body: some View {
        TabView {
            AthkerList().tabItem {
                Text("Hisn ul-muslim")
            }
            AzkariList().environment(\.managedObjectContext, self.managedObjectContext).tabItem {
                //Image(systemName: "bookmark.circle.fill")
                Text("Athkari")
            }
            ChannelList().tabItem {
                Text("Channel")
            }
        }
         .transition(.slide) // 3
        .accentColor(secondry800)
        .preferredColorScheme(.dark)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
