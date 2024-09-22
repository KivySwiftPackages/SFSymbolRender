// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SFSymbolRender",
	platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SFSymbolRender",
            targets: ["SFSymbolRender"]),
    ],
	dependencies: [
		//.package(path: "/Volumes/CodeSSD/GitHub/KivyTexture"),
		.package(url: "https://github.com/KivySwiftPackages/KivyTexture", .upToNextMajor(from: .init(311, 0, 0))),
		.package(url: "https://github.com/KivySwiftLink/PythonSwiftLink", .upToNextMajor(from: .init(311, 1, 0))),
		.package(url: "https://github.com/KivySwiftLink/PythonCore", .upToNextMajor(from: .init(311, 0, 0))),
		
		.package(url: "https://github.com/PythonSwiftLink/SwiftonizePlugin", .upToNextMajor(from: .init(0, 1, 0)))
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
			name: "SFSymbolRender",
			dependencies: [
				.product(name: "KivyTexture", package: "KivyTexture"),
				.product(name: "SwiftonizeModules", package: "PythonSwiftLink"),
				.product(name: "PythonCore", package: "PythonCore")
			],
			plugins: [
				.plugin(name: "Swiftonize", package: "SwiftonizePlugin"),
			]
		),
        .testTarget(
            name: "SFSymbolRenderTests",
            dependencies: ["SFSymbolRender"]),
    ]
)
