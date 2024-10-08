import BigInt
import Foundation
import ObjectMapper

public struct ProviderTransaction: ImmutableMappable {
    let blockNumber: Int
    let timestamp: Int
    let hash: Data
    let nonce: Int
    let blockHash: Data?
    let transactionIndex: Int
    let from: Address
    let to: Address?
    let value: BigUInt
    let gasLimit: Int
    let gasPrice: Int
    let isError: Int?
    let txReceiptStatus: Int?
    let input: Data
    let cumulativeGasUsed: Int?
    let gasUsed: Int?

    public init(map: Map) throws {
        blockNumber = try map.value("blockNumber", using: StringIntTransform()) as Int
        timestamp = try map.value("timeStamp", using: StringIntTransform()) as Int
        hash = try map.value("hash", using: HexDataTransform()) as Data
        nonce = try map.value("nonce", using: StringIntTransform()) as Int
        blockHash = try? map.value("blockHash", using: HexDataTransform()) as Data?
        transactionIndex = try map.value("transactionIndex", using: StringIntTransform()) as Int
        from = try map.value("from", using: HexAddressTransform()) as Address
        to = try? map.value("to", using: HexAddressTransform()) as Address?
        value = try map.value("value", using: StringBigUIntTransform()) as BigUInt
        gasLimit = try map.value("gas", using: StringIntTransform()) as Int
        gasPrice = try map.value("gasPrice", using: StringIntTransform()) as Int
        isError = try? map.value("isError", using: StringIntTransform()) as Int?
        txReceiptStatus = try? map.value("txreceipt_status", using: StringIntTransform()) as Int?
        input = try map.value("input", using: HexDataTransform()) as Data
        cumulativeGasUsed = try? map.value("cumulativeGasUsed", using: StringIntTransform()) as Int?
        gasUsed = try? map.value("gasUsed", using: StringIntTransform()) as Int?
    }
}
