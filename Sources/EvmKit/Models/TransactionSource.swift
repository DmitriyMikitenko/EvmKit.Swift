public struct TransactionSource {
    public let name: String
    public let type: SourceType

    public init(name: String, type: SourceType) {
        self.name = name
        self.type = type
    }

    public func transactionUrl(hash: String) -> String {
        switch type {
        case let .etherscan(_, txBaseUrl, _):
            return "\(txBaseUrl)/tx/\(hash)"
        }
    }

    public enum SourceType {
        case etherscan(apiBaseUrl: String, txBaseUrl: String, apiKeys: ApiKeys)
    }
}

public extension TransactionSource {
    private static func etherscan(apiSubdomain: String, txSubdomain: String?, apiKeys: ApiKeys) -> TransactionSource {
        TransactionSource(
            name: "etherscan.io",
            type: .etherscan(apiBaseUrl: "https://\(apiSubdomain).etherscan.io", txBaseUrl: "https://\(txSubdomain.map { "\($0)." } ?? "")etherscan.io", apiKeys: apiKeys)
        )
    }

    static func ethereumEtherscan(apiKeys: ApiKeys) -> TransactionSource {
        etherscan(apiSubdomain: "api", txSubdomain: nil, apiKeys: apiKeys)
    }

    static func sepoliaEtherscan(apiKeys: ApiKeys) -> TransactionSource {
        etherscan(apiSubdomain: "api-sepolia", txSubdomain: "sepolia", apiKeys: apiKeys)
    }

    static func ropstenEtherscan(apiKeys: ApiKeys) -> TransactionSource {
        etherscan(apiSubdomain: "api-ropsten", txSubdomain: "ropsten", apiKeys: apiKeys)
    }

    static func kovanEtherscan(apiKeys: ApiKeys) -> TransactionSource {
        etherscan(apiSubdomain: "api-kovan", txSubdomain: "kovan", apiKeys: apiKeys)
    }

    static func rinkebyEtherscan(apiKeys: ApiKeys) -> TransactionSource {
        etherscan(apiSubdomain: "api-rinkeby", txSubdomain: "rinkeby", apiKeys: apiKeys)
    }

    static func goerliEtherscan(apiKeys: ApiKeys) -> TransactionSource {
        etherscan(apiSubdomain: "api-goerli", txSubdomain: "goerli", apiKeys: apiKeys)
    }

    static func bscscan(apiKeys: ApiKeys) -> TransactionSource {
        TransactionSource(
            name: "bscscan.com",
            type: .etherscan(apiBaseUrl: "https://api.bscscan.com", txBaseUrl: "https://bscscan.com", apiKeys: apiKeys)
        )
    }
    
    static func xdcBlocksScan(apiKeys: ApiKeys) -> TransactionSource {
        TransactionSource(
            name: "xdc.blocksscan.io",
            type: .etherscan(apiBaseUrl: "https://api-xdc.blocksscan.io", txBaseUrl: "https://xdc.blocksscan.io", apiKeys: apiKeys)
        )
    }
    
    static func xdcXinfinExplorer(apiKeys: ApiKeys) -> TransactionSource {
        TransactionSource(
            name: "explorer.xinfin.network",
            type: .etherscan(apiBaseUrl: "https://explorer.xinfin.network", txBaseUrl: "https://explorer.xinfin.network", apiKeys: apiKeys)
        )
    }

    static func bscscanTestNet(apiKeys: ApiKeys) -> TransactionSource {
        TransactionSource(
            name: "testnet.bscscan.com",
            type: .etherscan(apiBaseUrl: "https://api-testnet.bscscan.com", txBaseUrl: "https://testnet.bscscan.com", apiKeys: apiKeys)
        )
    }

    static func polygonscan(apiKeys: ApiKeys) -> TransactionSource {
        TransactionSource(
            name: "polygonscan.com",
            type: .etherscan(apiBaseUrl: "https://api.polygonscan.com", txBaseUrl: "https://polygonscan.com", apiKeys: apiKeys)
        )
    }

    static func snowtrace(apiKeys: ApiKeys) -> TransactionSource {
        TransactionSource(
            name: "snowtrace.io",
            type: .etherscan(apiBaseUrl: "https://api.snowtrace.io", txBaseUrl: "https://snowtrace.io", apiKeys: apiKeys)
        )
    }

    static func optimisticEtherscan(apiKeys: ApiKeys) -> TransactionSource {
        TransactionSource(
            name: "optimistic.etherscan.io",
            type: .etherscan(apiBaseUrl: "https://api-optimistic.etherscan.io", txBaseUrl: "https://optimistic.etherscan.io", apiKeys: apiKeys)
        )
    }

    static func arbiscan(apiKeys: ApiKeys) -> TransactionSource {
        TransactionSource(
            name: "arbiscan.io",
            type: .etherscan(apiBaseUrl: "https://api.arbiscan.io", txBaseUrl: "https://arbiscan.io", apiKeys: apiKeys)
        )
    }

    static func gnosis(apiKeys: ApiKeys) -> TransactionSource {
        TransactionSource(
            name: "gnosisscan.io",
            type: .etherscan(apiBaseUrl: "https://api.gnosisscan.io", txBaseUrl: "https://gnosisscan.io", apiKeys: apiKeys)
        )
    }

    static func fantom(apiKeys: ApiKeys) -> TransactionSource {
        TransactionSource(
            name: "ftmscan.com",
            type: .etherscan(apiBaseUrl: "https://api.ftmscan.com", txBaseUrl: "https://ftmscan.com", apiKeys: apiKeys)
        )
    }
}
