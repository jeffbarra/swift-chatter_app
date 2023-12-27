//
//  Message.swift
//  Chatter
//
//  Created by Jeff Barra on 12/23/23.
//

// Structure that all messages will follow
import Foundation

// Identifiable = each message can be coded with a unique ID
// Codable = convert firestore data and convert it to codable
struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
}
