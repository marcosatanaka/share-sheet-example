# Hello, DTS!

This project demonstrates the issue I'm having with the Share Sheet. Please use a real device and follow the steps:

1. Run the app.
2. Go to Safari and open any website, such as apple.com.
3. Tap the Share button to open the Share Sheet.
4. Tap the Add URL action.

You can see that the action extension is executed, and the URL is correctly recognized.

Now, do the steps below to reproduce the problem, which is the action not appearing in the Share Sheet:

1. Open another browser, such as Firefox.
2. Find and tap the Share button (on Firefox, it's inside the Page Options Menu button).

You can see that the Add URL action does not appear in the Share Sheet anymore. It should, though, because Firefox is also sharing a URL.

According to my users, this also happens when sharing from other apps such as DuckDuckGo, and Reeder.

Please open the ActionExtension's `Info.plist` file to see how I've configured the `NSExtensionActivationRule` key.

When I configure the `NSExtensionActivationRule` key as `TRUEPREDICATE`, the action appears when sharing anything from any app. It is not what I want, though, because I only want this action to appear when sharing a URL.