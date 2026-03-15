#if DEBUG
import Foundation
import SwiftUI

enum ScreenshotSampleData {
    /// Check if the app was launched with `--screenshot-mode`
    static var isScreenshotMode: Bool {
        ProcessInfo.processInfo.arguments.contains("--screenshot-mode")
    }

    /// Populate sample data for screenshot capture.
    /// Call this from the app entry point before UI loads, gated behind `isScreenshotMode`.
    ///
    /// When SwiftData or Core Data models are added, this method should:
    /// 1. Clear existing data from the context
    /// 2. Insert curated sample tarot readings, cards, and spreads
    /// 3. Save the context
    ///
    /// Example usage with SwiftData:
    /// ```
    /// static func populate(context: ModelContext) {
    ///     try? context.delete(model: TarotReading.self)
    ///     for reading in sampleReadings {
    ///         context.insert(reading)
    ///     }
    ///     try? context.save()
    /// }
    /// ```
    static func populate() {
        // TODO: Populate SwiftData/Core Data context once models are added.
        print("[ScreenshotSampleData] Screenshot mode active — sample data would be populated here.")
    }
}
#endif
