import SwiftUI

public struct DocumentState: Hashable {
    public init(fileName: String, size: Int64) {
        self.fileName = fileName
        self.size = size
    }

    let fileName: String
    let size: Int64
}

public struct DocumentContentView: View {
    let state: DocumentState
    let keepImageColors: Bool

    public init(_ state: DocumentState, keepImageColors: Bool) {
        self.state = state
        self.keepImageColors = keepImageColors
    }

    public var body: some View {
        HStack(alignment: .center, spacing: 8) {
            image("Document")

            VStack(alignment: .leading) {
                Text(state.fileName)
                    .lineLimit(1)
                Text(ByteCountFormatter.string(fromByteCount: state.size, countStyle: .file))
            }
            .padding(contentPagging)
            .font(.tgTitle)
            Spacer()
        }
        .padding(8)
    }

    private func image(_ name: String) -> some View {
        let image = Image(name, bundle: .module)
        return keepImageColors ? image : image.renderingMode(.template)
    }

    private var contentPagging: EdgeInsets {
        EdgeInsets(top: 1, leading: 0, bottom: 3, trailing: 0)
    }
}

extension DocumentState {
    static let preview = DocumentState(
        fileName: "Cover.pdf", size: 1_424_000
    )
}

struct DocumentContentView_Previews: PreviewProvider {
    private static let outgoing = [true, false]

    static var previews: some View {
        VStack {
            ForEach(outgoing) { flag in
                DocumentContentView(.preview, keepImageColors: !flag)
                    .tgMessageStyle(isOutgoing: flag)
                    .accentColor(.blue)
            }
        }
    }
}
