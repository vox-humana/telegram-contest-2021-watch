import Foundation

// https://core.telegram.org/api/files#image-thumbnail-types
public struct PhotoSize: Hashable {
    public let type: String
    public let width: Int
    public let height: Int
    public let photo: File
}

// https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1photo.html
public struct Photo: Hashable {
    public let minithumbnail: MiniThumbnail?
    public let sizes: [PhotoSize]
}

import UIKit

public struct MiniThumbnail: Hashable {
    public let width: Int
    public let height: Int
    public let image: UIImage
}

extension Photo: JSONDecodable {
    public init(json: JSON) {
        json.checkType("photo")
        sizes = json.unwrapArray("sizes")
        if let thumbnail = json["minithumbnail"] as? JSON {
            minithumbnail = MiniThumbnail(json: thumbnail)
        } else {
            minithumbnail = nil
        }
    }
}

extension PhotoSize: JSONDecodable {
    public init(json: JSON) {
        json.checkType("photoSize")
        type = json.unwrap("type")
        width = json.unwrap("width")
        height = json.unwrap("height")
        photo = File(json: json.unwrap("photo"))
    }
}

extension MiniThumbnail {
    init?(json: JSON) {
        json.checkType("minithumbnail")
        width = json.unwrap("width")
        height = json.unwrap("height")
        let dataString: String = json.unwrap("data")
        guard
            let data = Data(base64Encoded: dataString),
            let image = UIImage(data: data)
        else {
            return nil
        }
        self.image = image
    }
}

/*
 "content": {
 "@type": "messagePhoto",
 "photo": {
   "@type": "photo",
   "has_stickers": false,
   "minithumbnail": {
     "@type": "minithumbnail",
     "width": 40,
     "height": 36,
     "data": "/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDACgcHiMeGSgjISMtKygwPGRBPDc3PHtYXUlkkYCZlo+AjIqgtObDoKrarYqMyP/L2u71////m8H////6/+b9//j/2wBDASstLTw1PHZBQXb4pYyl+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj4+Pj/wAARCAAkACgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDWGefrTGZVjJYgD1JqrHfB0DYXJPIBJIqNpBPHhnAVhyCDxzSAjnuYpVkTzQWB4rNfrWgsMSsxKowCjnaevNNMSOG+UA7Mj5T1/wA/zpWHczqKty2iRoWM4yBwMdaKLAV47qWP/VkKT6CrMUlxI5BkA+Qt0qtb27TBmBG1euTT2DQk8ksRj8P8ihgTmSd7pYfMxk9PSpL0z2zARvhQPXnrVFXdHDhTkHIp0001w24gkEY4HFGo9CVmeS2d5W3FcEce+KKqsZAhBUgdCcUU7CHx3LxJtUIRjuoNH2uRnV8KChyMLiiimIkOozlCPlx06e2KjjvJ4QFjfAXp8ooooAJL24mUpJJlT1GAKKKKAP/Z"
   },
   "sizes": [
     {
       "@type": "photoSize",
       "type": "m",
       "photo": {
         "@type": "file",
         "id": 13,
         "size": 31047,
         "expected_size": 31047,
         "local": {
           "@type": "localFile",
           "path": "",
           "can_be_downloaded": true,
           "can_be_deleted": false,
           "is_downloading_active": false,
           "is_downloading_completed": false,
           "download_offset": 0,
           "downloaded_prefix_size": 0,
           "downloaded_size": 0
         },
         "remote": {
           "@type": "remoteFile",
           "id": "AgACAgIAAx0CQYXjFwACBRNgqjKYFBMeqJqpYS95YYR1PFGX7gACb7IxG_1RUUkqTD3ZYy5rLpBOC6QuAAMBAAMCAANtAAOqbQEAAR8E",
           "unique_id": "AQADkE4LpC4AA6ptAQAB",
           "is_uploading_active": false,
           "is_uploading_completed": true,
           "uploaded_size": 31047
         }
       },
       "width": 320,
       "height": 286,
       "progressive_sizes": []
     },
     {
       "@type": "photoSize",
       "type": "x",
       "photo": {
         "@type": "file",
         "id": 14,
         "size": 46174,
         "expected_size": 46174,
         "local": {
           "@type": "localFile",
           "path": "",
           "can_be_downloaded": true,
           "can_be_deleted": false,
           "is_downloading_active": false,
           "is_downloading_completed": false,
           "download_offset": 0,
           "downloaded_prefix_size": 0,
           "downloaded_size": 0
         },
         "remote": {
           "@type": "remoteFile",
           "id": "AgACAgIAAx0CQYXjFwACBRNgqjKYFBMeqJqpYS95YYR1PFGX7gACb7IxG_1RUUkqTD3ZYy5rLpBOC6QuAAMBAAMCAAN4AAOrbQEAAR8E",
           "unique_id": "AQADkE4LpC4AA6ttAQAB",
           "is_uploading_active": false,
           "is_uploading_completed": true,
           "uploaded_size": 46174
         }
       },
       "width": 529,
       "height": 472,
       "progressive_sizes": [
         3997,
         10972,
         18890,
         27903
       ]
     }
   ]
 },
 "caption": {
   "@type": "formattedText",
   "text": "u042f u0432u0447u0435u0440u0430 u0432u043au043bu044eu0447u0438u043bu0430 u0415u0432u0440u043eu0432u0438u0434u0435u043du0438u0435 u0430u043au043au0443u0440u0430u0442 u0432u043e u0432u0440u0435u043cu044f u0432u044bu0441u0442u0443u043fu043bu0435u043du0438u044f u0431u0440u0438u0442u0430u043du0441u043au043eu0433u043e u043fu0435u0432u0446u0430 u0438 u0432u0441u0435 u0432u0440u0435u043cu044f u0434u0443u043cu0430u043bu0430: u00abu0427u0442u043e-u0442u043e u043eu043d u0440u0430u0437u0432u043eu043bu043du043eu0432u0430u043bu0441u044f, u0433u043eu043bu043eu0441 u0437u0432u0443u0447u0438u0442 u0441u043bu0430u0431u0435u043du044cu043au043eu00bb. u041eu0447u0435u0432u0438u0434u043du043e, u0443 u043eu0441u0442u0430u043bu044cu043du044bu0445 u0431u044bu043bu0438 u0442u0435 u0436u0435 u043cu044bu0441u043bu0438: u0443u0436u0435 u043fu043eu0434u043eu0441u043fu0435u043bu0430 u043au0443u0447u0430 u043cu0435u043cu043eu0432 u043fu0440u043e 0 u0431u0430u043bu043bu043eu0432 u0443 u0411u0440u0438u0442u0430u043du0438u0438. u0412u043eu0442 u043cu043eu0439 u043bu044eu0431u0438u043cu044bu0439 ud83dude05",
   "entities": []
 },
 "is_secret": false

 */
