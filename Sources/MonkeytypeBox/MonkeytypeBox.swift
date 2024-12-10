//
//  Created by Artem Novichkov on 20.11.2024.
//

import SwiftUI
import Monkeytype
import ArgumentParser

@main
struct MonkeytypeBox: AsyncParsableCommand {

    enum Error: Swift.Error {

        case noApeKey
        case noImageData
    }

    static let configuration = CommandConfiguration(abstract: "Generate MonkeyType Personal Bests image.")

    @Option(name: [.short, .long], help: "A name for generated image.")
    var outputFile: String

    mutating func run() async throws {
        guard let apeKey = ProcessInfo.processInfo.environment["MONKEYTYPE_APE_KEY"] else {
            throw Error.noApeKey
        }
        var request = URLRequest(url: URL(string: "https://api.monkeytype.com/users/personalBests?mode=time")!)
        request.allHTTPHeaderFields = ["Authorization": "ApeKey \(apeKey)"]
        let (data, _) = try await URLSession.shared.data(for: request)
        let response = try JSONDecoder().decode(PersonalBestsResponse.self, from: data)

        let personalBestsView = PersonalBestsView(personalBestsResponse: response)
        let size = CGSize(width: 442, height: 100)
        guard let data = await personalBestsView.makeImageData(size: size) else {
            throw Error.noImageData
        }

        let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        let imageURL = currentDirectoryURL.appendingPathComponent(outputFile)
        try data.write(to: imageURL)
    }
}

extension MonkeytypeBox.Error: CustomStringConvertible {

    var description: String {
        switch self {
        case .noApeKey:
            return "Ape Key is missing"
        case .noImageData:
            return "Failed to generate image data"
        }
    }
}
