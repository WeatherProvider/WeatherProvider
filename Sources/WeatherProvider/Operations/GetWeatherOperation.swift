import Foundation
import GeohashKit

class GetWeatherRecord {
    var geohash: Geohash
    var provider: WXPProvider.Type

    var location: Location

    /// - parameter geohash: The Geohash associated with the Provider.
    /// - parameter provider: The Provider responsible for the Geohash.
    /// - parameter location: The location where to lookup the weather information.
    init(geohash: Geohash, provider: WXPProvider.Type, location: Location) {
        self.geohash = geohash
        self.provider = provider
        self.location = location
    }
}

class GetWeatherOperation<Success>: AsyncOperation {
    var result: Result<Success, WXPError>?
}

class GetWeather<Type>: AsyncOperation {
    fileprivate var opQueue: OperationQueue
    fileprivate(set) var queue: [GetWeatherOperation<Type>] = []

    var result: Result<Type, WXPError>?

    init(operations: [GetWeatherOperation<Type>]) {
        self.opQueue = OperationQueue()
        self.opQueue.maxConcurrentOperationCount = 1

        self.queue = operations
    }

    override func start() {
        super.start()

        self.queue.forEach { op in
            op.completionBlock = {
                self.processOperationCompletion(op)
            }
        }

        self.opQueue.addOperation(self.queue.removeFirst())
    }

    func processOperationCompletion(_ operation: GetWeatherOperation<Type>) {
        switch operation.result {
        case .success(let successResult):
            self.result = .success(successResult)
            self.finish()
        case .failure(let error):
            if queue.isEmpty {
                self.result = .failure(error)
                self.finish()
            } else {
                self.opQueue.addOperation(queue.removeFirst())
            }
        case .none:
            fatalError()
        }
    }
}
