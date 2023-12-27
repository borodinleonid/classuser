class User {
    var username: String
    private var password: String
    private var isLoggedIn: Bool
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
        self.isLoggedIn = false
    }
    
    func authenticate(inputUsername: String, inputPassword: String) -> Bool {
        if inputUsername == username && inputPassword == password {
            isLoggedIn = true
            print("Login successful! Welcome, \(username).")
            return true
        } else {
            print("Invalid credentials. Login failed.")
            return false
        }
    }
    
    func logout() {
        isLoggedIn = false
        print("Logged out successfully.")
    }
    
    func getIsLoggedIn() -> Bool {
        return isLoggedIn
    }
}

class UserDatabase {
    var users: [String: User]
    
    init() {
        self.users = [:]
    }
    
    func addUser(username: String, password: String) {
        users[username] = User(username: username, password: password)
        print("User \(username) registered successfully.")
    }
    
    func login(username: String, password: String) {
        if let user = users[username] {
            _ = user.authenticate(inputUsername: username, inputPassword: password)
        } else {
            print("User not found. Login failed.")
        }
    }
    
    func logout(username: String) {
        if let user = users[username] {
            user.logout()
        } else {
            print("User not found.")
        }
    }
}

let userDB = UserDatabase()
