import ReSwift

struct AppState {
    var counter: Int = 0
}

struct CounterActionIncrease: Action {}
struct CounterActionDecrease: Action {}

let mainStore = Store<AppState>(
    reducer: counterReducer,
    state: nil
)

func counterReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    
    switch action {
    case _ as CounterActionIncrease:
        state.counter += 1
    case _ as CounterActionDecrease:
        state.counter -= 1
    default:
        break
    }
    
    return state
}


class Controller: StoreSubscriber {
    typealias StoreSubscriberStateType = AppState
    
    init() {
        mainStore.subscribe(self)
    }
    
    func newState(state: AppState) {
        print("New state: \(mainStore.state.counter)")
    }
    
    func down() {
        mainStore.dispatch(CounterActionDecrease());
    }
    func up() {
        mainStore.dispatch(CounterActionIncrease());
    }

}

let controller = Controller()

main: while true {
    let input = readLine()
    switch input {
        case "exit":
            break main
        case "up":
            controller.up()
        case "down":
            controller.down()
        default:
            break
    }
}
