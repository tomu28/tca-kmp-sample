import ComposableArchitecture
import CorePackage
import SwiftUI
import shared

public struct AppView: View {
    @Perception.Bindable var store: StoreOf<AppStore>
    public init(store: StoreOf<AppStore>) {
        self.store = store
    }

    public var body: some View {
        WithPerceptionTracking {
            VStack(alignment: .center, spacing: 12) {
                Text("AppView")
                Text("Current Step: \(store.step)")
                Button("Next Step") {
                    store.send(.nextStep)
                }
                Button("Back Step") {
                    store.send(.backStep)
                }
            }
            .onAppear {
                store.send(.onAppear)
            }
        }
    }
}

@Reducer
public struct AppStore {
    public init() {}

    @ObservableState
    public struct State {
        var step: SampleStep = .step1

        public init() {}
    }

    public enum Action {
        case onAppear
        case getFlowState
        case nextStep
        case backStep
        case updateStep(step: SampleStep)
    }

    public var body: some ReducerOf<Self> {
        Reduce(self.core)
    }

    func core(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .onAppear:
            return .send(.getFlowState)
        case .getFlowState:
            return .run { send in
                for await value in getCurrentStep() {
                    await send(.updateStep(step: value))
                }
            }
        case .nextStep:
            nextStep()
            return .none
        case .backStep:
            backStep()
            return .none
        case let .updateStep(step: step):
            state.step = step
            return .none
        }
    }
}
