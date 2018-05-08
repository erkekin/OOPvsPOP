//: Playground - noun: a place where people can play

import UIKit

class Vehicle{
    let capacity:Int
    func startMoving(){
        print("Vehicle has started moving") // cogu zaman buna ihtiyacın olmaz.  Ama duplike kod da istemezsin. Ortak bir yerde kod durması gerekir. ya da imzası
    }
    
    func stopMoving(){
        print("Vehicle has stopped moving")
    }
    
    func startStop(){
        startMoving()
        stopMoving()
    }
    
    func checkSystem(){
        print("Checking motors")
        startStop()
        print("Motors checked 🏳️‍🌈")
    }
    
    init(capacity:Int) {
        self.capacity = capacity
    }
}

class LandVehicle: Vehicle{
    func checkWheels(){
        print("Checking wheels")
    }
    override func checkSystem(){
        
        super.checkSystem()
        checkWheels()
    }
    
    override func startMoving(){
        print("LandVehicle has started moving")
    }
}

class Bike: LandVehicle{
    
    
}

class FlyingVehicle: Vehicle{
    let canTakeOffVertically:Bool
    func checkPropellers(){
        print("Checking propellers")
    }
    init(canTakeOffVertically:Bool, capacity:Int) {
        self.canTakeOffVertically = canTakeOffVertically
        super.init(capacity: capacity)
    }
    override func checkSystem(){
        super.checkSystem()
        checkPropellers()
    }
    override func startMoving(){
        print("FlyingVehicle has started moving")
    }
    
}

class Helicopter: FlyingVehicle{
    var noOfProppellers = 8
}





let vehicle = Vehicle(capacity: 3) // bunu cogu zaman yapmazsin
let 🚲 = Bike(capacity: 2)

let flyingVehicle = FlyingVehicle(canTakeOffVertically: true, capacity: 6)
let 🚁 = Helicopter(canTakeOffVertically: true, capacity: 6)
🚁.noOfProppellers = 16

let vehicles: [Vehicle] = [vehicle, 🚲, flyingVehicle, 🚁]
vehicles.forEach{$0.checkSystem()}


// structlarda inheritance yoktur POP
// override etmeyi unutabilirsin. (fatalError ile engelliyorlar) ama POP ta uyariyor.
// eger superclass i tek basina hicbir yerde kullanmayacaksan POP
// delegate metodlari ayniysa extensiona koy Berkin yaptığı çözümü nasıl POP ile kolaylaştırdım.
// OOP kullanmak agility yi azaltiyor. Tasarim degisikligi ya da refactoring zorlasiyor.
// POP daha moduler
// OOP de multiple inheritance yok. birsey birden fazla supere sahip olamiyor.
// wisdom: ikisini bir arada kullanmak!

// OOP support super calls. which POP can not !!! Extensions can add new functionality to a type, but they cannot override existing functionality.
// OOP super classes are also usable, altough not used regularly

