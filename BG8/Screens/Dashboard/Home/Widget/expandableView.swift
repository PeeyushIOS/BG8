import SwiftUI

struct expandableView: View {
    enum ExpansionState {
        case collapsed
        case halfExpanded
        case fullyExpanded
    }

    @State private var expansionState: ExpansionState = .collapsed

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Quick Summary")
                        .fontWeight(.medium)
                        .font(.title2)
                        .foregroundColor(.black)

                    Spacer()

                    if expansionState == .collapsed {
                        Image(systemName: "chevron.down")
                            .foregroundColor(.black)
                            .onTapGesture {
                                withAnimation {
                                    toggleExpansion()
                                }
                            }
                    }
                }

                if expansionState != .collapsed {
                    Text("Gross Score:")
                        .fontWeight(.bold)
                        .foregroundColor(.black) +
                    Text(" The number of strokes you take on a hole.")
                        .foregroundColor(.gray)

                    Text("Net Score:")
                        .fontWeight(.bold)
                        .foregroundColor(.black) +
                    Text(" Gross score minus Handicap Strokes.")
                        .foregroundColor(.gray)

                    Text("Handicap:")
                        .fontWeight(.bold)
                        .foregroundColor(.black) +
                    Text(" Applied only to the hardest holes based on your handicap.")
                        .foregroundColor(.gray)

                    if expansionState == .fullyExpanded {
                        Text("How Does Handicap Work?")
                            .font(.headline)
                            .foregroundColor(.black)
                        Text("""
                        Every course has a "Handicap Index" for each hole, ranking them from 1 (hardest) to 18 (easiest).

                        Your handicap determines how many strokes you can subtract from your gross score over the round.

                        If your handicap is -12, you get 1 stroke on the 12 hardest holes (those ranked 1–12 in the "HCP" row).

                        For each of these 12 holes:
                        - Subtract 1 stroke from the gross score for that hole.
                        - The "hardest holes" are those ranked 1 to 12 in the "HCP" row.

                        On holes ranked 13–18, the gross score remains the same as the net score.
                        """)
                        .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .onTapGesture {
                withAnimation {
                    toggleExpansion()
                }
            }

            if expansionState != .collapsed {
                Spacer().frame(height: 10)
                Image(systemName: expansionState == .halfExpanded ? "chevron.down" : "chevron.up")
                    .foregroundColor(.black)
                    .onTapGesture {
                        withAnimation {
                            toggleExpansion()
                        }
                    }
                Spacer().frame(height: 15)
            }
        }
        .background(RoundedRectangle(cornerRadius: 8)
            .stroke(Color.gray.opacity(0.3), lineWidth: 1))
    }

    private func toggleExpansion() {
        switch expansionState {
        case .collapsed:
            expansionState = .halfExpanded
        case .halfExpanded:
            expansionState = .fullyExpanded
        case .fullyExpanded:
            expansionState = .collapsed
        }
    }
}

#Preview {
    expandableView()
}
