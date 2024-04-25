import AppFeature
import ComposableArchitecture
import SwiftUI

@main
struct MobileApp: App {
    var body: some Scene {
        WindowGroup {
            AppView(
                store: Store(
                    initialState: AppStore.State()
                ) {
                    AppStore()
                }
            )
        }
    }
}
