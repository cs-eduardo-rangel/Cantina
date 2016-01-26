//
//  CredentialStore.swift
//  Cantina
//
//  Created by Erick Vicente on 23/01/16.
//  Copyright © 2016 Concrete Solutions. All rights reserved.
//

import Foundation
import KeychainSwift

class CredentialStore : NSObject {
    
    static let credentialsKey = "credentialsKey"
    
    func save(globoPlusID:String) {
        KeychainSwift().set(globoPlusID, forKey: "credentialsKey")
    }
    
    func get() -> String {
        return (KeychainSwift().get("credentialsKey") as String?)!
    }
    
    func delete() {
        KeychainSwift().delete("credentialsKey")
    }
}
