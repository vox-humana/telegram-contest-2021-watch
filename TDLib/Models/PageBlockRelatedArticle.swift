//
//  PageBlockRelatedArticle.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a related article
internal struct PageBlockRelatedArticle: Codable {
    /// Article author; may be empty
    internal let author: String

    internal let description: String

    /// Article photo; may be null
    internal let photo: Photo?

    /// Point in time (Unix timestamp) when the article was published; 0 if unknown
    internal let publishDate: Int

    /// Article title; may be empty
    internal let title: String

    /// Related article URL
    internal let url: String

    internal init(
        author: String,
        description: String,
        photo: Photo?,
        publishDate: Int,
        title: String,
        url: String
    ) {
        self.author = author
        self.description = description
        self.photo = photo
        self.publishDate = publishDate
        self.title = title
        self.url = url
    }
}
