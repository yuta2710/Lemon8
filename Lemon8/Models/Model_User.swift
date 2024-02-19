import Foundation

enum Gender: String, Codable {
    case Male,
         Female,
         ThirdGender,
         Androgynous
}

struct UserEntity: Codable {
    var id: String
    var name: String
    var username: String
    var email: String
    var biography: String
    var gender: Gender
    var age: Int
    var area: String
    var tiktok: String
    var instagram: String
    var twitter: String
    var youtube: String
    var yourWebsite: String
    var followers: [UserEntity]
    var followings: [UserEntity]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case email
        case biography
        case gender
        case age
        case area
        case tiktok
        case instagram
        case twitter
        case youtube
        case yourWebsite
        case followers
        case followings
    }
    
    init(id: String?, name: String?, username: String?, email: String?, biography: String?,
         gender: Gender?, age: Int?, area: String?, tiktok: String?,
         instagram: String?, twitter: String?, youtube: String?,
         yourWebsite: String?, followers: [UserEntity]?, followings: [UserEntity]?) {
        self.id = id ?? ""
        self.name = name ?? "N/A"
        self.username = username ?? "N/A"
        self.email = email ?? "N/A"
        self.biography = biography ?? "N/A"
        self.gender = gender ?? Gender.Male
        self.age = age ?? 18
        self.area = area ?? "N/A"
        self.tiktok = tiktok ?? "www.tiktok.com/@"
        self.instagram = instagram ?? "www.instagram.com/"
        self.twitter = twitter ?? "www.twitter.com/"
        self.youtube = youtube ?? "wwww.youtube.com"
        self.yourWebsite = yourWebsite ?? "N/A"
        self.followers = followers ?? []
        self.followings = followings ?? []
    }
}
