//  Copyright © 2020 Erica Sadun. All rights reserved.

import Foundation

extension FileManager {
    /// Tests whether a path terminates as a folder.
    /// - Parameter path: a Finder path.
    /// - Returns: `true` for folders/directory, `false` otherwise.
    public func pathIsDirectory(_ path: String) -> Bool {
        var isDir: ObjCBool = false
        guard FileManager.default.fileExists(atPath: path, isDirectory: &isDir)
        else { return false }
        return isDir.boolValue
    }

    /// Create a new empty file at a given destination.
    /// - Parameter url: the destination url.
    public func touch(_ url: URL) {
        FileManager.default.createFile(atPath: url.path, contents: "".data(using: .utf8), attributes: nil)
    }

    /// Create a new empty file at a given destination.
    /// - Parameter path: the destination path.
    public func touch(_ path: String) {
        FileManager.default.createFile(atPath: path, contents: "".data(using: .utf8), attributes: nil)
    }
}
