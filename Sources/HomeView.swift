import SwiftUI

struct HomeView: View {
    @Environment(Store.self) private var store
    @State private var newList = ""

    var body: some View {
        ZStack {
            Color.appBg.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Text("YOUR LISTS")
                        .font(.caption).bold()
                        .foregroundStyle(Color.appTextSecondary)
                        .padding(.horizontal, 4)
                        .padding(.top, 8)
                    ForEach(store.lists) { list in
                        NavigationLink(value: Route.list(list.id)) {
                            ListRowView(list: list, openCount: store.openCount(listId: list.id))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
            }
        }
        .navigationTitle("AI Note Taker")
        .safeAreaInset(edge: .bottom) {
            HStack(spacing: 10) {
                TextField("New list", text: $newList)
                    .textFieldStyle(.plain)
                    .foregroundStyle(Color.appText)
                    .padding(12)
                    .background(Color.appSurface, in: RoundedRectangle(cornerRadius: 14))
                    .onSubmit { store.addList(newList); newList = "" }
                Button {
                    store.addList(newList); newList = ""
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(Color.appPrimary)
                }
            }
            .padding()
            .background(.ultraThinMaterial)
        }
    }
}

struct ListRowView: View {
    let list: TaskList
    let openCount: Int

    var body: some View {
        HStack(spacing: 14) {
            ZStack {
                RoundedRectangle(cornerRadius: 12).fill(Color(hex: list.colorHex).opacity(0.18))
                Text(list.emoji).font(.system(size: 20))
            }
            .frame(width: 40, height: 40)
            VStack(alignment: .leading, spacing: 2) {
                Text(list.title)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(Color.appText)
                Text(openCount == 0 ? "All done" : "\(openCount) open")
                    .font(.system(size: 13))
                    .foregroundStyle(Color.appTextMuted)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(Color.appTextMuted)
                .font(.system(size: 14, weight: .semibold))
        }
        .padding(14)
        .background(Color.appSurface, in: RoundedRectangle(cornerRadius: 16))
    }
}
