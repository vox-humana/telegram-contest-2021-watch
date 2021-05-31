import SwiftUI
import TGWatchUI

struct SettingsView: View {
    @ObservedObject var vm: SettingsViewModel
    private let archiveListService: ChatListService

    init(_ vm: SettingsViewModel, archiveListService: ChatListService) {
        self.vm = vm
        self.archiveListService = archiveListService
    }

    var body: some View {
        List {
            if let profile = vm.profile {
                ProfileLabel(profile: profile) { _ in }
            }
            NavigationLink(
                destination:
                ChatListView(.init(chatListService: archiveListService), showNewMessage: false)
            ) {
                SettingsLabel(name: "Archive", text: "Archive")
            }
            SettingsLabel(name: "SavedMessages", text: "Saved Messages")
            SettingsLabel(name: "Notifications", text: "Notifications")
            SettingsLabel(name: "Devices", text: "Devices")
            SettingsLabel(name: "Storage", text: "Data")
        }
        .navigationBarTitle("Settings")
    }
}

#if DEBUG
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView(
                SettingsViewModel(
                    profile: CurrentValueSubject(.profile).eraseToAnyPublisher()
                ),
                archiveListService: DummyService()
            )
        }
    }
#endif

struct ProfileLabel: View {
    let profile: User
    let downloadPhoto: (User) -> Void

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            AvatarView(profile.profilePhoto.map(ThumbnailState.init(profilePhoto:)))
                .onAppear {
                    downloadPhoto(profile)
                }

            VStack(alignment: .leading) {
                Text(profile.fullName)
                    .font(.tgTitle)
                if !profile.phoneNumber.isEmpty {
                    Text("+\(profile.phoneNumber)")
                        .foregroundColor(.tgGrey)
                        .font(.tgSubtitle)
                }
            }
        }
    }
}

extension User {
    var fullName: String {
        "\(firstName) \(lastName)"
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

final class SettingsViewModel: ObservableObject {
    @Published var profile: User?
    private var subscription: AnyCancellable?

    init(profile: AnyPublisher<User, Never>) {
        subscription = profile.sink { [weak self] in
            self?.profile = $0
        }
    }
}
