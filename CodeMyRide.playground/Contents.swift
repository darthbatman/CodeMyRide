import PlaygroundSupport
import Foundation

let car = Car()

PlaygroundPage.current.liveView = car

_ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
    if (car.acceleratorPedalSpriteTapped){
        car.speedUp()
    }
    if (car.brakePedalSpriteTapped){
        car.slowDown()
    }
}