# Plan
## Crazy thoughts
- Use external JSON serialization lib (faster than built-in)
- Use whole module + time optimizations

## Environment
Xcode 12.5-RC (App Store version)
Apple Watch Series 3 38mm watchOS 6.0 simulator (armv7k 32 bit)

## Tools
* Create icon assets `./make_icons.sh AppIcon.svg`
* Version bump `agvtool next-version -all` , `agvtool new-marketing-version <your_specific_version>` https://developer.apple.com/library/archive/qa/qa1827/_index.html

# Notes watchOS 6 limitiations
- Check `watchOS6` & `#available(watchOS 7.0` for watchOS 6 API limitations
- No SwiftUI LifeStyle (@main)
- No navigationTitle (use navigationBarTitle)
- No @StateObject
- No MapView
- No ScrollViewReader

# Tasks
[] Check offsets for message author in channels and replies
[] Check reply colors in all messages (sticker, video etc)
[] Scroll to just sent messages
[] Keep scroll on "load more" button
[] Check performance of animated stickers. Limit the timer to limit redraw (skip frames) or show animation only in full view. Render all images into memory or files (right in download folder) instead of rendering every single frame
[] Check permissions for chats & channels
[] Notifications support
[] Contact list "New Message"
[] Show and update "unread" badge for sent messages
[] Send sticker
[] Send audio
[] Play video and VideoNote
[] Play audio
[] Check bloody list spacing (insets)
[] Hide "new message" button on chat list appearance (wait for data and use ScrollReader)
[] Remove SDWebImage dependency (extract webp and lottie decoding)
[] Remove `swift_qrcodejs` dependency
[] Extract model (states) library to reuse in TGWatchUI and TDLibClient
[] Check colors codes in style
[] Extract Views that use Chat (replace with ChatState)
[] Use static TDLib (wrap in XCFramework) so linker could remove unused
[] Build TDLib with WatchOS6.0 SDK (Xcode 11.5 has 6.2)

# External libraries
Making xcframework from tdjson https://github.com/oboupo/tdlib-spm

Generating swift models from TL interface: https://github.com/modestman/tl2swift
- There are too many public names (for 32bit platform) to put it into a separate library
- Replaced `public` with `internal` in Parser.swift
- Renamed `Date` to `DateContent` & `Text` to `TextContent`
- Make several properties mutable (`var` instead of `let`) for now to use the same models in business logic

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
