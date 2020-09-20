//
//  AsyncOperation.swift
//  OBAKit
//
//  Copyright © Open Transit Software Foundation
//  This source code is licensed under the Apache 2.0 license found in the
//  LICENSE file in the root directory of this source tree.
//

import Foundation

/// This is a base class on which you can build other operations that execute asynchronously.
class AsyncOperation: Operation {

    // MARK: - Errors

    var error: Error?

    // MARK: - State Management

    override var isAsynchronous: Bool { return true }

    enum AsyncState: String {
        case ready = "Ready"
        case executing = "Executing"
        case finished = "Finished"

        fileprivate var keyPath: String { return "is" + self.rawValue }
    }

    private var state: AsyncState = .ready {
        willSet {
            willChangeValue(forKey: state.keyPath)
            willChangeValue(forKey: newValue.keyPath)
        }
        didSet {
            didChangeValue(forKey: state.keyPath)
            didChangeValue(forKey: oldValue.keyPath)
        }
    }

    override var isReady: Bool {
        return state == .ready
    }

    override var isExecuting: Bool {
        return state == .executing
    }

    override var isFinished: Bool {
        return state == .finished
    }

    // MARK: - State Actions

    open override func start() {
        guard state == .ready else {
            return
        }

        state = .executing
    }

    internal func finish() {
        guard state != .finished else {
            return
        }

        state = .finished
    }
}
