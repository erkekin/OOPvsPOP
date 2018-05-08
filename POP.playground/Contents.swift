
import UIKit

protocol Vehicle{
    var capacity:Int {get set}
    func startMoving()
    func stopMoving()
    
    func startStop() // is common in all vehicles

}

extension Vehicle{
    func startStop(){
        startMoving()
        stopMoving()
    }
    func checkSystem(){
        print("Checking motors")
        startStop()
        print("Motors checked 🏳️‍🌈")
    }
}

extension Landable where Self : Bike{
    func park(){
        print("Finding a nice place to park the Bike")
        stopMoving()
        print("Bike parked.")
    }
}
protocol Flyable: Vehicle{
    var canTakeOffVertically:Bool {get set}
}

protocol Landable: Vehicle{
    var wheels:[String] {get set}
}

class Helicopter: Flyable{
    var canTakeOffVertically: Bool = true
    var capacity: Int = 9
    var noOfProppellers = 8
    
    func startMoving() {
        print("Helicoper has started running.")
    }
    
    func stopMoving() {
        print("Helicoper has stopped running.")
    }
}

class Bike: Landable{
    var wheels = ["front","back"]
    
    var capacity: Int = 2
    
    func startMoving() {
        print("Bike has started running.")
    }
    
    func stopMoving() {
        print("Bike has stopped running.")
    }
    func checkSystem() {
        print("Bike checked system")
    }
}

extension Bike:CustomStringConvertible{
    var description: String{return "🚲"}
}

extension Helicopter:CustomStringConvertible{
    var description: String{return "🚁"}
}

let 🚁 = Helicopter()
let 🚲 = Bike()

let vehicles: [Optional<Vehicle>] = [🚁, 🚲]
vehicles.forEach{$0!.startStop()}


extension Array where Element == Vehicle?{
    func startStop(){
        self.forEach{$0!.checkSystem()}
    }
}

vehicles.startStop()
🚲.park()

