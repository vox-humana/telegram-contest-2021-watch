//
//  DiceStickers.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains animated stickers which should be used for dice animation rendering
internal enum DiceStickers: Codable {
    /// A regular animated sticker
    case diceStickersRegular(DiceStickersRegular)

    /// Animated stickers to be combined into a slot machine
    case diceStickersSlotMachine(DiceStickersSlotMachine)

    private enum Kind: String, Codable {
        case diceStickersRegular
        case diceStickersSlotMachine
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .diceStickersRegular:
            let value = try DiceStickersRegular(from: decoder)
            self = .diceStickersRegular(value)
        case .diceStickersSlotMachine:
            let value = try DiceStickersSlotMachine(from: decoder)
            self = .diceStickersSlotMachine(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .diceStickersRegular(value):
            try container.encode(Kind.diceStickersRegular, forKey: .type)
            try value.encode(to: encoder)
        case let .diceStickersSlotMachine(value):
            try container.encode(Kind.diceStickersSlotMachine, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A regular animated sticker
internal struct DiceStickersRegular: Codable {
    /// The animated sticker with the dice animation
    internal let sticker: Sticker

    internal init(sticker: Sticker) {
        self.sticker = sticker
    }
}

/// Animated stickers to be combined into a slot machine
internal struct DiceStickersSlotMachine: Codable {
    /// The animated sticker with the slot machine background. The background animation must start playing after all reel animations finish
    internal let background: Sticker

    /// The animated sticker with the center reel
    internal let centerReel: Sticker

    /// The animated sticker with the left reel
    internal let leftReel: Sticker

    /// The animated sticker with the lever animation. The lever animation must play once in the initial dice state
    internal let lever: Sticker

    /// The animated sticker with the right reel
    internal let rightReel: Sticker

    internal init(
        background: Sticker,
        centerReel: Sticker,
        leftReel: Sticker,
        lever: Sticker,
        rightReel: Sticker
    ) {
        self.background = background
        self.centerReel = centerReel
        self.leftReel = leftReel
        self.lever = lever
        self.rightReel = rightReel
    }
}
