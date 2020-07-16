//  Copyright © 2020 Erica Sadun. All rights reserved.

import Foundation

extension URL {
    /// Returns true if the URL points to an existing item.
    public var exists: Bool {
        FileManager.default.fileExists(atPath: self.path)
    }

    /// Create a destination URL to save a file that does not yet exist, using numbering
    /// to ensure the new file will not overwrite any other file.
    ///
    /// If `file.ext` already exists, try `file 1.ext`, `file 2.ext`, and so forth.
    ///
    /// - Returns: a version of the destination that does not yet exist
    public func versioned() -> URL {
        // If the destination does not yet exist, use it
        guard FileManager.default.fileExists(atPath: self.path)
        else { return self }

        let pathExtension = self.pathExtension
        let corePath = self.deletingPathExtension().path

        // Find an offset that does not yet exist
        var offset = 2
        while FileManager.default.fileExists(atPath: "\(corePath) \(offset).\(pathExtension)") { offset += 1 }
        return URL(fileURLWithPath: "\(corePath) \(offset).\(pathExtension)")
    }
}
