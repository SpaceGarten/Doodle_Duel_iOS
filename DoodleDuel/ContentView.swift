//
//  ContentView.swift
//  DoodleDuel
//
//  Created by Matthew Morikan on 2024-03-06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previws: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
