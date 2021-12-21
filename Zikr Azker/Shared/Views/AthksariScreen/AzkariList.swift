//
//  AzkariList.swift
//  Zikr Azker
//
//  Created by Yousra Ahmed on 19/12/2021.
//

import SwiftUI

var counter = 0
struct AzkariList: View {
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Button(action: {
                    counter = counter + 1
                }) {
                    Text("\(counter)")
                        .fontWeight(.bold)
                            .font(.title2)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(width: 100, height: 50 , alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hex: 0x8F6A02), lineWidth: 3))
                        
                }
                Text("Total athkar counter")
                    .bold()
                    .foregroundColor(.white)
                
            }
            HStack {
                Button(action: {
                    counter = counter + 1
                }) {
                    Text("\(counter)")
                        .fontWeight(.bold)
                        .font(.title2)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(width: 100, height: 50 , alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hex: 0x8F6A02), lineWidth: 3))
                        
                }
                Text("Average Athkar per day")
                    .bold()
                    .foregroundColor(.white)
                
            }
            HStack {
                Button(action: {
                    counter = counter + 1
                }) {
                    Text("Big")
                        .fontWeight(.bold)
                        .font(.title2)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .padding(10)
                            .frame(width: 100, height: 50 , alignment: .center)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(hex: 0x8F6A02), lineWidth: 3))
                        
                }
                Text("Azkar size")
                    .bold()
                    .foregroundColor(.white)
                
            }
            
            List(athkaris){
                AthkariRow(athkari: $0)
            }
            
        }
        
        //.foregroundColor(.black)
        .preferredColorScheme(.dark)
    }
    
}

struct AzkariList_Previews: PreviewProvider {
    static var previews: some View {
        AzkariList()
    }
}


