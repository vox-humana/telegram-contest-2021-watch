//
//  ImportMessages.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Imports messages exported from another app
internal struct ImportMessages: Codable {
    /// Files used in the imported messages. Only inputFileLocal and inputFileGenerated are supported. The files must not be previously uploaded
    internal let attachedFiles: [InputFile]

    /// Identifier of a chat to which the messages will be imported. It must be an identifier of a private chat with a mutual contact or an identifier of a supergroup chat with can_change_info administrator right
    internal let chatId: Int64

    /// File with messages to import. Only inputFileLocal and inputFileGenerated are supported. The file must not be previously uploaded
    internal let messageFile: InputFile

    internal init(
        attachedFiles: [InputFile],
        chatId: Int64,
        messageFile: InputFile
    ) {
        self.attachedFiles = attachedFiles
        self.chatId = chatId
        self.messageFile = messageFile
    }
}
