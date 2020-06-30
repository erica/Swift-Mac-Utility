# Swift Mac Utility

Support code for developing Swift code on Mac.

Extends and depends on Swift-General-Utility.

## Contents

### Execute

Run a system command with `Process` and return the contents of stdout or throw stderr for non-zero status. Although you may call this with either a single string or (cmd-path, argument-array), the latter approach is preferred.

### Type Utilities

#### FileManager utility

* Performs `isDir` check on path.
* Creates new empty files.

#### String utility

* Perform `isDir` check on string path.

#### URL utility

* Version a URL to ensure a new file won't overwrite existing files.


## Installation

PROJECT > Swift Packages > Install:

```
https://github.com/erica/https://github.com/erica/Swift-Mac-Utility
```

SwiftPM:

```
dependencies: [
.package(url: "https://github.com/erica/Swift-Mac-Utility", from: "x.x.x"), // replace with version
],
targets: [
    .target(
        name: "TARGET-NAME",
        dependencies: [
           .product(name: "MacUtility"),
        ],
    ),
],
```
