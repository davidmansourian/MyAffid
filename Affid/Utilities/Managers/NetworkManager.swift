//
//  NetworkManager.swift
//  Affid
//
//  Created by David on 2022-12-07.
//

import Foundation
import Network

class NetworkManager: ObservableObject{
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "NetworkManager")
    @Published var isConnected = true
    
    init(){
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async{
                self.isConnected = path.status == .satisfied

            }
        }
        
        monitor.start(queue: queue)
    }
    
}
