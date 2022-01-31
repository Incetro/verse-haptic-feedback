import VERSE
import UIKit
import Combine

// MARK: - ImpactFeedbackGeneratorImplementation

public final class ImpactFeedbackGeneratorImplementation {
}

// MARK: - ImpactFeedbackGenerator

extension ImpactFeedbackGeneratorImplementation: ImpactFeedbackGenerator {

    public func create(id: AnyHashable, style: UIImpactFeedbackGenerator.FeedbackStyle) -> Effect<Never, Never> {
        .run { subscriber in
            let generator = UIImpactFeedbackGenerator(style: style)
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

    public func impactOccurred(id: AnyHashable) -> Effect<Never, Never> {
        .fireAndForget {
            guard let generator = dependencies[id]?.generator as? UIImpactFeedbackGenerator else { return }
            generator.impactOccurred()
        }
    }

    public func impactOccurred(id: AnyHashable, withIntensity intensity: CGFloat) -> Effect<Never, Never> {
        .fireAndForget {
            guard let generator = dependencies[id]?.generator as? UIImpactFeedbackGenerator else { return }
            generator.impactOccurred(intensity: intensity)
        }
    }

    public func prepare(id: AnyHashable) -> Effect<Never, Never> {
        .fireAndForget {
            guard let generator = dependencies[id]?.generator as? UIImpactFeedbackGenerator else { return }
            generator.prepare()
        }
    }
}

private var dependencies: [AnyHashable: Dependency] = [:]
