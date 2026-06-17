import SwiftUI

@main
struct AINoteTakerApp: App {
    @State private var store = Store()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(store)
                .preferredColorScheme(.dark)
                .tint(.appPrimary)
        }
    }
}

struct RootView: View {
    var body: some View {
        NavigationStack {
            HomeView()
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .list(let id): ListDetailView(listId: id)
                    case .task(let id): TaskDetailView(taskId: id)
                    }
                }
        }
    }
}
