//
//  BrightnessPalletPager.swift
//  KV Color Pallet
//
//  Created by Kavimal Wijewardana on 1/8/25.
//
import SwiftUI
import KvColorPallet_iOS

public struct BrightnessPalletPager: View {
    
    @State var selectedColor: Color = .white
    
    public var body: some View {
        VStack {
            HStack {
                Text("Brightness Pallet")
                    .font(.system(size: 40, weight: .semibold))
                
                Spacer()
            }
            .padding([.leading, .trailing], 10)
            
            let matPackage = MatPackage()
            
            HStack {
                VStack {
                    BrightnessPalletColorRow(givenColor: matPackage.matRed, selectedColor: $selectedColor)
                    BrightnessPalletColorRow(givenColor: matPackage.matRose, selectedColor: $selectedColor)
                    BrightnessPalletColorRow(givenColor: matPackage.matLPurple, selectedColor: $selectedColor)
                    BrightnessPalletColorRow(givenColor: matPackage.matDPurple, selectedColor: $selectedColor)
                    BrightnessPalletColorRow(givenColor: matPackage.matDBlue, selectedColor: $selectedColor)
                    BrightnessPalletColorRow(givenColor: matPackage.matLBlue, selectedColor: $selectedColor)
                    BrightnessPalletColorRow(givenColor: matPackage.matLLBlue, selectedColor: $selectedColor)
                    BrightnessPalletColorRow(givenColor: matPackage.matLCyan, selectedColor: $selectedColor)
                    BrightnessPalletColorRow(givenColor: matPackage.matDCyan, selectedColor: $selectedColor)
                    BrightnessPalletColorRow(givenColor: matPackage.matDGreen, selectedColor: $selectedColor)
                    BrightnessPalletColorRow(givenColor: matPackage.matLGreen, selectedColor: $selectedColor)
                    BrightnessPalletColorRow(givenColor: matPackage.matLLGreen, selectedColor: $selectedColor)
                    BrightnessPalletColorRow(givenColor: matPackage.matYellow, selectedColor: $selectedColor)
                    BrightnessPalletColorRow(givenColor: matPackage.matGold, selectedColor: $selectedColor)
                    BrightnessPalletColorRow(givenColor: matPackage.matOrange, selectedColor: $selectedColor)
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

struct BrightnessPalletColorRow: View {
    
    @Binding var selectedColor: Color
    private var givenColor: KvColor
    private var colorList: [ColorItem] = []
    
    init(givenColor: KvColor, selectedColor: Binding<Color>) {
        self.givenColor = givenColor
        _selectedColor = selectedColor
        let colors = KvColorPallet.instance.generateBrightnessColorPallet(givenColor: self.givenColor.color)
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
    BrightnessPalletPager()
}
