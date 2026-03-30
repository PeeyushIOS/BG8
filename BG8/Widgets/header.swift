import SwiftUI

struct Header: View {
    var showBackButton: Bool = true
    var showImage: Bool = true
    var bgColor: Color = Color.white
    var profileImage: String = "profile"
    var logo: String = "logo"
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            HStack {
         
                if showBackButton {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    .frame(width: 40)
                } else {
                    Spacer().frame(width: 40)
                }

                Spacer()
                

                ZStack {
                    Image(logo)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                }
                .frame(maxWidth: .infinity)

                Spacer()
                
                if showImage == true {
                    NavigationLink (destination: editProfilePage() ){
                        Image(profileImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                    }
                }else{
                    Spacer().frame(width: 40)
                }
            }
            .padding(.horizontal, 10)
            .frame(height: 50).background(bgColor)
        }
    }
}

#Preview{
    Header()
}




