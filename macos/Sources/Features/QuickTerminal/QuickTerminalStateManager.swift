enum QuickTerminalStateManager {
    private static let stateKey = "QuickTerminalState"

    static func save(state: TerminalRestorableState) {
        guard let data = try? NSKeyedArchiver.archivedData(
            withRootObject: CodableBridge(state),
            requiringSecureCoding: true
        ) else {
            return
        }

        UserDefaults.standard.set(data, forKey: stateKey)
    }

    static func loadState() -> TerminalRestorableState? {
        guard let data = UserDefaults.standard.data(forKey: stateKey),
              let bridge = try? NSKeyedUnarchiver.unarchivedObject(
                ofClass: CodableBridge<TerminalRestorableState>.self,
                from: data
              ) else {
            return nil
        }

        return bridge.value
    }

    static func clearState() {
        UserDefaults.standard.removeObject(forKey: stateKey)
    }
}
