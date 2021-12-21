//
//  AthkerList.swift
//  Zikr Azker
//
//  Created by Yousra Ahmed on 19/12/2021.
//

import SwiftUI

struct AthkerList: View {
    var body: some View {
        List(athkers){
            AthkerRow(athker: $0)
           // AthkerRow(athker: athkers[1])
        }
        .foregroundColor(.blue)
        .tint(.black)
        .listRowSeparatorTint(.yellow)
        .background(.black)
        .preferredColorScheme(.dark)
    }
}

struct AthkerList_Previews: PreviewProvider {
    static var previews: some View {
        AthkerList()
    }
}
