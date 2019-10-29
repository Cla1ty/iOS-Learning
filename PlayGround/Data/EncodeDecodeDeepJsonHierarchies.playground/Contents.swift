import UIKit

var str = "Hello, playground"

//Mark: - 2

struct Employee2: Codable {
    var name: String
    var id: String
    var favoriteToy: Toy
    
    // 1
    enum CodingKeys: CodingKey {
      case name, id, gift
    }
    
    init(from decoder: Decoder) throws {// 1 
        // 2
        name = try container.decode(String.self, forKey: .name)
        id = try container.decode(String.self, forKey: .id)
        // 3
        let gift = try container.decode(String.self, forKey: .gift)
        favoriteToy = Toy(name: gift)
    }
    
    func encode(to encoder: Encoder) throws {
      // 2
      var container = encoder.container(keyedBy: CodingKeys.self)
      // 3
      try container.encode(name, forKey: .name)
      try container.encode(id, forKey: .id)
      // 4
      try container.encode(favoriteToy.name, forKey: .gift)
    }
}

var string2 = [String:String]()
string2["name"] = "John Appleseed"
string2["id"] = "7"
string2["gift"] = "Teddy Bear"

//{
//  "name" : "John Appleseed",
//  "id" : 7,
//  "gift" : "Teddy Bear"
//}

let data2 = try encoder.encode(string2)
let sameEmployee2 = try decoder.decode(Employee2.self, from: data2)

let json3 = """
{
  "name" : "John Appleseed",
  "id" : 7,
  "gift" : {
    "toy" : {
      "name" : "Teddy Bear"
    }
  }
}
"""

// 1
enum CodingKeys: CodingKey {
  case name, id, gift
}
// 2
enum GiftKeys: CodingKey {
  case toy
}
// 3
func encode(to encoder: Encoder) throws {
  var container = encoder.container(keyedBy: CodingKeys.self)
  try container.encode(name, forKey: .name)
  try container.encode(id, forKey: .id)
  // 4
  var giftContainer = container
    .nestedContainer(keyedBy: GiftKeys.self, forKey: .gift)
  try giftContainer.encode(toy, forKey: .toy)
}


