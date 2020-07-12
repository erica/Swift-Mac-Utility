//  Copyright © 2020 Erica Sadun. All rights reserved.

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
