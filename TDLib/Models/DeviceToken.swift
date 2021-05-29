//
//  DeviceToken.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Represents a data needed to subscribe for push notifications through registerDevice method. To use specific push notification service, the correct application platform must be specified and a valid server authentication data must be uploaded at https://my.telegram.org
internal enum DeviceToken: Codable {
    /// A token for Firebase Cloud Messaging
    case deviceTokenFirebaseCloudMessaging(DeviceTokenFirebaseCloudMessaging)

    /// A token for Apple Push Notification service
    case deviceTokenApplePush(DeviceTokenApplePush)

    /// A token for Apple Push Notification service VoIP notifications
    case deviceTokenApplePushVoIP(DeviceTokenApplePushVoIP)

    /// A token for Windows Push Notification Services
    case deviceTokenWindowsPush(DeviceTokenWindowsPush)

    /// A token for Microsoft Push Notification Service
    case deviceTokenMicrosoftPush(DeviceTokenMicrosoftPush)

    /// A token for Microsoft Push Notification Service VoIP channel
    case deviceTokenMicrosoftPushVoIP(DeviceTokenMicrosoftPushVoIP)

    /// A token for web Push API
    case deviceTokenWebPush(DeviceTokenWebPush)

    /// A token for Simple Push API for Firefox OS
    case deviceTokenSimplePush(DeviceTokenSimplePush)

    /// A token for Ubuntu Push Client service
    case deviceTokenUbuntuPush(DeviceTokenUbuntuPush)

    /// A token for BlackBerry Push Service
    case deviceTokenBlackBerryPush(DeviceTokenBlackBerryPush)

    /// A token for Tizen Push Service
    case deviceTokenTizenPush(DeviceTokenTizenPush)

    private enum Kind: String, Codable {
        case deviceTokenFirebaseCloudMessaging
        case deviceTokenApplePush
        case deviceTokenApplePushVoIP
        case deviceTokenWindowsPush
        case deviceTokenMicrosoftPush
        case deviceTokenMicrosoftPushVoIP
        case deviceTokenWebPush
        case deviceTokenSimplePush
        case deviceTokenUbuntuPush
        case deviceTokenBlackBerryPush
        case deviceTokenTizenPush
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .deviceTokenFirebaseCloudMessaging:
            let value = try DeviceTokenFirebaseCloudMessaging(from: decoder)
            self = .deviceTokenFirebaseCloudMessaging(value)
        case .deviceTokenApplePush:
            let value = try DeviceTokenApplePush(from: decoder)
            self = .deviceTokenApplePush(value)
        case .deviceTokenApplePushVoIP:
            let value = try DeviceTokenApplePushVoIP(from: decoder)
            self = .deviceTokenApplePushVoIP(value)
        case .deviceTokenWindowsPush:
            let value = try DeviceTokenWindowsPush(from: decoder)
            self = .deviceTokenWindowsPush(value)
        case .deviceTokenMicrosoftPush:
            let value = try DeviceTokenMicrosoftPush(from: decoder)
            self = .deviceTokenMicrosoftPush(value)
        case .deviceTokenMicrosoftPushVoIP:
            let value = try DeviceTokenMicrosoftPushVoIP(from: decoder)
            self = .deviceTokenMicrosoftPushVoIP(value)
        case .deviceTokenWebPush:
            let value = try DeviceTokenWebPush(from: decoder)
            self = .deviceTokenWebPush(value)
        case .deviceTokenSimplePush:
            let value = try DeviceTokenSimplePush(from: decoder)
            self = .deviceTokenSimplePush(value)
        case .deviceTokenUbuntuPush:
            let value = try DeviceTokenUbuntuPush(from: decoder)
            self = .deviceTokenUbuntuPush(value)
        case .deviceTokenBlackBerryPush:
            let value = try DeviceTokenBlackBerryPush(from: decoder)
            self = .deviceTokenBlackBerryPush(value)
        case .deviceTokenTizenPush:
            let value = try DeviceTokenTizenPush(from: decoder)
            self = .deviceTokenTizenPush(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .deviceTokenFirebaseCloudMessaging(value):
            try container.encode(Kind.deviceTokenFirebaseCloudMessaging, forKey: .type)
            try value.encode(to: encoder)
        case let .deviceTokenApplePush(value):
            try container.encode(Kind.deviceTokenApplePush, forKey: .type)
            try value.encode(to: encoder)
        case let .deviceTokenApplePushVoIP(value):
            try container.encode(Kind.deviceTokenApplePushVoIP, forKey: .type)
            try value.encode(to: encoder)
        case let .deviceTokenWindowsPush(value):
            try container.encode(Kind.deviceTokenWindowsPush, forKey: .type)
            try value.encode(to: encoder)
        case let .deviceTokenMicrosoftPush(value):
            try container.encode(Kind.deviceTokenMicrosoftPush, forKey: .type)
            try value.encode(to: encoder)
        case let .deviceTokenMicrosoftPushVoIP(value):
            try container.encode(Kind.deviceTokenMicrosoftPushVoIP, forKey: .type)
            try value.encode(to: encoder)
        case let .deviceTokenWebPush(value):
            try container.encode(Kind.deviceTokenWebPush, forKey: .type)
            try value.encode(to: encoder)
        case let .deviceTokenSimplePush(value):
            try container.encode(Kind.deviceTokenSimplePush, forKey: .type)
            try value.encode(to: encoder)
        case let .deviceTokenUbuntuPush(value):
            try container.encode(Kind.deviceTokenUbuntuPush, forKey: .type)
            try value.encode(to: encoder)
        case let .deviceTokenBlackBerryPush(value):
            try container.encode(Kind.deviceTokenBlackBerryPush, forKey: .type)
            try value.encode(to: encoder)
        case let .deviceTokenTizenPush(value):
            try container.encode(Kind.deviceTokenTizenPush, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A token for Firebase Cloud Messaging
internal struct DeviceTokenFirebaseCloudMessaging: Codable {
    /// True, if push notifications should be additionally encrypted
    internal let encrypt: Bool

    /// Device registration token; may be empty to de-register a device
    internal let token: String

    internal init(
        encrypt: Bool,
        token: String
    ) {
        self.encrypt = encrypt
        self.token = token
    }
}

/// A token for Apple Push Notification service
internal struct DeviceTokenApplePush: Codable {
    /// Device token; may be empty to de-register a device
    internal let deviceToken: String

    /// True, if App Sandbox is enabled
    internal let isAppSandbox: Bool

    internal init(
        deviceToken: String,
        isAppSandbox: Bool
    ) {
        self.deviceToken = deviceToken
        self.isAppSandbox = isAppSandbox
    }
}

/// A token for Apple Push Notification service VoIP notifications
internal struct DeviceTokenApplePushVoIP: Codable {
    /// Device token; may be empty to de-register a device
    internal let deviceToken: String

    /// True, if push notifications should be additionally encrypted
    internal let encrypt: Bool

    /// True, if App Sandbox is enabled
    internal let isAppSandbox: Bool

    internal init(
        deviceToken: String,
        encrypt: Bool,
        isAppSandbox: Bool
    ) {
        self.deviceToken = deviceToken
        self.encrypt = encrypt
        self.isAppSandbox = isAppSandbox
    }
}

/// A token for Windows Push Notification Services
internal struct DeviceTokenWindowsPush: Codable {
    /// The access token that will be used to send notifications; may be empty to de-register a device
    internal let accessToken: String

    internal init(accessToken: String) {
        self.accessToken = accessToken
    }
}

/// A token for Microsoft Push Notification Service
internal struct DeviceTokenMicrosoftPush: Codable {
    /// Push notification channel URI; may be empty to de-register a device
    internal let channelUri: String

    internal init(channelUri: String) {
        self.channelUri = channelUri
    }
}

/// A token for Microsoft Push Notification Service VoIP channel
internal struct DeviceTokenMicrosoftPushVoIP: Codable {
    /// Push notification channel URI; may be empty to de-register a device
    internal let channelUri: String

    internal init(channelUri: String) {
        self.channelUri = channelUri
    }
}

/// A token for web Push API
internal struct DeviceTokenWebPush: Codable {
    /// Base64url-encoded authentication secret
    internal let authBase64url: String

    /// Absolute URL exposed by the push service where the application server can send push messages; may be empty to de-register a device
    internal let endpoint: String

    /// Base64url-encoded P-256 elliptic curve Diffie-Hellman public key
    internal let p256dhBase64url: String

    internal init(
        authBase64url: String,
        endpoint: String,
        p256dhBase64url: String
    ) {
        self.authBase64url = authBase64url
        self.endpoint = endpoint
        self.p256dhBase64url = p256dhBase64url
    }
}

/// A token for Simple Push API for Firefox OS
internal struct DeviceTokenSimplePush: Codable {
    /// Absolute URL exposed by the push service where the application server can send push messages; may be empty to de-register a device
    internal let endpoint: String

    internal init(endpoint: String) {
        self.endpoint = endpoint
    }
}

/// A token for Ubuntu Push Client service
internal struct DeviceTokenUbuntuPush: Codable {
    /// Token; may be empty to de-register a device
    internal let token: String

    internal init(token: String) {
        self.token = token
    }
}

/// A token for BlackBerry Push Service
internal struct DeviceTokenBlackBerryPush: Codable {
    /// Token; may be empty to de-register a device
    internal let token: String

    internal init(token: String) {
        self.token = token
    }
}

/// A token for Tizen Push Service
internal struct DeviceTokenTizenPush: Codable {
    /// Push service registration identifier; may be empty to de-register a device
    internal let regId: String

    internal init(regId: String) {
        self.regId = regId
    }
}
