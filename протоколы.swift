struct IOSCollection {
    var id = 1
}

class Ref<T> {
    var value: T

    init(value: T) {
        self.value = value
    }
}

struct Container<T> {
    var ref: Ref<T>

    init( value: T) {
        ref = Ref(value: value)
    }

    var value: T {
        get {
            return ref.value
        }
        set {
            guard (isKnownUniquelyReferenced(&ref)) else {
                ref = Ref(value: newValue)
                return
            }
            ref.value = newValue
        }
    }
}

var id = IOSCollection()
var contanier1 = Container(value: id)
var contanier2 = contanier1


protocol Hotel {
    init(roomCount: Int)
}

class HotelAlfa: Hotel {
    var roomCount: Int
    required init(roomCount: Int) {
        self.roomCount = roomCount
    }
}

protocol GameDice {
    var numberDice: String { get }
}

extension Int: GameDice {
    var numberDice: String {
        return "Выпало  \(self)  на кубике"
    }
}

let diceCoub = 4 
print(diceCoub.numberDice)

@objc protocol User {
    var username: String {get set}
    @objc optional var email: String {get set}
    func HelloWorld() -> Void
}

class DefaultUser: User {
    var username: String
    init(username: String) {
        self.username = username
    }
    func HelloWorld() -> Void {
        print("Helloy world!")
    }
}

enum Platform {
    case ios, android, web
}

protocol CodeProtocol {
    var time: Int64 {get set}
    var amountCode: Int {get set}
    func writeCode(platform: Platform, numberOfSpecialist: Int) -> Void
}

protocol CodeStop {
    func stopCoding() -> Void
}


class Company : CodeProtocol, CodeStop {
    var time: Int64 = 0
    var amountCode: Int = 0
    func writeCode(platform: Platform, numberOfSpecialist: Int) -> Void {
        print("разработка началась. пишем код ", terminator: "")
        print(platform)
    }
    func stopCoding() -> Void {
        print("работа закончена. Сдаю в тестирование")
    }
    
}

var company: Company = Company()
var platform: Platform = Platform.ios
company.writeCode(platform: platform, numberOfSpecialist: 5)
company.stopCoding()
