//
//  MessageSendOptions.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Options to be used when a message is sent
internal struct MessageSendOptions: Codable {
    /// Pass true to disable notification for the message
    internal let disableNotification: Bool

    /// Pass true if the message is sent from the background
    internal let fromBackground: Bool

    /// Message scheduling state. Messages sent to a secret chat, live location messages and self-destructing messages can't be scheduled
    internal let schedulingState: MessageSchedulingState

    internal init(
        disableNotification: Bool,
        fromBackground: Bool,
        schedulingState: MessageSchedulingState
    ) {
        self.disableNotification = disableNotification
        self.fromBackground = fromBackground
        self.schedulingState = schedulingState
    }
}
