//
//  main.swift
//  SimpleDomainModel
//
//  Created by Ted Neward on 4/6/16.
//  Copyright © 2016 Ted Neward. All rights reserved.
//

import Foundation

print("Hello, World!")

public func testMe() -> String {
  return "I have been tested"
}

open class TestMe {
  open func Please() -> String {
    return "I have been tested"
  }
}

////////////////////////////////////
// Money
//
public struct Money {
  public var amount : Int
  public var currency : String
  
  public func convert(_ to: String) -> Money {
    var converted = 0
    switch (currency,to) {
    case ("USD","GBP"):
        converted = self.amount / 2
    case ("USD", "CAN"):
        converted = Int(Double(self.amount) * 1.25)
    case ("USD", "EUR"):
        converted = Int(Double(self.amount) * 1.5)
    case ("GBP", "USD"):
        converted = self.amount * 2
    case ("CAN", "USD"):
        converted = Int(Double(self.amount) / 1.25)
    case ("EUR", "USD"):
        converted = Int(Double(self.amount) / 1.5)
    default:
        converted = self.amount
    }
    return Money(amount: converted, currency: to)
  }
  
  public func add(_ to: Money) -> Money {
    let converted = self.convert(to.currency)
    let sum = converted.amount + to.amount
    return Money(amount: sum, currency: to.currency)
  }
  public func subtract(_ from: Money) -> Money {
    let converted = self.convert(from.currency)
    let total = from.amount - converted.amount
    return Money(amount: total, currency: from.currency)
    
  }
}

////////////////////////////////////
// Job
//
open class Job {
  fileprivate var title : String
  fileprivate var type : JobType

  public enum JobType {
    case Hourly(Double)
    case Salary(Int)
  }

  public init(title : String, type : JobType) {
    self.title = title
    self.type = type
  }

  open func calculateIncome(_ hours: Int) -> Int {
    switch self.type {
    case .Hourly(let wage):
        return Int(Double(hours) * wage)
    case .Salary(let sal):
        return sal
    }
  }

  open func raise(_ amt : Double) {
    switch self.type {
    case .Hourly(let wage):
        self.type = JobType.Hourly(wage + amt)
    case .Salary(let sal):
        self.type = JobType.Salary(sal + Int(amt))
    }
  }
}

////////////////////////////////////////
////// Person
//////
//open class Person {
//  open var firstName : String = ""
//  open var lastName : String = ""
//  open var age : Int = 0
//
//  fileprivate var _job : Job? = nil
//  open var job : Job? {
//    get { }
//    set(value) {
//    }
//  }
//
//  fileprivate var _spouse : Person? = nil
//  open var spouse : Person? {
//    get { }
//    set(value) {
//    }
//  }
//
//  public init(firstName : String, lastName: String, age : Int) {
//    self.firstName = firstName
//    self.lastName = lastName
//    self.age = age
//  }
//
//  open func toString() -> String {
//  }
//}
//
////////////////////////////////////////
////// Family
//////
//open class Family {
//  fileprivate var members : [Person] = []
//
//  public init(spouse1: Person, spouse2: Person) {
//  }
//
//  open func haveChild(_ child: Person) -> Bool {
//  }
//
//  open func householdIncome() -> Int {
//  }
//}





