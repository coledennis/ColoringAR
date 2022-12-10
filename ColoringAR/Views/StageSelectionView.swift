//
//  StageSelectionView.swift
//  ColoringAR
//
//  Created by Cole Dennis on 11/22/22.
//

import SwiftUI

struct StageSelectionView: View {
    @ObservedObject var arViewModel : ARViewModel
    var body: some View {
        VStack {
            Button {
                arViewModel.changeGameStage(.menu)
            } label: {
                Label("Back", systemImage: "arrowshape.turn.up.left")
            }

            Text("Testing game")
            Button {
                // Code
                arViewModel.buttonHaptic()
                arViewModel.changeGameStage(.coloringBook)
                
            } label: {
                Label("Test Stage", systemImage: "testtube.2")
            }
            .buttonStyle(.bordered)
            Text("Advent Calendar - new puzzle every day for a whole year! 365 puzzles! -- unlocks on that day -- can view the full calendar ")
            Text("Content packs if I'm feeling ambitious - available with in app purchase --- if only one of your friends has it, both can play, and it unlocks for your friend?")
            Text("Hello, World!")
            Text("Hello, World!")
        }.navigationTitle("Stages")
    }
}

struct StageSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        StageSelectionView(arViewModel: ARViewModel.init())
    }
}
