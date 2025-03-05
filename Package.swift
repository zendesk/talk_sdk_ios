// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "TalkSDK",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "TalkSDK",
            targets: [
                "TalkSDKTargets"
            ]
        )
    ],
    dependencies: [
        .package(
            name: "ZendeskCoreSDK",
            url: "https://github.com/zendesk/core_sdk_ios",
            .exact("5.0.3")
        ),
        .package(
            name: "TwilioVoice",
            url: "https://github.com/twilio/twilio-voice-ios",
            .exact("6.11.3")
        )
    ],
    targets: [
        .binaryTarget(
            name: "TalkSDK",
            path: "TalkSDK.xcframework"
        ),
        .target(
            name: "TalkSDKTargets",
            dependencies: [
                .target(name: "TalkSDK"),
                .product(name: "ZendeskCoreSDK", package: "ZendeskCoreSDK"),
                .product(name: "TwilioVoice", package: "TwilioVoice")
            ],
            path: "Sources"
        )
    ]
)
