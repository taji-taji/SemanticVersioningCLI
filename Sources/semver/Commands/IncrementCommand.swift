import ArgumentParser
import SemanticVersioning

extension Semver {
  struct Increment: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "increment"
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
