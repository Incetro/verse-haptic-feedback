import UIKit
import VERSE

// MARK: - Dependency

struct Dependency {
    let generator: UIFeedbackGenerator
    let subscriber: Effect<Never, Never>.Subscriber
}
