//
//  homePage.swift
//  BG8
//
//  Created by Mac HD on 24/02/2025.
//

import SwiftUI

struct PlayPage: View {
    @State private var tapPoint: CGPoint? = nil
    @State private var validEnd: CGPoint? = nil
    @State private var showTooltip = false
    @State private var showScoreSheet = false
   
    @State private var showHomeCard = false
    let image = "step5"
    let start = CGPoint(
        x: UIScreen.main.bounds.width / 3.75,
        y: UIScreen.main.bounds.height / 1.75
    )

    var body: some View {
        ZStack {
            GeometryReader { geo in
                ZStack {
                    // Background image
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()

                    // Canvas with line drawing
                    Canvas { context, size in
                        if let end = tapPoint {
                            let dx = end.x - start.x
                            let dy = end.y - start.y
                            let angle = atan2(dy, dx) * 180 / .pi
                            let isAngleValid = angle > -55 && angle < 55
                            let isFarEnough = end.x < size.width - 100

                            if isAngleValid && isFarEnough {
                                // Draw line
                                var path = Path()
                                path.move(to: start)
                                path.addLine(to: end)
                                context.stroke(
                                    path,
                                    with: .color(.white),
                                    lineWidth: 4
                                )

                                // Draw end circle
                                context.fill(
                                    Path(
                                        ellipseIn: CGRect(
                                            x: end.x - 8,
                                            y: end.y - 8,
                                            width: 16,
                                            height: 16
                                        )
                                    ),
                                    with: .color(.white)
                                )

                                // Valid
                                validEnd = end
                                showTooltip = true
                            } else {
                                showTooltip = false
                            }
                        }
                    }

                    // Tooltip box
                    if showTooltip, let end = validEnd {
                        let dx = end.x - 600
                        let dy = end.y - 500
                        let distanceYards = Int(hypot(dx, dy) / 6)

                        VStack(spacing: 4) {
                            // Tooltip
                            VStack(alignment: .leading, spacing: 2) {
                                Text("To flag 34y")
                                    .font(.system(size: 12))
                                    .foregroundColor(.black)
                                Text("Current Ball Position: \(distanceYards)y")
                                    .font(.system(size: 12))
                                    .foregroundColor(.black)
                            }
                            .padding(8)
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(8)

                            // Triangle
                            Triangle()
                                .fill(Color.black.opacity(0.7))
                                .frame(width: 12, height: 6)
                        }
                        .position(x: end.x, y: end.y - 60)
                    }

                    // Bottom right edit button
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button(action: {
                                // Show sheet
                            }) {
                                Image(systemName: "pencil")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .padding()
                                    .background(
                                        Circle().fill(Color.black.opacity(0.6))
                                    )
                            }
                            .padding(.trailing, 25)
                            .padding(.bottom, 20)
                        }
                    }

                    // Bottom left score box
                    VStack {
                        Spacer()
                        HStack {
                            VStack {
                                Image(systemName: "calendar")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                Text("Score")
                                    .font(.system(size: 12))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 60, height: 60)
                            .background(Color.black.opacity(0.5))
                            .cornerRadius(12)
                            Spacer()
                        }
                        .padding(.leading, 16)
                        .padding(.bottom, 16)
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture { location in
                    tapPoint = location
                }
            }
            VStack(alignment: .leading) {
                Header(showBackButton: false)
                Spacer().frame(height: 10)
                scoreCard()
                Spacer().frame(height: 16)

                VStack {
                    VStack {
                        Text("Back")

                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 12, weight: .regular))
                        Text("229y")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .bold))
                    }.padding(10)
                }.background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black.opacity(0.4), Color.black.opacity(0.4),
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
                .padding(.horizontal)
                VStack {
                    VStack {
                        Text("Center")

                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 12, weight: .regular))
                        Text("157y")
                          
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .bold))
                    }.padding(10)
                }.background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black.opacity(0.4), Color.black.opacity(0.4),
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
                .padding(.horizontal).padding(.leading,50)
                VStack {
                    VStack {
                        Text("Front")

                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 12, weight: .regular))
                        Text("229y")
                           
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .bold))
                    }.padding(10)
                }.background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.black.opacity(0.5), Color.black.opacity(0.5),
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .cornerRadius(15)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
                .padding(.horizontal).padding(.leading,110)

                Spacer()
                Spacer().frame(height: 16)
                HStack {
                    //                    roundTime()
                    VStack(alignment: .center, spacing: 4) {
                        Image(systemName: "list.bullet.rectangle")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)

                        Text("Score")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                            .bold()

                    }
                    .padding(.all, 10)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.black.opacity(0.5),
                                Color.black.opacity(0.5),
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(15)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
                    .padding(.horizontal).onTapGesture(perform: {
                        showHomeCard = true
                    })

                    Spacer()
                    HStack {
                        Image("pencil").resizable().frame(width: 20, height: 20)
                            .onTapGesture {
                                showScoreSheet.toggle()
                            }

                    }.frame(width: 40, height: 40).background(Color.white)
                        .padding(.horizontal).clipShape(Circle()).shadow(
                            radius: 4
                        )
                }

                //                   PlayerInfoCard()
                Spacer().frame(height: 20)

            }

            PaymentPage(isPresented: showAlert)
            if showHomeCard {
                VStack {

                    HStack {
                        Button(action: {
                            //                               showHomeCard = false
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.black.opacity(0.9))
                                .font(.title2)
                                .padding(8)
                        }
                        Spacer()
                        Text("Score").foregroundColor(.white).font(
                            .system(size: 20, weight: .semibold)
                        )
                        Spacer()
                        Button(action: {
                            showHomeCard = false
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.title2)
                                .padding(8)
                        }
                    }.padding(15)

                    homeCard()
                    Spacer().frame(height: 15, )
                }
                .background(
                    Color.black.opacity(0.9)
                        .cornerRadius(20)
                ).padding(15)
            }

        }.sheet(isPresented: $showScoreSheet) {
            scoreHoleSheet().presentationDetents([.fraction(0.7)])
                .presentationBackground(.white)
                .presentationCornerRadius(50).background(Color.white)
        }.onAppear {
                        
            tapPoint = nil
            validEnd = nil
            showTooltip = false

        }

    }
    //    @State private var showScoreSheet = false
    //    @State private var stepIndex = 0
    //       let steps = ["step1", "step2", "step3", "step4"]
    //
    //      @State private var tapPoint: CGPoint? = nil
    //    var body: some View {
    //        ZStack {
    //            Image(steps[stepIndex])
    //                .resizable()
    //                              .edgesIgnoringSafeArea(.all)
    //                              .transition(.opacity) // Fade animation
    //                              .animation(.easeInOut(duration: 0.7), value: stepIndex).onTapGesture {
    //                    withAnimation {
    //                                   stepIndex = (stepIndex + 1) % steps.count // Cycle through images
    //                               }
    //                              }.onAppear {
    //                                  stepIndex = 0
    //                              }
    //            VStack(alignment:.leading) {
    //                Header(showBackButton: false)
    //                Spacer().frame(height: 10)
    //                scoreCard()
    //                Spacer().frame(height: 16)
    //                VStack {
    //                    HStack{
    //                        Text("F").bold().foregroundColor(.gray)
    //                        Text("229y").bold().font(.system(size: 22)).foregroundColor(.black)
    //                    }.frame(height: 33).frame(width: 85)
    //                }
    //                .background(Color.white).cornerRadius(8).padding(.leading,20)
    //                Spacer()
    //                VStack {
    //                    HStack{
    //                        Text("0").bold().foregroundColor(.gray)
    //                        Text("157y").bold().font(.system(size: 22)).foregroundColor(.green)
    //                    }.frame(height: 33).frame(width: 85)
    //                }
    //                .background(Color.white).cornerRadius(8).padding(.leading,20)
    //                Spacer()
    //                VStack {
    //                    HStack{
    //                        Text("P").bold().foregroundColor(.gray)
    //                        Text("229y").bold().font(.system(size: 22)).foregroundColor(.black)
    //                    }.frame(height: 33).frame(width: 85)
    //                }
    //                .background(Color.white).cornerRadius(8).padding(.leading,20)
    //                Spacer().frame(height: 16)
    //                HStack{
    //                 roundTime()
    //                    Spacer()
    //                    HStack{
    //                        Image("pencil").resizable().frame(width: 20,height: 20).onTapGesture {
    //                            showScoreSheet.toggle()
    //                        }
    //
    //                    }.frame(width: 40,height: 40).background(Color.white)  .padding(.horizontal).clipShape(Circle()).shadow(radius: 4)
    //                }
    //
    //                PlayerInfoCard()
    //                Spacer().frame(height: 20)
    //
    //            }
    //        }.sheet(isPresented: $showScoreSheet) {
    //            scoreHoleSheet().presentationDetents([.fraction(0.7)]).presentationBackground(.white)
    //            .presentationCornerRadius(50).background(Color.white)}
    //    }

}

#Preview {
    mainPage()
}

struct leftright: View {
    var leftText = "F"
    var rightText = "229y"
    var body: some View {
        VStack {
            HStack {
                Text(leftText).bold().foregroundColor(.gray)
                Text(rightText).bold().font(.system(size: 22)).foregroundColor(
                    .black
                )
            }.frame(height: 33).frame(width: 85)
        }
        .background(Color.white).cornerRadius(8).padding(.leading, 20)
    }
}
