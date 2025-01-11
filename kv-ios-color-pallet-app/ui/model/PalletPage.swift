//
//  PalletPage.swift
//  kv-ios-color-pallet-app
//
//  Created by Kavimal Wijewardana on 12/30/24.
//
import Foundation

enum PageType {
    case ALPHA_PAGE, PALLET_PAGE, BRIGHTNESS_PAGE, SATURATION_PAGE
}

public struct PalletPage: Identifiable, Equatable {
    public let id = UUID()
    var name: String
    var type: PageType
    var tag: Int
    
    public static var samplePage = PalletPage(name: "Sample", type: .ALPHA_PAGE, tag: 0)
    
    public static var palletPages: [PalletPage] = [
        PalletPage(name: "Alpha Pallet", type: PageType.ALPHA_PAGE, tag: 0),
        PalletPage(name: "Color Pallet", type: PageType.PALLET_PAGE, tag: 1),
        PalletPage(name: "Brightness Pallet", type: PageType.BRIGHTNESS_PAGE, tag: 2),
        PalletPage(name: "Saturation Pallet", type: PageType.SATURATION_PAGE, tag: 3)
    ]
}
