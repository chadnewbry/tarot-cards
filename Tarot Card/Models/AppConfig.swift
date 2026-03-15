import Foundation

struct AppConfig: Codable {
    let app: App?
    let urls: URLs?
    let review: Review?

    struct App: Codable {
        let name: String?
        let bundleId: String?
        let copyright: String?
    }

    struct URLs: Codable {
        let website: String?
        let privacyPolicy: String?
        let termsOfService: String?
        let support: String?
    }

    struct Review: Codable {
        let demoAccountRequired: Bool?
        let contact: Contact?

        var contactEmail: String? { contact?.email }
    }

    struct Contact: Codable {
        let firstName: String?
        let lastName: String?
        let email: String?
        let phone: String?
    }

    static let shared: AppConfig = {
        guard let url = Bundle.main.url(forResource: "app-config", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let config = try? JSONDecoder().decode(AppConfig.self, from: data) else {
            return AppConfig(app: nil, urls: nil, review: nil)
        }
        return config
    }()
}
