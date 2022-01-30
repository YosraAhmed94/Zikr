//
//  AthkerDetails.swift
//  Zikr Azker (iOS)
//
//  Created by Yousra Ahmed on 17/01/2022.
//

import SwiftUI

struct AthkerDetails: View {
    var athkar: English
    @State private var zikrArray:[Zikr] = []
    init(athkar: English) {
        UITableView.appearance().backgroundColor = .clear // For tableView
        UITableViewCell.appearance().backgroundColor = .clear // For tableViewCell
        self.athkar = athkar
    }
    var body: some View {
        List(zikrArray){ zikr in
                AthkarDetailsRow(zikr: zikr)
                .listRowBackground(Color(hex: 0xFFFFF,alpha: 0.0))
        }
        .listRowBackground(Color(hex: 0xFFFFF,alpha: 0.0))
        .task {
            name = athkar.title
            await loadData()
        }
        
        .background(popoverColor)
    }
    func loadData() async {
        guard let url = URL(string: athkar.text) else {
            print("Invalid URL")
            return
        }
        let task = URLSession.shared.conditionTask(with: url) { condition, response, error in
            if let condition = condition {
                zikrArray = condition.zikr ?? []
            }
        }
        task.resume()
    
    }
}
/*
struct AthkerDetails_Previews: PreviewProvider {
    static var previews: some View {
        AthkerDetails(athkar: English(from: <#Decoder#>))
    }
}
*/
