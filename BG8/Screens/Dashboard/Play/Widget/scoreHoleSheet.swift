//
//  scoreHoleSheet.swift
//  BG8
//
//  Created by Mac HD on 28/02/2025.
//

import SwiftUI

struct scoreHoleSheet: View {
    @State private var showSignUpSheet = false
    @State private var numberOfShots = 1
    @State private var bunkerShots = 1
    @State private var putts = 1
    @State private var penalty = 1
    @State private var fairwayHit: Int? = 1
    @State private var greenInRegulation: Bool? = nil
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack {
                Rectangle()
                    .frame(width: 71, height: 5)
                    .foregroundColor(.gray.opacity(0.4))
                    .padding(.top, 15)
                VStack(alignment:.leading){
                  
                    Text("What did you score on this hole").font(.title2).bold()
                    Text("Hole 5 - Par 4")
                                  .font(.subheadline)
                                  .foregroundColor(.gray)
                                  .padding(.vertical, 4)
                                  .padding(.horizontal, 10)
                                  .background(Color(.systemGray6))
                                  .cornerRadius(8)
                              
                    Spacer().frame(height: 27)
                    scoreStepper(title: "Number of shots", value: $numberOfShots)
                    Spacer().frame(height: 27)
                    HStack {
                            Text("Fairway Hits")
                            Spacer()
                            HStack(spacing: 10) {
                                fairwayButton(imageName: "arrow.turn.down.left", isSelected: fairwayHit == -1) {
                                    fairwayHit = -1
                                }
                                fairwayButton(imageName: "checkmark.circle.fill", isSelected: fairwayHit == 1, color: .green) {
                                    fairwayHit = 1
                                }
                                fairwayButton(imageName: "arrow.turn.down.right", isSelected: fairwayHit == 2) {
                                    fairwayHit = 2
                                }
                            }
                        }
                    Spacer().frame(height: 27)
                    HStack {
                        Text("Greens in Regulations")
                        Spacer()
                        HStack(spacing: 10) {
                            fairwayButton(imageName: "checkmark.circle", isSelected: greenInRegulation == true) {
                                greenInRegulation = true
                            }
                            fairwayButton(imageName: "xmark.circle", isSelected: greenInRegulation == false) {
                                greenInRegulation = false
                            }
                        }
                    }
                    Spacer().frame(height: 27)
                    
                    scoreStepper(title: "Green-side Bunker Shots", value: $bunkerShots)
                    Spacer().frame(height: 27)
                    scoreStepper(title: "Putts", value: $putts)
                    Spacer().frame(height: 27)
                    scoreStepper(title: "Penalty", value: $penalty)
                    Spacer()
                    HStack{
                        
                        CommonButton(title: "Cancel", action: {
                            dismiss()
                        },backgroundColor: Color.clear,textColor: Color.black, destination: {EmptyView()})
                        CommonButton(title: "Save", action: {
                            dismiss()
                        }, destination: {EmptyView()})
                    }
                }
            }
            .background(Color.clear).padding(.leading,16).padding(.trailing,16)
//            .cornerRadius(50)
        }}
    
    private func scoreStepper(title: String, value: Binding<Int>) -> some View {
          HStack {
              Text(title)
              Spacer()
              HStack {
                  Button(action: { if value.wrappedValue > 0 { value.wrappedValue -= 1 } }) {
                      Image(systemName: "minus.circle")
                          .font(.title2).foregroundColor(.black)
                  }
                  Text("\(value.wrappedValue)")
                      .font(.title3)
                      .frame(minWidth: 30)
                  Button(action: { value.wrappedValue += 1 }) {
                      Image(systemName: "plus.circle")
                          .font(.title2).background().foregroundColor(.black)
                  }
              }.padding(.leading,5).padding(.trailing,5)
                  .frame(height: 35)
                  .overlay(
                      RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 0.5) // Border with rounded corners
                  )
          }
      }
      
      private func fairwayButton(imageName: String, isSelected: Bool, color: Color = .gray, action: @escaping () -> Void) -> some View {
          Button(action: action) {
              Image(systemName: imageName)
                  .font(.title2)
                  .foregroundColor(isSelected ? color : .gray)
          }
      }
}

#Preview {
    scoreHoleSheet()
}
