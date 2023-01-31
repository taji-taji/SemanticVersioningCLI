import ArgumentParser
import Foundation
import SemanticVersioning

extension Semver {
  struct Info: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "info",
      abstract: "Print version information."
    )
    
    @Argument(help: "Target version.")
    var version: String
    
    @Option(help: "Print format. `plain` or `json` .")
    var format: OutputFormat = .plain
  }
}

extension Semver.Info: PrintableCommand {
  func executeWithOutput() throws -> String {
    do {
      let version = try Version(from: version)
      let nextMajor = version.increment(.major).description
      let nextMinor = version.increment(.minor).description
      let nextPatch = version.increment(.patch).description
      let data = try JSONEncoder().encode(version)
      var dictionary = try JSONSerialization.jsonObject(with: data) as! [String : Any]
      dictionary["nextMajor"] = nextMajor
      dictionary["nextMinor"] = nextMinor
      dictionary["nextPatch"] = nextPatch
      
      switch format {
      case .plain:
        return dictionary
          .keys
          .sorted()
          .map { "\($0) : \(dictionary[$0] ?? "")" }
          .joined(separator: "\n")
      case .json:
        let jsonData = try JSONSerialization.data(withJSONObject: dictionary, options: [.sortedKeys])
        return String(data: jsonData, encoding: .utf8)!
      }
    } catch {
      return error.localizedDescription
    }
  }
}
