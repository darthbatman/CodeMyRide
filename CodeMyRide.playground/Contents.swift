import PlaygroundSupport
import Foundation

let car = Car()

PlaygroundPage.current.liveView = car

_ = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { timer in
    
//: # CodeMyRide
//: In this Swift Playground, you will learn some programming fundamentals.
    
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
    if (car.isDay && car.headlightIsOn){
        car.turnOffHeadlight()
    }
    else if (!car.isDay && !car.headlightIsOn) {
        car.turnOnHeadlight()
    }
    
}

// explain functions, if, else, else, if
