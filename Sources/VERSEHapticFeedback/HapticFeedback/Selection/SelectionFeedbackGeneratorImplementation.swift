import UIKit
import VERSE
import Combine

// MARK: - SelectionFeedbackGeneratorImplementation

public final class SelectionFeedbackGeneratorImplementation {
}

// MARK: - SelectionFeedbackGenerator

extension SelectionFeedbackGeneratorImplementation: SelectionFeedbackGenerator {

    public func create(id: AnyHashable) -> Effect<Never, Never> {
        .run { subscriber in
            let generator = UISelectionFeedbackGenerator()
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

    public func selectionChanged(id: AnyHashable) -> Effect<Never, Never> {
        .fireAndForget {
            guard let generator = dependencies[id]?.generator as? UISelectionFeedbackGenerator else {
                return
            }
            generator.selectionChanged()
        }
    }

    public func prepare(id: AnyHashable) -> Effect<Never, Never> {
        .fireAndForget {
            guard let generator = dependencies[id]?.generator as? UISelectionFeedbackGenerator else {
                return
            }
            generator.prepare()
        }
    }
}

private var dependencies: [AnyHashable: Dependency] = [:]
