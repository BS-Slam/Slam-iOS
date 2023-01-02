import Foundation
import FirebaseDatabase

final class DatabaseManager {
    
    static let shared = DatabaseManager()
    private let database = Database.database().reference()
    
    private init() {}
}

// Account Management

extension DatabaseManager {
    
}
