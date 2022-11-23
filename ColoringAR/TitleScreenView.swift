//
//  TitleScreenView.swift
//  ColoringAR
//
//  Created by Cole Dennis on 11/22/22.
//

import SwiftUI

struct TitleScreenView: View {
    var body: some View {
        VStack {
            Text("Coloring AR")
                .font(.largeTitle).bold()
            Button {
                // Code
            } label: {
                Label("Test Stage", systemImage: "testtube.2")
            }
            .buttonStyle(.bordered)
            
            Button {
                // Code
            } label: {
                Label("Stages - 0 / 100 Complete", systemImage: "list.bullet")
            }
            .buttonStyle(.bordered)
            
            Button {
                // Code
            } label: {
                Label("Safari Mode", systemImage: "camera")
            }
            .buttonStyle(.bordered)
            
            Button {
                // Code
            } label: {
                Label("Multiplayer Mode", systemImage: "person.2")
            }
            .buttonStyle(.bordered)
            
            Button {
                // Code
            } label: {
                Label("Achievements", systemImage: "trophy")
            }
            .buttonStyle(.bordered)
            
            Button {
                // Code
            } label: {
                Label("Settings", systemImage: "gear")
            }
            .buttonStyle(.bordered)

        }
    }
}

struct TitleScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TitleScreenView()
    }
}
