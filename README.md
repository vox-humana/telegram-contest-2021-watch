# Plan of attack
## Networking

### TDLib for networking
Build TDLib for watchOS https://github.com/tdlib/td/tree/master/example/ios

## QRCode generator
from TG iOS?

## Image loading
TDLib?

## DB / local storage
TDLib?

## Crazy thoughts
- Use external JSON serialization lib (faster than built-in)
- Use whole module + time optimizations

## Environment
Xcode 12.5-RC (App Store version)
Apple Watch Series 3 38mm watchOS 6.0 simulator (armv7k 32 bit)

# Notes watchOS 6 limitiations
- No SwiftUI LifeStyle (@main)
- Check `watchOS6` & `#available(watchOS 7.0` for watchOS 6 API limitations
- No navigationTitle (use navigationBarTitle)
- No @StateObject

# Tasks
[] Check run on device
[] Rewrite QRCode generation to match with design (corners)
[] Remove `swift_qrcodejs` dependency
[] Embed only device or simulator dylib (see warning) or use XCFramework
[] Build static versions of tdlib (limiting size with removing unused code)
[] Check colors in style
[] Build TDLib with WatchOS6.0 SDK (Xcode 11.5 has 6.2)
[] Add Model layer with subset of used in UI properties, keep TDLibSwift generated model in the package with TDLibClient (TGWatchView doesn't depend on TDLib)

# External libraries
https://github.com/modestman/tl2swift
- There are too many public names (for 32bit platform) to put it into a separate library
- Renamed `Date` to `DateContent` & `Text` to `TextContent`
- 

# Intro
https://t.me/contest/258

🏆 iOS Contest, Round 3 (watchOS)

The third round of the iOS contest starts now. Everyone can participate, even if they didn't take part in the previous rounds.

The task is the same as in the [second round](https://t.me/contest/221) – to create a working watchOS app based on the [mockups](https://t.me/contest/222) provided.

Deadline: June 6, 23:59 Dubai time.
Prize fund: $40,000

Who can participate: Everyone. We expect the participants of the second round to improve their submissions. We also invite new participants to join. 

TDLib: Most of the participants of the second round based their apps on [TDLib](https://core.telegram.org/tdlib). At that time, TDLib wasn’t optimized to run on WatchOS. We have recently updated TDLib to better support WatchOS. We hope that this will result in a significant improvement in stability and performance of apps submitted in this new round.

The Task:
Create a standalone Telegram app for watchOS 7 in Swift without using third-party UI frameworks (using TDLib is allowed). Bonus points if the app also supports watchOS 6.

The app should support:

- Logging in via QR Code with support for accounts protected by a 2-Step Verification password.
- Viewing the chat list.
- Opening chats with users, groups, channels.
- Viewing messages in chats, including text messages and all types of attachments: photos, videos, files, voice and video messages, locations, contacts, static and animated stickers, polls and quizzes.
- Sending messages via voice message and text, as well as sending current location, stickers, emoji or canned text. 
- Sending new messages to existing chats, by replying to notifications, and via the 'New Message' button in the chat list.
- Swiping right in the chat list to open Settings.
- Accessing the Archive and Saved Messages.
- Changing Notification settings.
- Changing Data settings.
- Terminating sessions from the Devices menu.

Your app should run on WatchOS 7. The design implementation should be identical to the mockups (Sketch, PNG).

You are welcome to view the [API docs](https://core.telegram.org/#telegram-api) and inspect the [source code of Telegram for iOS](https://github.com/TelegramMessenger/Telegram-iOS). The main criteria for us to identify the winners will be the speed and stability of the apps – as well as attention to detail.

The primary objective is to implement viewing messages in chats, sending text messages and push notification support.

We understand that you may not be able to support all the features from our list before the deadline. During evaluation we will note the number of features implemented flawlessly. The largest prizes will be awarded to contestants who implemented the largest number of features without major issues.

Note that features on list are sorted by their relative importance.

Submissions:
Contestants will be able to submit their apps to @ContestBot closer to the end of this round.
