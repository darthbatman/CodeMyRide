import PlaygroundSupport
import Foundation

let car = Car()

PlaygroundPage.current.liveView = car

_ = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
    if (car.acceleratorPedalSpriteTapped){
        car.speedUp()
    }
    if (car.brakePedalSpriteTapped){
        car.stop()
        car.turnOnBrakelight()
    }
    else {
        car.turnOffBrakelight()
    }
    if (car.isRaining){
        car.turnOnWiper()
    }
    else if (car.isWiping) {
        car.turnOffWiper()
    }
    if (car.isDay){
        car.turnOffHeadlight()
    }
    else {
        car.turnOnHeadlight()
    }
}