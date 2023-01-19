import ArgumentParser
import SemanticVersioning

extension SemanticVersioningElement: EnumerableFlag {
  public static var allCases: [SemanticVersioningElement] {
    [.major, .minor, .patch]
  }
}
