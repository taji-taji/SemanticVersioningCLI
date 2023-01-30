import ArgumentParser
import SemanticVersioning

extension Semver {
  struct Lte: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "lte"
    )
    
    @OptionGroup
    var arguments: CompareArgumentGroup
    
    func run() throws {
      let version1 = try Version(from: arguments.version1)
      let version2 = try Version(from: arguments.version2)
      
      if version1 <= version2 {
        print("1")
      } else {
        print("0")
      }
    }
  }
}