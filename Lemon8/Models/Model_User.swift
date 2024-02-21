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
    var posts : [PostEntity]
    var avatar: String
    
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
        case posts
        case avatar
    }
    
    init(
        id: String?,
        name: String?,
        username: String?,
        email: String?,
        biography: String?,
        gender: Gender?,
        age: Int?, 
        area: String?,
        tiktok: String?,
        instagram: String?,
        twitter: String?,
        youtube: String?,
        yourWebsite: String?,
        followers: [UserEntity]?,
        followings: [UserEntity]?,
        posts: [PostEntity]?,
        avatar: String?) {
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
        self.posts = posts ?? []
        self.avatar = avatar ?? "https://firebasestorage.googleapis.com/v0/b/lemon8-c4d22.appspot.com/o/gradient_avatar.png?alt=media&token=44c40896-ffaf-40cd-bb43-4f25583a16bf"
    }
}
