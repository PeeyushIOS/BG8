import SwiftUI

struct mainPage: View {
    @State var selectedTab: Int = 2
    @State private var isTabBarHidden: Bool = false

    var body: some View {
        NavigationStack {
    
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    homePage()
                        .tag(0)
                    coursePage()
                        .tag(1)
                    PlayPage()
                        .tag(2)
                    explorePage()
                        .tag(3)
                    partnerShipPage()
                        .tag(4)
                }
                
             
                if !isTabBarHidden {
                    CustomTabBar(selectedTab: $selectedTab)
                }
            }
            .environment(\.isTabBarHidden, $isTabBarHidden).edgesIgnoringSafeArea(.bottom).navigationBarBackButtonHidden(true)
        }
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: Int

    var body: some View {
        VStack {
            HStack {
                TabButton(title: "Home", icon: "homeIcon", index: 0, selectedTab: $selectedTab)
                TabButton(title: "Courses", icon: "courseIcon", index: 1, selectedTab: $selectedTab)
                TabButton(title: "Play", icon: "playIcon", index: 2, selectedTab: $selectedTab)
                TabButton(title: "Explore", icon: "exploreIcon", index: 3, selectedTab: $selectedTab)
                TabButton(title: "Shop", icon: "shopIcon", index: 4, selectedTab: $selectedTab)
            }
            .padding(.vertical, 12).padding(.leading,10).padding(.trailing,10)
            .background(
                Color.white
                    .clipShape(RoundedCorner(radius: 25, corners: [.topLeft, .topRight]))
                    .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: -4)
            )
        }
    }
}


struct TabButton: View {
    var title: String
    var icon: String
    var index: Int
    @Binding var selectedTab: Int

    var body: some View {
        Button(action: {
        
            selectedTab = index
            
       
            
        }) {
            VStack {

                Image(icon)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 20, height: 20)
              
                Text(title)
                    .font(.system(size: 15))
                    .foregroundColor(selectedTab == index ? .black : .black)
                
                if selectedTab == index {
                          Rectangle()
                              .fill(Color.black)
                              .frame(width: 10, height: 5)
                              .cornerRadius(1.9)
                              .padding(.bottom,15)
                      }
            }
            
            .frame(maxWidth: .infinity)
        }
    }
}



struct PlayPage2: View { var body: some View { Text("🎮 Play Page").frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.purple) } }



#Preview {
 signInPage()
}
struct TabBarHiddenKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = .constant(false)
}

extension EnvironmentValues {
    var isTabBarHidden: Binding<Bool> {
        get { self[TabBarHiddenKey.self] }
        set { self[TabBarHiddenKey.self] = newValue }
    }
}
