//
//  SaturationPalletPager.swift
//  KV Color Pallet
//
//  Created by Kavimal Wijewardana on 1/8/25.
//
import SwiftUI
import KvColorPallet_iOS

public struct SaturationPalletPager: View {
    
    @State var selectedColor: Color = .white
    
    public var body: some View {
        VStack {
            HStack {
                Text("Saturation Pallet")
                    .font(.system(size: 40, weight: .semibold))
                
                Spacer()
            }
            .padding([.leading, .trailing], 10)
            
            let matPackage = MatPackage()
            
            HStack {
                VStack {
                    SaturationPalletColorRow(givenColor: matPackage.matRed, selectedColor: $selectedColor)
                    SaturationPalletColorRow(givenColor: matPackage.matRose, selectedColor: $selectedColor)
                    SaturationPalletColorRow(givenColor: matPackage.matLPurple, selectedColor: $selectedColor)
                    SaturationPalletColorRow(givenColor: matPackage.matDPurple, selectedColor: $selectedColor)
                    SaturationPalletColorRow(givenColor: matPackage.matDBlue, selectedColor: $selectedColor)
                    SaturationPalletColorRow(givenColor: matPackage.matLBlue, selectedColor: $selectedColor)
                    SaturationPalletColorRow(givenColor: matPackage.matLLBlue, selectedColor: $selectedColor)
                    SaturationPalletColorRow(givenColor: matPackage.matLCyan, selectedColor: $selectedColor)
                    SaturationPalletColorRow(givenColor: matPackage.matDCyan, selectedColor: $selectedColor)
                    SaturationPalletColorRow(givenColor: matPackage.matDGreen, selectedColor: $selectedColor)
                    SaturationPalletColorRow(givenColor: matPackage.matLGreen, selectedColor: $selectedColor)
                    SaturationPalletColorRow(givenColor: matPackage.matLLGreen, selectedColor: $selectedColor)
                    SaturationPalletColorRow(givenColor: matPackage.matYellow, selectedColor: $selectedColor)
                    SaturationPalletColorRow(givenColor: matPackage.matGold, selectedColor: $selectedColor)
                    SaturationPalletColorRow(givenColor: matPackage.matOrange, selectedColor: $selectedColor)
                }
                .padding()
                
                Spacer()
            }
            .padding([.leading, .trailing], 10)
            .padding(.top, -15)
            
            ColorDetailRow(selectedColor: selectedColor)
            
            Spacer()
        }
    }
}

struct SaturationPalletColorRow: View {
    
    @Binding var selectedColor: Color
    private var givenColor: KvColor
    private var colorList: [ColorItem] = []
    
    init(givenColor: KvColor, selectedColor: Binding<Color>) {
        self.givenColor = givenColor
        _selectedColor = selectedColor
        let colors = KvColorPallet.instance.generateSaturationColorPallet(givenColor: self.givenColor.color)
        colors.forEach { color in
            colorList.append(ColorItem(color: color))
        }
    }
    
    var body: some View {
        HStack {
            ForEach(colorList, id: \.id) { colorItem in
                ColorBox(
                    givenColor: colorItem.color,
                    selectedColor: selectedColor,
                    onSelect: { pickedColor in
                        selectedColor = pickedColor
                    }
                )
                .padding(-4)
            }
        }
    }
}

#Preview {
    SaturationPalletPager()
}
