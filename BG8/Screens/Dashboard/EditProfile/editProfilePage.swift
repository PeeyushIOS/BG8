//
//  editProfilePage.swift
//  BG8
//
//  Created by Mac HD on 26/02/2025.
//

import SwiftUI

struct editProfilePage: View {
    @State private var isPrivate = true
    @State private var isHandicapUpdated = false
    @State var selectedImage: UIImage?
    @State private var showImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    var body: some View {
        NavigationStack {
            VStack{
                Header(showImage: false).frame(height: 50)
                ScrollView{
                    VStack{
                        Spacer().frame(height: 16)
                        ZStack(alignment:.topTrailing){
                          
                            if let image = selectedImage {
                                ZStack(alignment: .topTrailing) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(75)
                                        .clipped()
                    
                                }
                            }else {
                                Image(systemName: "person.circle.fill").resizable().frame(width: 150,height: 150)
                            }
                            Image("edit").resizable().frame(width: 40,height: 40).onTapGesture {
                                showImagePicker = true
                            }
                        }
//                        InputField(placeholder: "Sophia Olive", text: .constant("Name"))
                        InputField(placeholder: "User Name", text: .constant("Adim smith"))
                        InputField(placeholder: "Email", text: .constant("golf@gmail.com"))
                        Spacer().frame(height: 16)
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Share Score")
                                .font(.headline)
                                .bold()
                            
                            Text("Control who can see your golf scores. Keep them private for personal tracking or make them public to share with friends and the community.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            HStack {
                                radioButton(text: "Private", isSelected: isPrivate) {
                                    isPrivate = true
                                }
                                Spacer()
                            }
                            
                            HStack {
                                radioButton(text: "Public", isSelected: !isPrivate) {
                                    isPrivate = false
                                }
                                Spacer()
                            }
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        Spacer().frame(height: 16)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("Update handicap")
                                    .font(.headline)
                                    .bold()
                                Spacer()
                                
                                Toggle("", isOn: $isHandicapUpdated)
                                    .labelsHidden()
                            }
                            
                            Text("Enable this option to keep your handicap updated after every game based on your performance.")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                        .cornerRadius(12)
                        Spacer().frame(height: 56)
                        CommonButton(title: "Change Password", action: {},backgroundColor: Color.clear,textColor: Color.black, destination: {changePasswordPage()})
                        Spacer().frame(height: 8)
                        CommonButton(title: "Update", action: {}, destination: {EmptyView()})
                        Spacer().frame(height: 8)
                        CommonButton(title: "Log Out", action: {},backgroundColor: Color.red,borderColor: Color.red, destination: {EmptyView()})
                        
                    }
                    .padding()
                    
                    
                }
                
            }.navigationBarHidden(true)
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(image: $selectedImage, sourceType: sourceType)
                } .onChange(of: selectedImage) { newImage in
                    guard let image = newImage else { return } }
        }
    }
}

#Preview {
    startPage()
}



