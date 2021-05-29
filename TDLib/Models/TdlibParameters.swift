//
//  TdlibParameters.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains parameters for TDLib initialization
internal struct TdlibParameters: Codable {
    /// Application identifier hash for Telegram API access, which can be obtained at https://my.telegram.org
    internal let apiHash: String

    /// Application identifier for Telegram API access, which can be obtained at https://my.telegram.org
    internal let apiId: Int

    /// Application version; must be non-empty
    internal let applicationVersion: String

    /// The path to the directory for the persistent database; if empty, the current working directory will be used
    internal let databaseDirectory: String

    /// Model of the device the application is being run on; must be non-empty
    internal let deviceModel: String

    /// If set to true, old files will automatically be deleted
    internal let enableStorageOptimizer: Bool

    /// The path to the directory for storing files; if empty, database_directory will be used
    internal let filesDirectory: String

    /// If set to true, original file names will be ignored. Otherwise, downloaded files will be saved under names as close as possible to the original name
    internal let ignoreFileNames: Bool

    /// IETF language tag of the user's operating system language; must be non-empty
    internal let systemLanguageCode: String

    /// Version of the operating system the application is being run on. If empty, the version is automatically detected by TDLib
    internal let systemVersion: String

    /// If set to true, the library will maintain a cache of users, basic groups, supergroups, channels and secret chats. Implies use_file_database
    internal let useChatInfoDatabase: Bool

    /// If set to true, information about downloaded and uploaded files will be saved between application restarts
    internal let useFileDatabase: Bool

    /// If set to true, the library will maintain a cache of chats and messages. Implies use_chat_info_database
    internal let useMessageDatabase: Bool

    /// If set to true, support for secret chats will be enabled
    internal let useSecretChats: Bool

    /// If set to true, the Telegram test environment will be used instead of the production environment
    internal let useTestDc: Bool

    internal init(
        apiHash: String,
        apiId: Int,
        applicationVersion: String,
        databaseDirectory: String,
        deviceModel: String,
        enableStorageOptimizer: Bool,
        filesDirectory: String,
        ignoreFileNames: Bool,
        systemLanguageCode: String,
        systemVersion: String,
        useChatInfoDatabase: Bool,
        useFileDatabase: Bool,
        useMessageDatabase: Bool,
        useSecretChats: Bool,
        useTestDc: Bool
    ) {
        self.apiHash = apiHash
        self.apiId = apiId
        self.applicationVersion = applicationVersion
        self.databaseDirectory = databaseDirectory
        self.deviceModel = deviceModel
        self.enableStorageOptimizer = enableStorageOptimizer
        self.filesDirectory = filesDirectory
        self.ignoreFileNames = ignoreFileNames
        self.systemLanguageCode = systemLanguageCode
        self.systemVersion = systemVersion
        self.useChatInfoDatabase = useChatInfoDatabase
        self.useFileDatabase = useFileDatabase
        self.useMessageDatabase = useMessageDatabase
        self.useSecretChats = useSecretChats
        self.useTestDc = useTestDc
    }
}
