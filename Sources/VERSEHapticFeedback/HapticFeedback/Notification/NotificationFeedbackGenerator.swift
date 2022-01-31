import VERSE
import UIKit

// MARK: - NotificationFeedbackGenerator

public protocol NotificationFeedbackGenerator {

    /// Creates a notification feedback generator
    ///
    /// A notification feedback generator must be first created before you can use its functionality
    func create(id: AnyHashable) -> Effect<Never, Never>

    /// Destroys a currently running notification feedback generator
    ///
    /// In is good practice to destroy a notification feedback generator once you are done with it, such as
    /// when you leave a screen or no longer need its functionality
    func destroy(id: AnyHashable) -> Effect<Never, Never>

    /// Triggers the given notification type
    func notificationOccurred(id: AnyHashable, type: UINotificationFeedbackGenerator.FeedbackType) -> Effect<Never, Never>

    /// Prepare feedback generation
    func prepare(id: AnyHashable) -> Effect<Never, Never>
}
