//
//  ContentView.swift
//  BG8
//
//  Created by Mac HD on 20/02/2025.
//

import SwiftUI

import SDWebImageSwiftUI



struct ContentView: View {
    @State private var isActive = false
    var body: some View {
        if isActive {
            CourseListScreen()
//            startPage()
        } else {
            if let gifPath = Bundle.main.path(forResource: "start", ofType: "gif") {
                AnimatedImage(url: URL(fileURLWithPath: gifPath))
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { 
                            isActive = true
                        }
                    }
            } else {
                Text("GIF not found")
            }
        }
        
    }}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
