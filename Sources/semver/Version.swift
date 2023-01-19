import SemanticVersioning

struct Version: SemanticVersioning {
  let major: Int
  let minor: Int
  let patch: Int
  let preRelease: PreRelease?
  let buildMetaData: String?
}
