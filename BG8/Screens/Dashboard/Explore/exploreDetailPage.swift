import SwiftUI

struct exploreDetailPage: View {
    @Environment(\.isTabBarHidden) var isTabBarHidden
    var body: some View {
        
        VStack {
            Header(showBackButton: true)
            Spacer().frame(height: 16)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ZStack(alignment: .bottomLeading) {
                        Image("image")
                            .resizable()
                            .frame(height: 360)
                            .cornerRadius(30)
                            .padding(.horizontal, 16)
                        
                        VStack(alignment: .leading) {
                            Text("Unlock Exclusive Golfing \nExperiences")
                                .foregroundStyle(.white)
                                .font(.system(size: 20))
                                .bold()
                                .padding(.bottom, 5)
                            
                            Text("4 min read • John Carter")
                                .foregroundStyle(.white)
                                .font(.system(size: 15))
                                .bold()
                        }
                        .padding(.leading, 30)
                        .padding(.bottom, 25)
                    }
                    
                    Spacer().frame(height: 16)
                    
                    Text("""
                    Golf has always been more than just a sport—it’s a lifestyle, a passion, and an opportunity to connect with like-minded individuals. At Epic Golf Club, we take that experience to the next level. Our exclusive partnership program is designed for those who want access to premium perks, elite golfing opportunities, and connections that transcend the fairways.

                    Whether you’re a seasoned player, a luxury seeker, or someone who loves exclusive experiences, Epic Golf Club Partnerships are crafted to exceed your expectations.

                    **1. Access to World-Class Golf Courses**
                    At Epic Golf Club, we believe you deserve the best. Through our partnerships, members gain access to:

                    - **Private & Exclusive Golf Courses**: Play on some of the most prestigious, private courses not available to the general public.
                    - **Global Golfing Experiences**: Our partnerships extend beyond borders, offering you the chance to play at iconic golf destinations worldwide.
                    - **Tee Times Made Simple**: Forget long booking processes—members enjoy priority tee times and seamless scheduling.

                    **2. Exclusive Events and Tournaments**
                    When you become an Epic Golf Club partner, you don’t just play the game—you become part of something bigger:

                    - **Invite-Only Tournaments**: Compete and network at exclusive tournaments with other members and elite partners.
                    - **Luxury Social Gatherings**: Attend private events that blend golf, luxury, and social networking.
                    - **Special Golf Clinics**: Improve your game with exclusive training sessions led by golf pros and industry experts.

                    Imagine yourself on a breathtaking course, competing alongside seasoned professionals and fellow enthusiasts—Epic Golf Club makes this dream a reality.
                    """)
                    .font(.system(size: 15))
                    .padding(.horizontal, 16)
                    .padding(.bottom, 30)
                }
            }
        }
        .edgesIgnoringSafeArea(.bottom).navigationBarBackButtonHidden() .onAppear {
            isTabBarHidden.wrappedValue = true
        }
        .onDisappear {
            isTabBarHidden.wrappedValue = false 
        }
    }
}

