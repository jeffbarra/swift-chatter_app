//
//  MessageField.swift
//  Chatter
//
//  Created by Jeff Barra on 12/23/23.
//

import SwiftUI

struct MessageField: View {
    @EnvironmentObject var messagesManager: MessagesManager
    @State private var message = ""
    
    var body: some View {
        HStack {
            CustomTextField(placeholder: Text("Enter message..."), text: $message)
                .foregroundColor(Color(.systemPink))
                .fontWeight(.medium)
                
            
            // action
            Button {
                messagesManager.sendMessage(text: message)
                message = ""
              
            // label
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color(.systemPink))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color(.systemGray6))
        .cornerRadius(50)
        .padding()
    }
}

#Preview {
    MessageField()
        .environmentObject(MessagesManager())
}

struct CustomTextField: View {
    var placeholder: Text
    // pass variables to multiple views
    @Binding var text: String
    var editingChanged: (Bool) ->() = { _ in }
    var commit: ()->() = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            // If text is empty, show the placeholder on top of the TextField
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            // text field
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
