import BigInt
import Foundation
import ObjectMapper

struct HexIntTransform: TransformType {
    func transformFromJSON(_ value: Any?) -> Int? {
        guard let hexString = value as? String else {
            return nil
        }

        return Int(hexString.hs.stripHexPrefix(), radix: 16)
    }

    func transformToJSON(_: Int?) -> String? {
        fatalError("transformToJSON(_:) has not been implemented")
    }
}

struct HexStringTransform: TransformType {
    func transformFromJSON(_ value: Any?) -> String? {
        value as? String
    }

    func transformToJSON(_: String?) -> String? {
        fatalError("transformToJSON(_:) has not been implemented")
    }
}

struct HexDataArrayTransform: TransformType {
    func transformFromJSON(_ value: Any?) -> [Data]? {
        guard let hexStrings = value as? [String] else {
            return nil
        }

        return hexStrings.compactMap(\.hs.hexData)
    }

    func transformToJSON(_: [Data]?) -> String? {
        fatalError("transformToJSON(_:) has not been implemented")
    }
}

struct HexDataTransform: TransformType {
    func transformFromJSON(_ value: Any?) -> Data? {
        guard let hexString = value as? String else {
            return nil
        }

        return hexString.hs.hexData
    }

    func transformToJSON(_: Data?) -> String? {
        fatalError("transformToJSON(_:) has not been implemented")
    }
}

struct HexAddressTransform: TransformType {
    func transformFromJSON(_ value: Any?) -> Address? {
        guard let hexString = value as? String else {
            return nil
        }

        return try? Address(hex: hexString)
    }

    func transformToJSON(_: Address?) -> String? {
        fatalError("transformToJSON(_:) has not been implemented")
    }
}

struct HexBigUIntTransform: TransformType {
    func transformFromJSON(_ value: Any?) -> BigUInt? {
        guard let hexString = value as? String else {
            return nil
        }

        return BigUInt(hexString.hs.stripHexPrefix(), radix: 16)
    }

    func transformToJSON(_: BigUInt?) -> String? {
        fatalError("transformToJSON(_:) has not been implemented")
    }
}

//struct StringIntTransform: TransformType {
//    func transformFromJSON(_ value: Any?) -> Int? {
//        guard let string = value as? String else {
//            return nil
//        }
//
//        return Int(string)
//    }
//
//    func transformToJSON(_: Int?) -> String? {
//        fatalError("transformToJSON(_:) has not been implemented")
//    }
//}

struct StringIntTransform: TransformType {
    func transformFromJSON(_ value: Any?) -> Int? {
        if let string = value as? String {
            return Int(string)
        } else if let number = value as? Int {
            return number
        }
        return nil
    }

    func transformToJSON(_ value: Int?) -> String? {
        return value.map { String($0) }
    }
}

struct StringOrIntToTimestampTransform: TransformType {
    func transformFromJSON(_ value: Any?) -> Int? {
        if let stringValue = value as? String {
            let dateFormatter = ISO8601DateFormatter()
            dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
            
            if let date = dateFormatter.date(from: stringValue) {
                return Int(date.timeIntervalSince1970)
            }
            if let intValue = Int(stringValue) {
                return intValue
            }
            print("Unable to parse date or integer from string: \(stringValue)")
            return nil
        } else if let intValue = value as? Int {
            return intValue
        }
        return nil
    }

    func transformToJSON(_ value: Int?) -> String? {
        guard let timestamp = value else { return nil }
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.string(from: date)
    }
}

struct StringBigUIntTransform: TransformType {
    func transformFromJSON(_ value: Any?) -> BigUInt? {
        guard let string = value as? String else {
            return nil
        }

        return BigUInt(string)
    }

    func transformToJSON(_: BigUInt?) -> String? {
        fatalError("transformToJSON(_:) has not been implemented")
    }
}
