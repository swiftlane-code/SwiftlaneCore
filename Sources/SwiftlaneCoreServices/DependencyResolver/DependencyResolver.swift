//

import Foundation
import SwiftlaneExtensions
import SwiftlaneLogging

private struct Producer {
    let produceInstance: () -> Any
}

public class DependencyResolver {
    public struct LoggingConfig {
        public var producerRegister = LoggingLevel.verbose
        public var producerOverwrite = LoggingLevel.warning
        public var producerUnregister = LoggingLevel.warning
        
        public var instantiateUniqueInstance = LoggingLevel.verbose
        public var instantiateSharedInstance = LoggingLevel.verbose
        public var returnSharedInstance = LoggingLevel.verbose
        
        public var loggerInstance: Logging? = DetailedLogger(logLevel: .verbose)
    }
    
    public enum Strategy {
        case unique
        case shared
    }
    
    public static let shared = DependencyResolver(name: "Shared Resolver")
    
    private var producers: [String: Producer] = [:]
    private var sharedInstances: [String: Any] = [:]
    
    /// Used in all logged messages.
    public let name: String
    
    /// Here you can configure logging level for all messages.
    public var logConfig = LoggingConfig()
    
    /// - Parameter name: Used in all logged messages.
    public init(name: String) {
        self.name = name
    }
    
    public func reset() {
        producers.removeAll()
        sharedInstances.removeAll()
    }
    
    public func isRegistered<T>(_ requiredType: T.Type) -> Bool {
        let key = fullTypeName(requiredType)
        return producers.keys.contains(key)
    }
    
    public func allRegisteredTypes() -> [String] {
        Array(producers.keys)
    }
    
    public func unregister<T>(
        _ registerType: T.Type,
        file: String = #file,
        line: UInt = #line
    ) {
        let key = fullTypeName(registerType)
        producers[key] = nil
        sharedInstances[key] = nil
        
        log(
            logConfig.producerUnregister,
            "Un-registering producer for type \(key.quoted).",
            file: file,
            line: line
        )
    }
    
    public func register<T>(
        _ registerType: T.Type,
        producerClosure: @escaping () -> T,
        file: String = #file,
        line: UInt = #line
    ) {
        let key = fullTypeName(registerType)
        
        if isRegistered(registerType) {
            log(
                logConfig.producerOverwrite,
                "Overwriting producer for type \(key.quoted).",
                file: file,
                line: line
            )
        } else {
            log(
                logConfig.producerRegister,
                "Registering first producer for type \(key.quoted).",
                file: file,
                line: line
            )
        }
        
        producers[key] = Producer(produceInstance: producerClosure)
        sharedInstances[key] = nil
    }
    
    public func resolve<T>(
        _ requiredType: T.Type,
        _ strategy: Strategy,
        file: String = #file,
        line: UInt = #line
    ) -> T {
        let key = fullTypeName(requiredType)
        return resolve(key, strategy, file: file, line: line)
    }
    
    @_disfavoredOverload
    public func resolve<T>(
        _ key: String,
        _ strategy: Strategy,
        file: String = #file,
        line: UInt = #line
    ) -> T {
        guard let producer = producers[key] else {
            logFatalErrorAndExit(
                "Producer for type '\(key)' is not registered",
                file: file,
                line: line
            )
        }
        switch strategy {
        case .unique:
            log(
                logConfig.instantiateUniqueInstance,
                "Producing unique instance of type \(key.quoted).",
                file: file,
                line: line
            )
            return castInstance(producer.produceInstance())
        case .shared:
            if let existing = sharedInstances[key] {
                log(
                    logConfig.returnSharedInstance,
                    "Resolving shared instance of type \(key.quoted).",
                    file: file,
                    line: line
                )
                return castInstance(existing)
            } else {
                log(
                    logConfig.instantiateSharedInstance,
                    "Instantiating new shared instance of type \(key.quoted).",
                    file: file,
                    line: line
                )
                let created: T = castInstance(producer.produceInstance())
                sharedInstances[key] = created
                return created
            }
        }
    }
    
    private func castInstance<T>(
        _ instance: Any,
        to requiredType: T.Type = T.self,
        file: String = #file,
        line: UInt = #line
    ) -> T {
        guard let casted = instance as? T else {
            logFatalErrorAndExit(
                "Type mismatch: expected \"\(T.self)\" but produced \"\(type(of: instance))\"",
                file: file,
                line: line
            )
        }
        return casted
    }
    
    private func logFatalErrorAndExit(
        _ message: @autoclosure () -> String,
        file: String = #file,
        line: UInt = #line
    ) -> Never {
        let message = "[\(self.name)] " + message()
        let logger = DetailedLogger(logLevel: .debug)
        logger.error(message, file: file, line: line)
        
        if XcodeChecker().isRunningFromXcode {
            // Trigger fatalError breakpoint when running in Xcode.
            Swift.fatalError(message)
        } else {
            Exitor().exit(with: 1)
            Swift.fatalError()
        }
    }
    
    private func log(
        _ level: LoggingLevel,
        _ msg: String,
        file: String,
        line: UInt
    ) {
        guard let logger = logConfig.loggerInstance else {
            return
        }
        
        logger.log(
            level,
            "[\(self.name)] " + msg,
            file: file,
            line: line
        )
    }
}
