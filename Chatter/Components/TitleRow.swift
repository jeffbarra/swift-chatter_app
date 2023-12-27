//
//  TitleRow.swift
//  Chatter
//
//  Created by Jeff Barra on 12/23/23.
//

import SwiftUI

struct TitleRow: View {
    var imageUrl = URL(string: "https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1288&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
    var name = "Sarah Smith"
    
    var body: some View {
        // image, name, status and icon (horizontal stack)
        HStack(spacing: 20) {
            // contact image
            AsyncImage(url: imageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            
            // Contact Name (stacked verically
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title).bold()
                
                // Online Status
                Text("Online")
                    .font(.caption)
                    .foregroundColor(Color(.white))
            }
            // fills entire horizontal row
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Phone icon
            Image(systemName: "phone.fill")
                .foregroundColor(Color(.systemGreen))
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        // padding for HStack
        .padding()
    }
}

#Preview {
    TitleRow()
        .background(Color(.systemPink))
}
