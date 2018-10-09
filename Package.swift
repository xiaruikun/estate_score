// swift-tools-version:4.0
// Generated automatically by Perfect Assistant
// Date: 2018-08-30 08:01:02 +0000
import PackageDescription

let package = Package(
	name: "estate_score_swift",
	dependencies: [
		.package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", "3.0.0"..<"4.0.0"),
		.package(url: "https://github.com/PerfectlySoft/Perfect-PostgreSQL.git", "3.1.0"..<"3.1.9223372036854775807"),
		.package(url: "https://github.com/PerfectlySoft/Perfect-Mustache.git", "3.0.0"..<"4.0.0"),
		.package(url: "https://github.com/SwiftORM/Postgres-Storm.git", "3.0.0"..<"4.0.0"),
		.package(url: "https://github.com/PerfectlySoft/Perfect-SysInfo.git", "3.0.0"..<"4.0.0"),
		.package(url: "https://github.com/PerfectlySoft/Perfect-Logger.git", "3.0.0"..<"4.0.0"),
		.package(url: "https://github.com/iamjono/JSONConfig.git", "3.0.0"..<"4.0.0"),
        .package(url: "https://github.com/apple/swift-nio.git", from: "1.0.0")
	],
	targets: [
		.target(name: "estate_score_swift", dependencies: ["PerfectHTTPServer", "PerfectPostgreSQL", "PerfectMustache", "PostgresStORM", "PerfectSysInfo", "PerfectLogger", "JSONConfig"])
	]
)
