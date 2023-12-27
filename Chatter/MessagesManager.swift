//
//  MessagesManager.swift
//  Chatter
//
//  Created by Jeff Barra on 12/23/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    // create database instance
    let db = Firestore.firestore()
    
    init() {
        getMessages()
    }
    
    func getMessages() {
        db.collection("messages").addSnapshotListener { QuerySnapshot, error in
            guard let documents = QuerySnapshot?.documents else {
                print("Error fetching documents: \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do {
                    // take document data and convert to Message structure we created in our models
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into Message: \(error)")
                    return nil
                }
            }
            // sort messages by timestamp
            self.messages.sort { $0.timestamp < $1.timestamp }
            
            // changes the last message on the page as the id in order for scrolling to last id to work
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
        }
    }
    
    // send message function - adding message from field to database
    func sendMessage(text: String) {
        do {
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())
        
            try db.collection("messages").document().setData(from: newMessage)
            
        } catch {
            print("Error adding message to Firestore: \(error)")
        }
    }
    
}
