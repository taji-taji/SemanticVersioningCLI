import ArgumentParser

extension Semver {
  struct CompareArgumentGroup: ParsableArguments {
    @Argument
    var version1: String
    
    @Argument
    var version2: String
  }
}
