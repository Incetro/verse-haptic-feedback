import Foundation

// MARK: - HapticFeedback

public struct HapticFeedback {

    // MARK: - Properties

    /// ImpactFeedbackGenerator instance
    public let impact: ImpactFeedbackGenerator

    /// NotificationFeedbackGenerator instance
    public let notification: NotificationFeedbackGenerator

    /// SelectionFeedbackGenerator instance
    public let selection: SelectionFeedbackGenerator

    // MARK: - Initializers

    /// Parametrized initializer
    /// - Parameters:
    ///   - impact: ImpactFeedbackGenerator instance
    ///   - notification: NotificationFeedbackGenerator instance
    ///   - selection: SelectionFeedbackGenerator instance
    public init(
        impact: ImpactFeedbackGenerator,
        notification: NotificationFeedbackGenerator,
        selection: SelectionFeedbackGenerator
    ) {
        self.impact = impact
        self.notification = notification
        self.selection = selection
    }

    /// Default initializer
    public init() {
        self.impact = ImpactFeedbackGeneratorImplementation()
        self.notification = NotificationFeedbackGeneratorImplementation()
        self.selection = SelectionFeedbackGeneratorImplementation()
    }
}
