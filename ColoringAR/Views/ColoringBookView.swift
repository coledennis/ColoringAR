//
//  ColoringBookView.swift
//  ColoringAR
//
//  Created by Cole Dennis on 11/22/22.
//

import SwiftUI

struct ColoringBookView: View {
    @ObservedObject var arViewModel : ARViewModel
    
    var body: some View {
        ZStack {
            ARViewContainer(arViewModel: arViewModel).edgesIgnoringSafeArea(.all)
                .onTapGesture(coordinateSpace: .global) { location in
                    arViewModel.raycast(location: location)
                }
            VStack {
                if arViewModel.experiencePlaced {
                    
                    
                    RoundedRectangle(cornerRadius: 20).fill(.regularMaterial)
                        .frame(width: 100, height: 100)
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 20).fill(.regularMaterial)
                            .frame(height: 100)
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(arViewModel.colorArr.indices, id: \.self) { color in
                                    
                                    Circle()
//                                        .strokeBorder(.black, lineWidth: 20)
                                        .opacity(arViewModel.currentColor == arViewModel.colorArr[color] ? 1 : 0.4)
                                        .foregroundColor(arViewModel.colorArr[color])
                                        .onTapGesture {
                                            arViewModel.changeCurrentColor(arViewModel.colorArr[color])
                                        }
//                                        .border(Circle())
                                       
//                                        .background(Circle().fill(.blue))

                                    
                                }
                            }.frame(height: 80)
//                                .padding()
                        }
                        .padding()
                    }
                } else {
                    Text("Tap surface to place")
                        .bold()
                        .font(.largeTitle)
                }
            }.padding()
        }
    }
}

struct ColoringBookView_Previews: PreviewProvider {
    static var previews: some View {
        ColoringBookView(arViewModel: ARViewModel.init())
    }
}
