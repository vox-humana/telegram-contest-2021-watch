import SwiftUI
import TGWatchModel

public struct MessageCellView: View {
    let message: Message

    public var body: some View {
        Text(message.text)
            .padding()
            .foregroundColor(message.contentColor)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .circular)
                    .foregroundColor(message.backgroundColor)
            )
            .padding(.bottom)
    }
}

private extension Message {
    var contentColor: Color {
        outgoing ? .white : .black
    }

    var backgroundColor: Color {
        outgoing ? .accentColor : .white
    }
}

struct MessageCellView_Previews: PreviewProvider {
    static let messages: [Message] = .fake()

    static var previews: some View {
        ForEach(0 ..< messages.count) { idx in
            MessageCellView(message: messages[idx])
        }
        .accentColor(/*@START_MENU_TOKEN@*/ .blue/*@END_MENU_TOKEN@*/)
    }
}
