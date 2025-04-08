import SwiftUI
import SwiftData

struct AllUsersView: View {
    @Environment(\.modelContext) private var context
    @Query private var users: [User]

    var body: some View {
        NavigationView {
            VStack {
                if users.isEmpty {
                    Text("No users found.")
                        .foregroundColor(.gray)
                } else {
                        ForEach(users, id: \.id) { user in
                            VStack(alignment: .leading) {
                                Text("Email: \(user.email)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                Text("Password: \(user.password)")
                                    .font(.footnote)
                                    .foregroundColor(.red)
                            }
                        }
                        .onDelete(perform: deleteUser)
                }

                Button(action: deleteAllUsers) {
                    Text("Delete All Users")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.top)
            }
            .navigationTitle("All Users")
            .padding()
        }
    }

    func deleteUser(at offsets: IndexSet) {
        for index in offsets {
            context.delete(users[index])
        }
    }

    func deleteAllUsers() {
        for user in users {
            context.delete(user)
        }
    }
}
#Preview {
    AllUsersView()
}
