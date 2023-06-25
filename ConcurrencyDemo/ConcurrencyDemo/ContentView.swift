//
//  ContentView.swift
//  ConcurrencyDemo
//
//  Created by Miguel Chavez on 6/24/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            Task {
                await doSomethingGroup()
            }
        }) {
            Text("Do Something")
        }
    }
    func doSomething() async {
        print("Start \(Date())")
        do {
            try await takesTooLong(delay: 10)
        } catch DurationError.tooShort {
            print("Error: Duration too short")
        } catch DurationError.tooLong {
            print("Error: Duration too long")
        } catch{
            print("Unknown error")
        }
        print("After async-let \(Date())")
        // Additional code to run concurrently
        //print ("result = \(await result)")
        print("End \(Date())")
    }
    
    func takesTooLong(delay: UInt32) async throws {
        if delay < 5 {
            throw DurationError.tooShort
        } else if delay > 20 {
            throw DurationError.tooLong
            
        }
        sleep(delay)
        print("Async task completed at \(Date())")
    }
    
    func doSomethingGroup() async {
        let store = TimeStore()
        await withTaskGroup(of: Void.self) {
            group in for i in 1...5 {
                group.addTask {
                    await store.addStamp(task: i, date: await takesTooLongGroup())
                }
            }
        }
        for (task, date) in await store.timeStamps {
            print("Task = \(task), Date = \(date)")
        }
    }
    
    func takesTooLongGroup() async -> Date {
        sleep(5)
        return Date()
    }
}
enum DurationError: Error {
    case tooLong
    case tooShort
}

//@MainActor
actor TimeStore {
    var timeStamps: [Int: Date] = [:]
    func addStamp(task: Int, date: Date) {
        timeStamps[task] = date
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


