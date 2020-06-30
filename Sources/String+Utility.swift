//
//  File.swift
//  
//
//  Created by Erica Sadun on 6/30/20.
//

import Foundation

extension String {
    /// Tests whether a string-based path is a directory
    /// - Returns: Boolean
    public func isDir() -> Bool {
        var pathIsDir: ObjCBool = false
        guard FileManager.default.fileExists(atPath: self, isDirectory: &pathIsDir)
        else { return false }
        return pathIsDir.boolValue
    }
}
