//
//  CircleIcon.swift
//  Zikr Azker
//
//  Created by Yousra Ahmed on 17/12/2021.
//

import SwiftUI



struct AthkerRow: View {
    var athker:Athker
    var body: some View {
        HStack {
            
            Circle().fill(LinearGradient(gradient: Gradient(colors: [Color(hex: athker.colorGradient[0]),Color(hex: athker.colorGradient[1])]), startPoint: .top, endPoint: .bottom))
                .frame(width: 50.0, height: 100.0, alignment: .leading)
                .padding()
            
            Text(athker.name)
                .foregroundColor(.white)
                .font(.subheadline)
                .bold()
            Spacer()
        }
        .frame(height: 60)
        .background(Color.black)
        
    }
}

struct AthkerRow_Previews: PreviewProvider {
    static var previews: some View {
        AthkerRow(athker:athkers[0])
            .previewLayout(.fixed(width: 300, height: 40))
    }
}



