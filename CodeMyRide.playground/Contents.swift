import PlaygroundSupport
import Foundation

//: # CodeMyRide
//: In this Swift Playground, you will learn some programming fundamentals.

let car = Car()

PlaygroundPage.current.liveView = car

car.carLabel.text = "Swifty"

_ = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { timer in
    
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
        car.dayNightButtonLabel.text = "Night"
    }
    else if (!car.isDay && !car.headlightIsOn) {
        car.turnOnHeadlight()
        car.dayNightButtonLabel.text = "Day"
    }
    
}

// explain functions, if, else, else, if, variables
