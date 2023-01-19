import ArgumentParser
import Foundation
import SemanticVersioning

extension Semver {
  struct Info: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "info"
    )
    
    @Argument
    var version: String
    
    func run() throws {
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
        let jsonData = try JSONSerialization.data(withJSONObject: dictionary)
        print(String(data: jsonData, encoding: .utf8)!)
      } catch {
        print(error)
      }
    }
  }
}
