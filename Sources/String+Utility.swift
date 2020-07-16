//  Copyright © 2020 Erica Sadun. All rights reserved.

import Foundation

extension String {
    /// Trims trailing slashes from a folder path.
    /// - Returns: a canonical path to a folder
    public func trimmedDirPath() -> String {
        if self.hasSuffix("/") { return String(self.dropLast()) }
        return self
    }

    /// Tests whether a string-based path is a directory
    /// - Returns: Boolean
    public func isDir() -> Bool {
        var pathIsDir: ObjCBool = false
        guard FileManager.default.fileExists(atPath: self, isDirectory: &pathIsDir)
        else { return false }
        return pathIsDir.boolValue
    }
}
