import SwiftUI

struct ActionExtensionSuccessView: View {

    @State private var isShowingCreateTagView = false

    let url: String
    let onDoneTap: (() -> Void)?

    var body: some View {
        NavigationView {
            List {
                Text(url)
            }
            .navigationTitle("Success!")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: { onDoneTap?() }, label: {
                        Text("Done")
                            .fontWeight(.semibold)
                            .textCase(.none)
                    })
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

}
