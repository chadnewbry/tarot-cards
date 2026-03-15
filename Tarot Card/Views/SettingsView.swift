import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("Support") {
                    Button {
                        sendFeedback()
                    } label: {
                        Label("Feedback / Product Suggestions", systemImage: "envelope")
                    }

                    Button {
                        contactSupport()
                    } label: {
                        Label("Contact Support", systemImage: "questionmark.circle")
                    }
                }

                Section("About") {
                    LabeledContent("Version", value: "1.0.0")
                }
            }
            .navigationTitle("Settings")
        }
    }

    private func contactSupport() {
        let email = AppConfig.shared.review?.contactEmail ?? "chad.newbry@gmail.com"
        let subject = "Support: Tarot Card"
        let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? subject
        guard let url = URL(string: "mailto:\(email)?subject=\(encodedSubject)") else { return }
        UIApplication.shared.open(url)
    }

    private func sendFeedback() {
        let email = AppConfig.shared.review?.contactEmail ?? "chad.newbry@gmail.com"
        let subject = "Feedback: Tarot Card"
        let encodedSubject = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? subject
        guard let url = URL(string: "mailto:\(email)?subject=\(encodedSubject)") else { return }
        UIApplication.shared.open(url)
    }
}

#if DEBUG
#Preview {
    SettingsView()
}
#endif
