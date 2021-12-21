//
//  ContentView.swift
//  Shared
//
//  Created by Yousra Ahmed on 14/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        TabView {
            AzkariList().tabItem {
                //Image(systemName: "bookmark.circle.fill")
                Text("Azkari")
            }
            AthkerList().tabItem {
                //Image(systemName: "bookmark.circle.fill")
                Text("Zikr")
            }
            Text("TODO channel").tabItem {
                Text("Chanel")
            }
        }
        .accentColor(.blue)
        
        /* VStack(alignment: .trailing) {

            HStack {
                Image("LaunchScreen")
                            .clipShape(Circle())
                            .overlay {
                                Circle().stroke(.gray, lineWidth: 4)
                            }
                        .shadow(radius: 7)
                Text("Morning  Athkar")
            }
            
        }*/
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
