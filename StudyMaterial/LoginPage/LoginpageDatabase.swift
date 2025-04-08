import Foundation
import SwiftData

@Model
class User: Identifiable {
    var id: String
    var email: String
    var password: String

    init( email: String, password: String) {
        self.id = UUID().uuidString
        self.email = email
        self.password = password
    }
}
