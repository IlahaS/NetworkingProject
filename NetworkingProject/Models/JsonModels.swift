

import Foundation
import UIKit

//MARK: - Post
struct Post: Codable {
    let userID: Int?
    let id: Int?
    let title: String?
    let body: String?
}

//MARK: - Album
struct Album: Codable {
    let userID: Int?
    let id: Int?
    let title: String?
}

//MARK: - Photo
struct Photo: Codable {
    let albumID: Int?
    let id: Int?
    let title: String?
    let url: String?
    let thumbnailURL: String?
}

//MARK: - User
struct User: Codable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
}

//MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
    
    var formattedAddress: String {
        var addressComponents = [String]()
        if let street = self.street {
            addressComponents.append(street)
        }
        if let suite = self.suite {
            addressComponents.append(suite)
        }
        if let city = self.city {
            addressComponents.append(city)
        }
        if let zipcode = self.zipcode {
            addressComponents.append(zipcode)
        }
        return addressComponents.joined(separator: ", ")
    }
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String?
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String?
}

//MARK: - Comments
struct Comment: Codable {
    let postId: Int?
    let id: Int?
    let name: String?
    let email: String?
    let body: String?
}

