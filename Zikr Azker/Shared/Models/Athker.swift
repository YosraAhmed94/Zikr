//
//  AthkerModel.swift
//  Zikr Azker
//
//  Created by Yousra Ahmed on 18/12/2021.
//

import Foundation

struct Athker:Hashable,Identifiable{
    var id = UUID()
    var name:String
    var thikr:String
    var iconName:String
    var colorGradient:[UInt]
}
