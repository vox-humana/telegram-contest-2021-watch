# Setup
- Xcode 12.5 (12E262)
- Add `Secrets.swift` file to the root folder with app secrets:
```swift
enum Secrets {
    static let appId = <Int>
    static let appHash = <String>
}
```
 - Update signing (team and provisioning profiles). To receive pushes on device make sure .watchkitapp profile has push notifications support and these certificates are registered in [Telegram](https://my.telegram.org/apps)
 - Hasn't built TDLib.xcframework for arm64 simulator so no Apple Silicon support :sorry:

# Implemented
- Logging in via QR Code with support for accounts protected by a 2-Step Verification password.
- Viewing the chat list.
- Opening chats with users, groups, channels.
- Viewing messages in chats, including text messages and all types of attachments: photos, videos, files, voice and video messages, locations, contacts, static and animated stickers, polls and quizzes. **No audio playing, responding to poll and quizes**
- Sending messages via voice message and text, as well as sending current location, emoji or canned text. **No stickers**
- Swiping right in the chat list to open Settings (WatchOS7 only).
- Accessing the Archive.
- Push registration. Only basic static pushes from APNS. Haven't figured out how to integrate TDLib with APNS.

# Not implemented
- Sending new messages to existing chats, by replying to notifications, and via the 'New Message' button in the chat list.
- Accessing Saved Messages.
- Changing Notification settings.
- Changing Data settings.
- Terminating sessions from the Devices menu.
