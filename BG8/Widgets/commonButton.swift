import SwiftUI

struct CommonButton<Destination: View>: View {
    var title: String
    var action: () -> Void
    var backgroundColor: Color = Color.black
    var textColor: Color = Color.white
    var borderColor: Color? = Color.black
    var height: CGFloat = 50
    var cornerRadius: CGFloat = 25
    let destination: () -> Destination
    
    var body: some View {
        if Destination.self != EmptyView.self {
            NavigationLink(destination: destination()) {
                buttonContent
            }
        } else {
            Button(action: action) {
                buttonContent
            }
        }
    }
    
    private var buttonContent: some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity, minHeight: height)
            .padding(.horizontal)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor ?? backgroundColor, lineWidth: borderColor != nil ? 2 : 0)
            )
    }
}

