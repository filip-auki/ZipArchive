// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZipArchive",
    platforms: [
        .iOS(.v12),
        .macOS(.v11),
    ],
    products: [
        .library(name: "ZipArchive", targets: ["ZipArchive"]),
    ],
    targets: [
        .target(
            name: "ZipArchive",
            path: "SSZipArchive",
            cSettings: [
                .define("HAVE_INTTYPES_H"),
                .define("HAVE_PKCRYPT"),
                .define("HAVE_STDINT_H"),
                .define("HAVE_WZAES"),
                .define("HAVE_ZLIB"),
                .define("ZLIB_COMPAT")
            ],
            linkerSettings: [
                .linkedLibrary("z"),
                .linkedLibrary("iconv"),
                .linkedFramework("Security"),
            ]
        )
    ]
)
