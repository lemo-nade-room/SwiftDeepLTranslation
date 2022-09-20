# SwiftDeepLTranslation

## LICENSE
This software is released under the MIT License, see LICENSE.

## Overview
This is Swift Package to use DeepL API easier.

## Usage

[example code](./Tests/SwiftDeepLTranslationTests/SwiftDeepLTranslationTests.swift)

at Package.swift

```swift
import PackageDescription

let package = Package(
    ...
    platforms: [
        .macOS(.v12)
    ],
    dependencies: [
        ...
        .package(url: "https://github.com/lemo-nade-room/SwiftDeepLTranslation.git", from: "1.0.0"), // add
    ],
    targets: [
        .target(name: "...", dependencies: [
            ...
            "SwiftDeepLTranslation" // add
        ])
    ]
)
```

use

```swift
import SwiftDeepLTranslation

let deepL = SwiftDeepLTranslation(key: "abcdefghijklmnopqrstuvwxyz:fx")

// Unit translate
let result = await deepL.translate(text: "language", to: .Japanese)
// result: "言語",

// let Multi translate
let results = try await deepL.translate(texts: ["language", "japanese"], to: .Japanese)
// results: ["言語", "ジャパニーズ"]
```


