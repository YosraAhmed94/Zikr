//
//  AthkariRow.swift
//  Zikr Azker
//
//  Created by Yousra Ahmed on 20/12/2021.
//

import SwiftUI

struct AthkariRow: View {
    var athkari:Athkari
    var deleteAction: ((_ athkari: Athkari) -> Void)
    @State var selectedColor:Color  = secondry600
    var body: some View {
    ZStack{
        RoundedRectangle(cornerRadius: 25)
          //.listRowBackground(Color(hex: 0xFFFFFF, alpha: 0.0))
          .fill(Color(hex: 0xFFFFFF, alpha: 0.1))
          .frame(width: 330, height: 100)
        HStack{
            VStack(alignment:.leading , spacing:0){
                ColorPicker( "", selection: $selectedColor)
                    .labelsHidden()
                    .padding()
//                   .offset(x: -165, y: 0)

                Button(action: {
                    deleteAction(athkari)
                }, label: {
                    Image("cancel")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                })
                .buttonStyle(PlainButtonStyle())
                .cornerRadius(15)
                .buttonBorderShape(.roundedRectangle(radius: 15))
                .frame(width: 28, height: 28 , alignment: .center)
                .padding()
            }
            Spacer()
  //          athkari.name.map(Text.init)
   //             .font(.subheadline)
            Text("  " + athkari.name! + "  ")
                .font(.subheadline)
                .bold()
                .frame(height: 30, alignment: .center)
                .background(selectedColor)
                .foregroundColor(.white)
                .cornerRadius(15)
                .padding(.all)
            
        }
        
        .frame(height: 100, alignment: .leading)
    }
    //    .preferredColorScheme(.dark)
    }
}
/*
struct AthkariRow_Previews: PreviewProvider {
   // var a = Athkari()
    
    static var previews: some View {
        AthkariRow(athkari: a, deleteAction: d)
    }
}

func d(a:Athkari){
    
}
*/
