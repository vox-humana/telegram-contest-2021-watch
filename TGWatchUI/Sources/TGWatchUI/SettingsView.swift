import SwiftUI
import TGWatchModel

public struct SettingsView: View {
    @ObservedObject var vm: SettingsViewModel

    public init(_ vm: SettingsViewModel) {
        self.vm = vm
    }

    public var body: some View {
        List {
            if let profile = vm.profile {
                ProfileLabel(profile: profile) { _ in }
            }
            SettingsLabel(name: "Archive", text: "Archive")
            SettingsLabel(name: "SavedMessages", text: "Saved Messages")
            SettingsLabel(name: "Notifications", text: "Notifications")
            SettingsLabel(name: "Devices", text: "Devices")
            SettingsLabel(name: "Storage", text: "Data")
        }
        .navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(
            SettingsViewModel(
                profile: CurrentValueSubject(.profile).eraseToAnyPublisher()
            )
        )
    }
}

struct ProfileLabel: View {
    let profile: User
    let downloadPhoto: (User) -> Void

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            AvatarView(photo: profile.photo)
                .onAppear {
                    downloadPhoto(profile)
                }

            VStack(alignment: .leading) {
                Text(profile.name)
                    .font(.tgTitle)
                if !profile.phone.isEmpty {
                    Text("+\(profile.phone)")
                        .foregroundColor(.tgGrey)
                        .font(.tgSubtitle)
                }
            }
        }
    }
}

struct SettingsLabel: View {
    let name: String
    let text: String

    var body: some View {
        HStack(spacing: 8) {
            Image(name, bundle: .current)
            Text(text)
        }
    }
}

extension Bundle {
    static let current = Bundle(for: SettingsViewModel.self)
}

import Combine

public final class SettingsViewModel: ObservableObject {
    @Published var profile: User?
    private var subscription: AnyCancellable?

    public init(profile: AnyPublisher<User, Never>) {
        subscription = profile.sink { [weak self] in
            self?.profile = $0
        }
    }
}
