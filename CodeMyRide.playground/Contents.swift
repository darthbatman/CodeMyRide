// Rishi Masand (2017)

import PlaygroundSupport
import Foundation
//: # CodeMyRide
//: In this Swift Playground, you will learn some programming fundamentals.
//: We will be using the scene to the right to depict the effects of the code written below.
//: ## Constants, Variables, Classes, and Objects
//: To begin with, we are creating the constant "car" with the keyword "let". A constant stores a value that cannot be changed.
let car = Car()
//: The constant "car" was assigned the value of an object of class "Car"
PlaygroundPage.current.liveView = car
//: Next, we get to name our car. The name of the car is a variable "car.carLabel.text", which means its value can be reassigned. Here, we will assign the name "Swifty" to the car.
car.carLabel.text = "Swifty"
//: In the timer loop below, we will be checking for user interaction in the scene to the right every millisecond.
_ = Timer.scheduledTimer(withTimeInterval: 0.001, repeats: true) { timer in
//: ## Conditionals with if, else, and else if
//: With an "if" statement, we check the condition that follows. If the condition evaluates to true, the code between the curly braces will be executed.
    if (car.acceleratorPedalSpriteTapped){
        car.speedUp()
    }
    
    if (car.brakePedalSpriteTapped){
        car.stop()
        car.turnOnBrakelight()
    }
//: Since there is a possibility the condition in the above if statement can evaluate to false, and we'd like to perfom some action in the case that it does, we can use an "else" statement. With an else statement, there is no need to provide a condition, since the code corresponding to the else statement is executed if the condition in the preceding if statement is evaluated to false.
    else {
        car.turnOffBrakelight()
    }
    if (car.isRaining){
//: ## Functions
//: Functions are used to call other blocks of code that perform an action or series of actions. The function below, "car.turnOnWiper()", turns on the car's windshield wiper.
        car.turnOnWiper()
    }
    else if (car.isWiping) {
//: This next function, "car.turnOffWiper()", turns off the car's windshield wiper.
        car.turnOffWiper()
    }
//: ## More Conditionals
//: In the "if" statement below, there are two conditions, separated by "&&". This character sequence, signifying "AND", means both conditions need to be true for the code in the if statement to be executed. If the separating characters were instead "||", signifying "OR", it would mean either one of the conditions can be true for the code in the if statement to execute.
    if (car.isDay && car.headlightIsOn){
        car.turnOffHeadlight()
        car.dayNightButtonLabel.text = "Night"
    }
//: You may have noticed an "else if" in the code above. It appears again below, and is used in the case of the preceding if statement evaluating false. If that occurs, the condition for the else if can be evaluated.
    else if (!car.isDay && !car.headlightIsOn) {
        car.turnOnHeadlight()
        car.dayNightButtonLabel.text = "Day"
    }
    
}
//: ## Try It Out
//: Now that you understand some of the fundamentals of programming, interact with the scene on the right, using the rain, night/day, brake, and accelerator buttons. Relate their actions and operations with the code written above.
//: ## Instructions
//: * Tap the "Rain" button to toggle rain on and off.
//: * Tap the "Night/Day" button to switch between nighttime and daytime.
//: * Tap the "Accelerator" button (the pedal to the far right), to make the car begin driving.
//: * Tap the "Brake" button (the pedal to the left of the accelerator pedal), to make the car stop.
//: * Turn up the volume to hear background music and sound effects.
//: # Enjoy!
