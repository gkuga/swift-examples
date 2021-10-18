import RxSwift

struct Model {
    private var counter: Int = 0
    private var counterEventSubject = PublishSubject<Int>()

    var event: Observable<Int> { return counterEventSubject }

    mutating func up() {
        counter+=1
        counterEventSubject.onNext(counter)
    }

    mutating func down() {
        counter-=1
        counterEventSubject.onNext(counter)
    }
}

var model = Model()
let disposable = model.event.subscribe(
    onNext: { value in
        print("New state: \(value)")
    },
    onError: { error in
    },
    onCompleted: {
    }
)

main: while true {
    let input = readLine()
    switch input {
        case "exit":
            break main
        case "up":
            model.up()
        case "down":
            model.down()
        default:
            break
    }
}
