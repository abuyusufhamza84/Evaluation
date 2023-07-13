//
//  File.swift
//  BCGCodingTest - Service Layer
//
//  Created by Mohammed Sadiq on 11/07/23.
//

import Foundation
import Combine
import Network

enum ReachabilityType: String {
    case wiFi = "WIFI"
    case cellular = "DATA"
    case otherNetwork = "Other Network"
    case noConnection = "No Connection"

    public var description: String {
        switch self {
        case .cellular:
            return "cellular"
        case .wiFi:
            return "wiFi"
        case .otherNetwork:
            return "Other Network"
        case .noConnection:
            return "No Connection"
        }
    }
}

/// Class to manage or provide network reachability status
class NetworkReachability: NSObject {
    static let shared = NetworkReachability()
    public var reachabilityPublisher = PassthroughSubject<Bool, Never>()

    /// Reachability  Object
    var monitor: NWPathMonitor?
    let nwpathMonitorQueue = DispatchQueue.global(qos: .background)

    override private init() {
        super.init()
        startNWPathMonitor()
    }

    /// start listeining to network changes.
    func startNWPathMonitor() {
        monitor = NWPathMonitor()
        monitor?.start(queue: nwpathMonitorQueue)
    }

    /// Listener for network chane notification
    func startReachibilityWithNetworkPathMonitor() {
        monitor?.pathUpdateHandler = { path in
            if path.status == .satisfied {
                if path.usesInterfaceType(.wifi) {
                    debugPrint("NetworkPathMonitor wifi : We're connected!")
                    self.reachabilityPublisher.send(true)
                } else if path.usesInterfaceType(.cellular) {
                    debugPrint(" NetworkPathMonitor Reachable via Cellular")
                    self.reachabilityPublisher.send(true)
                }
            } else {
                self.reachabilityPublisher.send(false)
                debugPrint(" NetworkPathMonitor No connection.")
            }
        }
    }

    /// Is network reachable
    /// - Returns: Will return network reachability
    func isReachable() -> Bool {
        return monitor?.currentPath.status == .satisfied
    }

    /// Get the network reachability with connection type
    /// - Returns: will return connectivity type
    func isReachableVia() -> ReachabilityType? {
        var reachabilityType: ReachabilityType?
        if monitor?.currentPath.usesInterfaceType(.wifi) == true {
            reachabilityType = .wiFi
        } else if monitor?.currentPath.usesInterfaceType(.cellular) == true {
            reachabilityType = .cellular
        } else {
            reachabilityType = .wiFi
        }
        return reachabilityType
    }
}
