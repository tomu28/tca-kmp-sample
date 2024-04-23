import ComposableArchitecture
import CorePackage
import SwiftUI

public struct AppView: View {
    @Perception.Bindable var store: StoreOf<AppStore>
    public init(store: StoreOf<AppStore>) {
        self.store = store
    }

    public var body: some View {
        WithPerceptionTracking {
            HStack(alignment: .center, spacing: 0) {
                Text("AppView")
            }
        }
    }
}

@Reducer
public struct AppStore {
    @ObservableState
    public struct State {

        public init() {}
    }

    public enum Action {
    }

    public init() {}

    public var body: some ReducerOf<Self> {
        Reduce(self.core)
//            .forEach(\.path, action: \.path)
    }

    func core(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        }
    }
}
