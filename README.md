# Plan of attack
### TDLib for networking
1. Build TDLib for watchOS https://github.com/tdlib/td/tree/master/example/ios

⚠️ Apple Watch uses 64bit arm from S3 (series 4) and TDLib buiild is not ready for 64bit yet https://github.com/tdlib/td/issues/745

- add 64bit watchOS architectures in openssl Makefile
```
# watchOS targets
TARGETS-watchOS=watchsimulator.i386 watchsimulator.x86_64 watchos.armv7k watchos.arm64_32
```
- limit list of target platforms in build-openssl.sh
```
#TODO: change openssl version
#platforms="macOS iOS watchOS tvOS"
platforms="watchOS"
```
and build.sh
```
#platforms="macOS iOS watchOS tvOS"
platforms="watchOS"
for platform in $platforms;
```

bitcode translation (from https://twitter.com/stroughtonsmith/status/1044706837478735873)
```
/Applications/Xcode-12.4.app/Contents/Developer/usr/bin/bitcode-build-tool -o ~/Downloads/libtdjson.1.7.2.arm64_32.dylib --sdk /Applications/Xcode-12.4.app/Contents/Developer/Platforms/WatchOS.platform/Developer/SDKs/WatchOS.sdk/ --translate-watchos ~/Downloads/libtdjson.1.7.2.dylib
```
to ignore fat binary linking error set VALIDATE_WORKSPACE=YES in Xcode configuration

2. integrate into project https://github.com/tdlib/td/blob/master/example/swift/src/main.swift

### Thin Swift client wrapper
### QR Code login
### Chat list


## Crazy thoughts
- Use external JSON serialization lib (faster than built-in)
- Use whole module + time optimizations

## Environment
Xcode 12.4 (App Store version)
Apple Watch Series 3 38mm watchOS 6.0 simulator (armv7k 32 bit)

# Intro
https://t.me/contest/221

The Second Round of the iOS Contest 2021 starts now.

Prize fund: $52,000. 
Deadline: 23:59 on March, 21 (Dubai time).
Who can participate: Everyone. You are welcome to join even if you didn't take part in the previous round.

The task is to create a standalone Telegram app for WatchOS 6+ in Swift without using third-party UI frameworks. The app should support:

- Logging in via QR Code with support for accounts protected by a 2-Step Verfication password.
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

Your app should run on WatchOS 6 and above. The design implementation should be identical to the mockups attached below (Sketch, PNG).

You are welcome to view the [API docs](https://core.telegram.org/#telegram-api) and inspect the [source code of Telegram for iOS](https://github.com/TelegramMessenger/Telegram-iOS). The main criteria for us to identify the winners will be the speed and stability of the apps – as well as attention to detail.

We understand that you may not be able to suport all the features on our list before the deadline. During evaluation we will note the number of features implemented flawlessly. The largest prizes will be awarded to contestants who implemented the largest number of features without major issues.

Note that the list of features above is sorted by their relative importance.

UPD: After the results of this round are published, we may announce further rounds with similar prize funds. The task will likely be to improve the WatchOS apps created during this round.
