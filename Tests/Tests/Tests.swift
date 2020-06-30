//  Copyright © 2020 Erica Sadun. All rights reserved.

import XCTest
import GeneralUtility
import MacUtility

class Tests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testPaths() throws {
        XCTAssertTrue("/Applications".isDir())
        XCTAssertTrue(FileManager.default.pathIsDirectory("/Applications"))

        let xcp = try Utility.execute(commandPath: "/usr/bin/xcode-select", arguments: ["-p"])
        let url = URL(fileURLWithPath: xcp).deletingLastPathComponent().appendingPathComponent("Info.plist")
        XCTAssertFalse(url.path.isDir())
        XCTAssertFalse(FileManager.default.pathIsDirectory(url.path))
    }

    func testTouch() throws {
        let manager = FileManager.default
        let tmpdir = manager.temporaryDirectory
        let url = tmpdir.appendingPathComponent("testthis.txt")
        _ = try? manager.removeItem(at: url)
        XCTAssertFalse(manager.fileExists(atPath: url.path))
        manager.touch(url)
        XCTAssertTrue(manager.fileExists(atPath: url.path))
        _ = try? manager.removeItem(at: url)
    }

    func testVersioned() throws {
        let manager = FileManager.default
        let tmpdir = manager.temporaryDirectory
        let url1 = tmpdir.appendingPathComponent("testthis.txt")
        let url2 = tmpdir.appendingPathComponent("testthis 2.txt")
        _ = try? manager.removeItem(at: url1)
        _ = try? manager.removeItem(at: url2)
        manager.touch(url1.path)
        manager.touch(url2.path)
        let destination = tmpdir.appendingPathComponent("testthis 3.txt")
        _ = try? manager.removeItem(at: destination)
        let version = url1.versioned()
        XCTAssertEqual(version.path, destination.path)
        _ = try? manager.removeItem(at: url1)
        _ = try? manager.removeItem(at: url2)
    }

    func testExecute() throws {
        XCTAssertThrowsError(try Utility.execute(commandPath: "/does/not/exist/anywhere/at/all", arguments: []))
    }
}
