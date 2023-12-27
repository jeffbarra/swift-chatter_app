//
//  MessageBubble.swift
//  Chatter
//
//  Created by Jeff Barra on 12/23/23.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false

    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? Color(.systemGray4) : Color(.systemPink))
                    .cornerRadius(30)
                    .foregroundColor(message.received ? Color(.black) : Color(.white))
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }

            // Display date and time when showTime is true
            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.day().month().year())) • \(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "12345", text: "I've been coding SwiftUI applications from scratch and it's so much fun!", received: false, timestamp: Date()))
    }
}
