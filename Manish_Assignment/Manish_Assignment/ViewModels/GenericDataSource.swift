//
//  GenericDataSource.swift
//  Manish_Assignment
//
//  Created by Manish Mahajan on 10/06/20.
//  Copyright © 2020 Manish Mahajan. All rights reserved.
//

import Foundation
import UIKit

class DynamicValue<T> {
    
    typealias CompletionHandler = ((T) -> Void)
    
    var value : T {
        didSet {
            self.notify()
        }
    }
    
    var copiedValue : T {
        didSet {
        }
    }
    
    private var observers = [String: CompletionHandler]()
    
    init(_ value: T) {
        self.value = value
        self.copiedValue = value
    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    public func addAndNotify(observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    private func notify() {
        observers.forEach({ $0.value(value) })
    }
    
    deinit {
        observers.removeAll()
    }
}

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
    var controller: UIViewController = UIViewController()
}
