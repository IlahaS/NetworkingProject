
protocol DisplayableItem {
    var displayTitle: String? { get }
    var additionalInfo: String? { get }
}

extension Post: DisplayableItem {
    var displayTitle: String? { return self.title }
    var additionalInfo: String? {
        guard let postId = self.id, let userId = self.userID else {
            return nil
        }
        return "Post ID: \(postId)\nUser ID: \(userId)\nBody: \(self.body ?? "")"
    }
}

extension Album: DisplayableItem {
    var displayTitle: String? { return self.title }
    var additionalInfo: String? {
        guard let albumId = self.id, let userId = self.userID else {
            return nil
        }
        return "Album ID: \(albumId)\nUser ID: \(userId)"
    }
}

extension Photo: DisplayableItem {
    var displayTitle: String? { return self.title }
    var additionalInfo: String? {
        return "Album ID: \(self.albumID ?? 0)\nPhoto ID: \(self.id ?? 0)\nURL: \(self.url ?? "")\nThumbnail URL: \(self.thumbnailURL ?? "")"
    }
}

extension User: DisplayableItem {
    var displayTitle: String? { return self.name }
    var additionalInfo: String? {
        let addressString = [self.address?.street, self.address?.suite, self.address?.city].compactMap { $0 }.joined(separator: ", ")
        let companyInfo = "\(self.company?.name ?? ""), \(self.company?.catchPhrase ?? "")"
        return "User ID: \(self.id ?? 0)\nEmail: \(self.email ?? "")\nAddress: \(addressString)\nPhone: \(self.phone ?? "")\nWebsite: \(self.website ?? "")\nCompany: \(companyInfo)"
    }
}

extension Comment: DisplayableItem {
    var displayTitle: String? { return self.name }
    
    var additionalInfo: String? {
        guard let commentId = self.id, let postId = self.postId else {
            return nil
        }
        return "Comment ID: \(commentId)\nPost ID: \(postId)\nEmail: \(self.email ?? "")"
    }
}

