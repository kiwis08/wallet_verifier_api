//
//  WalletVerifierAPIError.swift
//  wallet_verifier_api
//
//  Created by Santiago Quihui on 02/09/24.
//

import Foundation
enum WalletVerifierAPIError: Error {
    case unknown
    case notSupported
}

extension WalletVerifierAPIError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .notSupported:
            return "The device doesn't support the Verifier API"
        case .unknown:
            return "An unknown error occurred."
        }
    }
}

extension WalletVerifierAPIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "An unknown error occurred while attempting to verify the wallet."
        case .notSupported:
            return "The Verifier API is not supported on this device."
        }
    }
}
