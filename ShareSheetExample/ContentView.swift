import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("This project demonstrates the issue I'm having with the Share Sheet. Please use a real device and follow the steps:").textCase(.none).fixedSize(horizontal: false, vertical: true),
                        footer: Text("You can see that the action extension is executed, and the URL is correctly recognized.").fixedSize(horizontal: false, vertical: true)) {
                    Text("**1.** Run the app.")
                    Text("**2.** Go to Safari and open any website, such as apple.com.")
                    Text("**3.** Tap the Share button to open the Share Sheet.")
                    Text("**4.** Tap the Add URL action.")
                }

                Section(header: Text("Now, do the steps below to reproduce the problem, which is the action not appearing in the Share Sheet:").textCase(.none).fixedSize(horizontal: false, vertical: true),
                        footer: Text("You can see that the Add URL action does not appear in the Share Sheet anymore. It should, though, because Firefox is also sharing a URL.\n\nAccording to my users, this also happens when sharing from other apps such as DuckDuckGo, and Reeder.\n\nPlease open the ActionExtension's Info.plist file to see how I've configured the NSExtensionActivationRule key.\n\nWhen I configure the NSExtensionActivationRule key as TRUEPREDICATE, the action appears when sharing anything from any app. It is not what I want, though, because I only want this action to appear when sharing a URL.").fixedSize(horizontal: false, vertical: true)) {
                    Text("**1.** Open another browser, such as Firefox.")
                    VStack(alignment: .leading, spacing: 8) {
                        Text("**2.** Find and tap the Share button.")
                        Text("(on Firefox, it's inside the Page Options Menu button).").font(.subheadline).foregroundColor(.secondary)
                    }
                }
            }.navigationTitle("Hello, DTS!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
