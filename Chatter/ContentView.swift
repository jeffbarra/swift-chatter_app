//
//  ContentView.swift
//  Chatter
//
//  Created by Jeff Barra on 12/23/23.
//

import SwiftUI

struct ContentView: View {
    // Bring in MessagesManager()
    @StateObject var messagesManager = MessagesManager()
    
    var body: some View {
        VStack {
            VStack {
                // Contact info section
                TitleRow()
                
                // Message area
                ScrollViewReader { proxy in 
                    
                    ScrollView {
                        ForEach(messagesManager.messages, id: \.id) { message in
                            MessageBubble(message: message)
                        }
                    }
                    .padding(.top, 10)
                    // message area background color
                    .background(.white)
                    // import our custom rounded corner extension
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .onChange(of: messagesManager.lastMessageId) { id in
                    withAnimation {
                        proxy.scrollTo(id, anchor: .bottom)
                    }
                    
                }
                }
            }
            .background(Color(.systemPink))
            
            // Message field area
            // Import MessageField component
            MessageField()
                .environmentObject(messagesManager)
        }
    }
}

#Preview {
    ContentView()
}
