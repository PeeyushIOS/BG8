import SwiftUI

struct PlayerInfoCard: View {
    var playerName: String = "John Carter"
    var holeNumber: String = "Hole #11"
    var score: String = "-4"
    var shots: String = "38"
    var profileImage: String = "profile" // Replace with actual image asset

    var body: some View {
        HStack(spacing: 12) {
            Image(profileImage)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 4) {
                Text(playerName)
                    .font(.headline)
                    .foregroundColor(.white)
                    .bold()
                
                Text(holeNumber)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.7))
            }
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(score)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Text("Score")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
            }
            
            VStack(alignment: .trailing) {
                Text(shots)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                Text("Shots")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
            }
        }
        .padding()
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.8), Color.black.opacity(0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
        .padding(.horizontal)
    }
}

#Preview {
    mainPage()
}
