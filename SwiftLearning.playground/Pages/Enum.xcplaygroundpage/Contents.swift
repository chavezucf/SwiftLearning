import Foundation

enum Animals {
    case Dog, Cat, Bird
}

let dog = Animals.Dog;


enum ShortCut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL, name: String)
    case song(artist: String, name: String)
    
    var name: String {
        switch self {
            case let .fileOrFolder(_, name),
            let .wwwUrl(_, name),
            let .song(_, name):
            return name;
        }
    }
}

let wwwApple = ShortCut.wwwUrl(path: URL(filePath :"http://apple.com"), name: "Apple");

switch wwwApple{
case .fileOrFolder(path: let path, name: let name):
    path
    name
    break
case .wwwUrl(path: let path):
    path
    break
case .song(artist: let artist, name: let name):
    artist
    name
    break
}

switch wwwApple{
case let .fileOrFolder(
    path,
    name
):
    path
    name
    break
case let .wwwUrl(path, _):
    path
    break
case let .song(
    artist,
    name
):
    artist
    name
    break
}


let songCasa = ShortCut.song(artist: "Edgardo Nuñez", name: "Le Compre Casa A Mi Ama")

if case let .song(_, songName) = songCasa {
    songName
}


songCasa.name
wwwApple.name


enum FavoriteEmoji: String, CaseIterable{
    case dog = "🐶"
    case cat = "🐱"
    case car = "🚗"
}

FavoriteEmoji.allCases
FavoriteEmoji.allCases.map(\.rawValue)


indirect enum Fibonacci {
    case zero
    case one
    case next(previous: Fibonacci, current: Fibonacci)
}

func fibonacciNumber(at index: Int) -> Fibonacci {
    if index <= 0 {
        return .zero
    } else if index == 1 {
        return .one
    } else {
        let previous = fibonacciNumber(at: index - 1)
        let current = fibonacciNumber(at: index - 2)
        return .next(previous: previous, current: current)
    }
}

func getFibonacciValue(_ fibonacci: Fibonacci) -> Int {
    switch fibonacci {
    case .zero:
        return 0
    case .one:
        return 1
    case .next(let previous, let current):
        let previousValue = getFibonacciValue(previous)
        let currentValue = getFibonacciValue(current)
        return previousValue + currentValue
    }
}

// Example usage
let fibonacci10 = fibonacciNumber(at: 5)
let fibonacci10Value = getFibonacciValue(fibonacci10)
