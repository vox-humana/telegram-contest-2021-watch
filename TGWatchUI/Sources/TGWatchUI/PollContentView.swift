import SwiftUI

public struct PollState {
    public init(question: String, anonymous: Bool, closed: Bool, type: PollState.PollType, options: [PollState.Option]) {
        self.question = question
        self.anonymous = anonymous
        self.closed = closed
        self.type = type
        self.options = options
    }

    public struct Option {
        public init(text: String, chosen: Bool, percentage: Int) {
            self.text = text
            self.chosen = chosen
            self.percentage = percentage
        }

        let text: String
        let chosen: Bool
        let percentage: Int
    }

    public enum PollType {
        case poll(multipleAnswers: Bool)
        case quiz(correct: Int)
    }

    let question: String
    let anonymous: Bool
    let closed: Bool
    let type: PollType
    let options: [Option]
}

struct PollContentView: View {
    let state: PollState
    let outgoing: Bool

    @State private var buttomWidth: CGFloat?

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            VStack(alignment: .leading, spacing: 0) {
                Text(state.question)
                    .font(.tgTitle)

                Text(state.anonymous ? "Anonymous Poll" : "Public Poll")
                    .font(.tgSubtitle)
                    .foregroundColor(outgoing ? .white.opacity(0.7) : .tgGrey)
            }
            .padding(.tgTextPadding)
            .background(GeometryReader { geometry in
                Color.clear.preference(
                    key: ButtonWidthPreferenceKey.self,
                    value: geometry.size.width
                )
            })
            .tgMessageStyle(isOutgoing: outgoing, hideBackground: false, ignoreClipping: false)

            Text("View Options")
                .font(.tgTitle)
                .padding(EdgeInsets(top: 13, leading: 9, bottom: 13, trailing: 9))
                .frame(width: buttomWidth)
                .background(
                    RoundedRectangle(cornerRadius: 8).fill(Color.tgGreyPlatter)
                )
        }
        .onPreferenceChange(ButtonWidthPreferenceKey.self) {
            buttomWidth = $0
        }
    }
}

private extension PollContentView {
    struct ButtonWidthPreferenceKey: PreferenceKey {
        static let defaultValue: CGFloat = 0
        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = max(value, nextValue())
        }
    }
}

struct PollFullView: View {
    let state: PollState
    @State var selectedOption: Int? = nil

    var body: some View {
        Text(state.question)
            .font(.tgTitle)
            .padding(.tgTextPadding)
            .clearedListStyle()

        if state.closed || state.voted {
            votedView
        } else {
            votingView
                .environment(\.defaultMinListRowHeight, 44)
        }
    }

    @ViewBuilder
    private var votingView: some View {
        ForEach(0 ..< state.options.count) { i in
            Button {
                selectedOption = i
            }
            label: {
                HStack {
                    let option = state.options[i]
                    Image(selectedOption == i ? "On" : "Off", bundle: .module)
                    Text(option.text)
                        .font(.tgTitle)
                }
            }
            .frame(minHeight: 44)
        }

        Button("Vote") {
            // TODO: send `selectedOption`
        }
        .buttonStyle(AccentStyle())
        .clearedListStyle()
    }

    @ViewBuilder
    private var votedView: some View {
        ForEach(0 ..< state.options.count) { i in
            HStack {
                let option = state.options[i]
                Text("\(option.percentage)%")
                    .foregroundColor(state.optionColor(i))
                    .font(.tgPollNumber)
                Text(option.text)
                    .font(.tgTitle)
            }
            // .listRowInsets(EdgeInsets()) // TODO: check
        }
    }
}

private extension PollState {
    func optionColor(_ i: Int) -> Color {
        switch type {
        case .poll:
            return .white
        case let .quiz(correct):
            return i == correct ? .tgGreen : .tgRed
        }
    }

    var voted: Bool {
        options.first(where: \.chosen) != nil ? true : false
    }
}

struct PollFullView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            PollFullView(state: .previewPoll)
        }
        .environment(\.defaultMinListRowHeight, 10)
        .accentColor(.blue)
    }
}

struct PollContentView_Previews: PreviewProvider {
    static var previews: some View {
        DevicePreview {
            List {
                PollContentView(state: .previewPoll, outgoing: false)
                PollContentView(state: .previewQuiz, outgoing: true)
            }
            .environment(\.defaultMinListRowHeight, 10)
        }
    }
}

extension PollState {
    static let previewPoll = PollState(
        question: "All-Campus Party. When?💃",
        anonymous: false,
        closed: false,
        type: .poll(multipleAnswers: false),
        options: [
            .init(text: "Friday 8PM", chosen: false, percentage: 50),
            .init(text: "Saturday 6PM", chosen: false, percentage: 35),
            .init(text: "Sunday 3PM", chosen: false, percentage: 15),
        ]
    )

    static let previewQuiz = PollState(
        question: "Where was the declaration of\nindependence signed?",
        anonymous: true,
        closed: true,
        type: .quiz(correct: 0),
        options: [
            .init(text: "At the bottom", chosen: false, percentage: 50),
            .init(text: "Rio de Janeiro", chosen: false, percentage: 35),
            .init(text: "Alaska", chosen: false, percentage: 15),
        ]
    )
}
