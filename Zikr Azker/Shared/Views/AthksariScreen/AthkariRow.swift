//
//  AthkariRow.swift
//  Zikr Azker
//
//  Created by Yousra Ahmed on 20/12/2021.
//

import SwiftUI

struct AthkariRow: View {
    var athkari:Athkari
    var body: some View {
        HStack{
            VStack(alignment:.leading , spacing:0){
                Button(action: {
                    
                }) {
                Text("x")
                .frame(width: 30, height: 30 , alignment: .center)
                
                .background(.blue)
                .foregroundColor(.white)
                }
                .cornerRadius(15)
                .padding()
                
                Button(action: {
                    
                }) {
                Text("x")
                .frame(width: 30, height: 30 , alignment: .center)
                
                .background(.blue)
                .foregroundColor(.white)
                }
                .cornerRadius(15)
                .padding()
            }
            Spacer()
            Text(" \(athkari.name) ")
                .font(.subheadline)
                .bold()
                .frame(height: 30, alignment: .center)
                .background(Color(hex: athkari.colorHEX))
                .foregroundColor(.white)
                .cornerRadius(15)
                .padding()
            
        }
        .frame( height: 120, alignment: .leading)
        .preferredColorScheme(.dark)
    }
}

struct AthkariRow_Previews: PreviewProvider {
    static var previews: some View {
        AthkariRow(athkari: athkaris[0])
    }
}
