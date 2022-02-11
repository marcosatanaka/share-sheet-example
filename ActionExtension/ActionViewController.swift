import UIKit
import SwiftUI
import MobileCoreServices
import UniformTypeIdentifiers

class ActionViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var tagsButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let inputItem = extensionContext?.inputItems.first as? NSExtensionItem else {
            setupError(title: "Could not add to Play", subtitle: "Didn't received input item from action.")
            return
        }
        guard let itemProvider = inputItem.attachments?.first else {
            setupError(title: "Could not add to Play", subtitle: "Didn't received attachments from input item.")
            return
        }

        if itemProvider.canLoadObject(ofClass: URL.self) {
            itemProvider.loadItem(forTypeIdentifier: UTType.url.identifier, completionHandler: onLoadVideoURL)
        } else if itemProvider.canLoadObject(ofClass: String.self) {
            itemProvider.loadItem(forTypeIdentifier: UTType.plainText.identifier, completionHandler: onLoadVideoURL)
        } else {
            setupError(title: "Could not add to Play", subtitle: "This action only supports URL and String.")
        }
    }

    @objc private func onLoadVideoURL(dict: NSSecureCoding?, error: Error?) {
        let url = dict.debugDescription
        setupSuccess(title: "Success!", subtitle: "Video was added to Play.", url: url)
    }

    @IBAction func done() {
        // Return any edited content to the host app.
        // This template doesn't do anything, so we just echo the passed in items.
        self.extensionContext!.completeRequest(returningItems: self.extensionContext!.inputItems, completionHandler: nil)
    }

    private func setupError(title: String, subtitle: String) {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = true
            self.imageView.image = UIImage(systemName: "xmark.circle.fill")
            self.imageView.isHidden = false
            self.subtitleLabel.text = subtitle
        }
    }

    private func setupSuccess(title: String, subtitle: String, url: String) {
        DispatchQueue.main.async {
            let successView = ActionExtensionSuccessView(url: url, onDoneTap: self.closeActionExtension)
            if let window = self.view.window {
                window.rootViewController = UIHostingController(rootView: successView)
            }
        }
    }

    private func closeActionExtension() {
        self.extensionContext!.completeRequest(returningItems: self.extensionContext!.inputItems, completionHandler: nil)
    }

}
