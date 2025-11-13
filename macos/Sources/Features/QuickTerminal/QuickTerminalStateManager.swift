enum QuickTerminalStateManager {
    private static let stateKey = "QuickTerminalState"

    static func save(state: TerminalRestorableState, ghostty: Ghostty.App) throws {

    }

    static func loadState(ghostty: Ghostty.App) -> TerminalRestorableState? {
        guard let data = UserDefaults.standard.data(forKey: stateKey),
              let state = try? NSKeyedUnarchiver.unarchivedObject(
                ofClass: CodableBridge<TerminalRestorableState>.self,
                from: data
              ) else {
            return nil
        }
    }

    static func clearState() {

    }
}
