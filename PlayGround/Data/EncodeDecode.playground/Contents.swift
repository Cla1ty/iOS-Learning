import Foundation

let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase

let encoder = JSONEncoder()
encoder.keyEncodingStrategy = .convertToSnakeCase

struct Toy: Codable {
    var name: String
}
struct Employee: Codable {
    var name: String
    var id: Int
    var favoriteToy: Toy
    
//    enum CodingKeys: String, CodingKey {
//      case name, id, favoriteToy = "gift"
//    }
}

let employee = Employee(name: "John Appleseed", id: 7, favoriteToy: Toy(name: "Teddy Bear"))

let data = try encoder.encode(employee)
let string = String(data: data, encoding: .utf8)!
let sameEmployee = try decoder.decode(Employee.self, from: data)
