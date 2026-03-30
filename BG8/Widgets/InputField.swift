//
//  InputField.swift
//  BG8
//
//  Created by Mac HD on 20/02/2025.
//

import SwiftUI

struct InputField: View {
    var placeholder: String
       @Binding var text: String
       
       var body: some View {
           VStack(alignment: .leading) {
               Text(placeholder)
                   .font(.system(size: 15))
                   .foregroundColor(.black).padding(.bottom,5).padding(.top,5)
               
               TextField(placeholder, text: $text)
                   .frame(height: 15)
                   .padding()
                   .background(RoundedRectangle(cornerRadius: 30)
                                   .stroke(Color.gray.opacity(0.3), lineWidth: 1))
                   .foregroundColor(.gray)
           }
       }
   
}


