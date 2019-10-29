import Foundation

extension DateFormatter {
  static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd-MM-yyyy"
    return formatter
  }()
}

let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase
decoder.dateDecodingStrategy = .formatted(.dateFormatter)

let encoder = JSONEncoder()
encoder.keyEncodingStrategy = .convertToSnakeCase
encoder.dateEncodingStrategy = .formatted(.dateFormatter)

let date = "29-05-2019"
let data = try encoder.encode(date)
let string = String(data: data, encoding: .utf8)!

let sameEmployee = try decoder.decode(Date.self, from: data)

