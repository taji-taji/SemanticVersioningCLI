import ArgumentParser
import SemanticVersioning

extension SemanticVersioningCLI {
  struct Up: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "up"
    )
    
    @Flag
    var versionElement: SemanticVersioningElement
    
    @Argument
    var version: String
    
    func run() throws {
      let version = try Version(from: version)
      print(version.increment(versionElement))
    }
  }
}

struct Version: SemanticVersioning {
  let major: Int
  let minor: Int
  let patch: Int
  let preRelease: PreRelease?
  let buildMetaData: String?
}

extension SemanticVersioningElement: EnumerableFlag {
  public static var allCases: [SemanticVersioningElement] {
    [.major, .minor, .patch]
  }
}
