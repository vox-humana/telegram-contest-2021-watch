import SwiftUI

public class ContactState {
    public init(name: String, phoneNumber: String) {
        self.name = name
        self.phoneNumber = phoneNumber
    }

    let name: String
    let phoneNumber: String
}

public struct ContactContentView: View {
    let state: ContactState
    let keepImageColors: Bool

    public init(_ state: ContactState, keepImageColors: Bool) {
        self.state = state
        self.keepImageColors = keepImageColors
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 8) {
            if keepImageColors {
                icon.foregroundColor(.accentColor)
            } else {
                icon
            }

            VStack(alignment: .leading, spacing: 0) {
                Text(state.name)
                    .lineLimit(1)
                Text(state.phoneNumber)
                    .lineLimit(1)
            }
            .font(.tgTitle)
            Spacer()
        }
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: -10))
    }

    private var icon: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .frame(width: 36, height: 36)
    }
}

extension ContactState {
    static let preview = ContactState(
        name: "Alicia Torreaux", phoneNumber: "+123456789"
    )
}

struct ContactContentView_Previews: PreviewProvider {
    private static let outgoing = [true, false]

    static var previews: some View {
        VStack {
            ForEach(outgoing) { flag in
                ContactContentView(.preview, keepImageColors: !flag)
                    .tgMessageStyle(isOutgoing: flag)
                    .accentColor(.blue)
            }
        }
        .frame(width: .tgMessageWidth)
    }
}
