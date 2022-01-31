import VERSE
import UIKit
import Combine

// MARK: - NotificationFeedbackGeneratorImplementation

public final class NotificationFeedbackGeneratorImplementation {
}

// MARK: - NotificationFeedbackGenerator

extension NotificationFeedbackGeneratorImplementation: NotificationFeedbackGenerator {

    public func create(id: AnyHashable) -> Effect<Never, Never> {
        .run { subscriber in
            let generator = UINotificationFeedbackGenerator()
            dependencies[id] = Dependency(
                generator: generator,
                subscriber: subscriber
            )
            return AnyCancellable {
                dependencies[id] = nil
            }
        }
    }

    public func destroy(id: AnyHashable) -> Effect<Never, Never> {
        .fireAndForget {
            dependencies[id]?.subscriber.send(completion: .finished)
            dependencies[id] = nil
        }
    }

    public func notificationOccurred(id: AnyHashable, type: UINotificationFeedbackGenerator.FeedbackType) -> Effect<Never, Never> {
        .fireAndForget {
            guard let generator = dependencies[id]?.generator as? UINotificationFeedbackGenerator else {
                return
            }
            generator.notificationOccurred(type)
        }
    }

    public func prepare(id: AnyHashable) -> Effect<Never, Never> {
        .fireAndForget {
            guard let generator = dependencies[id]?.generator as? UINotificationFeedbackGenerator else {
                return
            }
            generator.prepare()
        }
    }
}

private var dependencies: [AnyHashable: Dependency] = [:]
