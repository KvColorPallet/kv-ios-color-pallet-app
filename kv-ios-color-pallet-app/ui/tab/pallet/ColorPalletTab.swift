//
//  ColorPalletTab.swift
//  kv-ios-color-pallet-app
//
//  Created by Kavimal Wijewardana on 12/27/24.
//

import SwiftUI
import KvColorPallet_iOS

struct ColorPalletTab: View {
    
    @State private var pageIndex = 0
    private var pages: [PalletPage]
    private let dotAppearance = UIPageControl.appearance()
    
    public init() {
        self.pages = PalletPage.palletPages
    }
    
    var body: some View {
        ZStack {
            AppBackground()
            
            VStack {
                TabView(selection: $pageIndex, content: {
                    ForEach(pages) { pageItem in
                        VStack {
                            if pageItem.tag == 1 {
                                AlphaPalletPager()
                            } else if pageItem.tag == 2 {
                                BrightnessPalletPager()
                            } else if pageItem.tag == 3 {
                                SaturationPalletPager()
                            } else {
                                PalletPager()
                            }
                        }
                        .tag(pageItem.tag)
                    }
                })
                .tabViewStyle(.page) // Enable page-style swipe
                .animation(.easeInOut, value: pageIndex) // Smooth transition animation
                .onAppear {
                    dotAppearance.currentPageIndicatorTintColor = UIColor(.black)
                    dotAppearance.pageIndicatorTintColor = UIColor(.gray)
                }
                
                Button(action: {
                    
                }, label: {
                    Text("Try it out!")
                        .font(.system(size: 16, weight: .light))
                        .foregroundColor(Color.themePallet.onPrimary)
                        .frame(maxWidth: .infinity, maxHeight: 10)
                        .padding()
                        .background(Color.themePallet.primary)
                        .cornerRadius(10)
                })
                .padding(.top, -20)
                .padding([.trailing, .leading])
                
                Spacer()
            }
        }
    }
}

#Preview {
    ColorPalletTab()
}
