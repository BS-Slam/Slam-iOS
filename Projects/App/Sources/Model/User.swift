import Foundation

struct User: Codable{
    let id: String
    let name: String
    let nickName: String
    let profileImageURLString: String
    let feedCount: Int
    let isFollow: Bool
}

extension User {
    static let dummy = User(id: UUID().uuidString,
                            name: "임준화",
                            nickName: "junxhwa",
                            profileImageURLString: "https://instagram.fcgk29-1.fna.fbcdn.net/v/t51.2885-19/44884218_345707102882519_2446069589734326272_n.jpg?_nc_ht=instagram.fcgk29-1.fna.fbcdn.net&_nc_cat=1&_nc_ohc=jqZ-jpn127kAX88UeOp&edm=ABmJApABAAAA&ccb=7-5&ig_cache_key=YW5vbnltb3VzX3Byb2ZpbGVfcGlj.2-ccb7-5&oh=00_AfA3wcDjp_HyW-OBbzUPoiMGqbrSKbyEncfPWpPxefWdzg&oe=63AE498F&_nc_sid=6136e7",
                            feedCount: .random(in: 1...100),
                            isFollow: .random())
}
