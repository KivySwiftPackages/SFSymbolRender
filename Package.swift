// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let local = false

let pykit_package: Package.Dependency = if local {
    .package(path: "../PySwiftKit")
} else {
    .package(url: "https://github.com/KivySwiftLink/PySwiftKit", from: .init(311, 0, 0))
}

let pykit: Target.Dependency = .product(name: "SwiftonizeModules", package: "PySwiftKit")

let tex_package: Package.Dependency = if local {
    .package(path: "../KivyTexture")
} else {
    .package(url: "https://github.com/KivySwiftPackages/KivyTexture", .upToNextMajor(from: .init(311, 0, 1)))
}

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
        pykit_package,
        tex_package,
        .package(path: "PyFileGenerator")
		//.package(url: "https://github.com/KivySwiftLink/PythonCore", .upToNextMajor(from: .init(311, 0, 0))),
		
		//.package(url: "https://github.com/PythonSwiftLink/SwiftonizePlugin", .upToNextMajor(from: .init(0, 1, 0)))
	],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
			name: "SFSymbolRender",
			dependencies: [
				.product(name: "KivyTexture", package: "KivyTexture"),
				.product(name: "SwiftonizeModules", package: "PySwiftKit"),
				//.product(name: "PythonCore", package: "PythonCore")
			],
			plugins: [
				//.plugin(name: "Swiftonize", package: "SwiftonizePlugin"),
			]
		),
        .testTarget(
            name: "SFSymbolRenderTests",
            dependencies: ["SFSymbolRender"]),
    ]
)
