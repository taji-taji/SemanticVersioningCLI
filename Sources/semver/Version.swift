import SemanticVersioning

struct Version: SemanticVersioning, Encodable {
  let major: Int
  let minor: Int
  let patch: Int
  let preRelease: PreRelease?
  let buildMetaData: String?
  
  enum CodingKeys: String, CodingKey {
    case major
    case minor
    case patch
    case preRelease
    case buildMetaData
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(major, forKey: .major)
    try container.encode(minor, forKey: .minor)
    try container.encode(patch, forKey: .patch)
    try container.encode(preRelease?.description, forKey: .preRelease)
    try container.encode(buildMetaData, forKey: .buildMetaData)
  }
}
