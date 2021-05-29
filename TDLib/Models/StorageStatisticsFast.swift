//
//  StorageStatisticsFast.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains approximate storage usage statistics, excluding files of unknown file type
internal struct StorageStatisticsFast: Codable {
    /// Size of the database
    internal let databaseSize: Int64

    /// Approximate number of files
    internal let fileCount: Int

    /// Approximate total size of files
    internal let filesSize: Int64

    /// Size of the language pack database
    internal let languagePackDatabaseSize: Int64

    /// Size of the TDLib internal log
    internal let logSize: Int64

    internal init(
        databaseSize: Int64,
        fileCount: Int,
        filesSize: Int64,
        languagePackDatabaseSize: Int64,
        logSize: Int64
    ) {
        self.databaseSize = databaseSize
        self.fileCount = fileCount
        self.filesSize = filesSize
        self.languagePackDatabaseSize = languagePackDatabaseSize
        self.logSize = logSize
    }
}
