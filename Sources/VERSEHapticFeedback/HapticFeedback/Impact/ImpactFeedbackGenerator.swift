import VERSE
import UIKit

// MARK: - ImpactFeedbackGenerator

public protocol ImpactFeedbackGenerator {

    /// Creates an impact feedback generator
    ///
    /// An impact feedback generator must be first created before you can use its functionality
    func create(id: AnyHashable, style: UIImpactFeedbackGenerator.FeedbackStyle) -> Effect<Never, Never>

    /// Destroys a currently running impact feedback generator
    ///
    /// In is good practice to destroy an impact feedback generator once you are done with it, such as
    /// when you leave a screen or no longer need its functionality
    func destroy(id: AnyHashable) -> Effect<Never, Never>

    /// Triggers impact event
    func impactOccurred(id: AnyHashable) -> Effect<Never, Never>

    /// Triggers impact event with the given intensity value
    func impactOccurred(id: AnyHashable, withIntensity intensity: CGFloat) -> Effect<Never, Never>

    /// Prepare feedback generation
    func prepare(id: AnyHashable) -> Effect<Never, Never>
}
