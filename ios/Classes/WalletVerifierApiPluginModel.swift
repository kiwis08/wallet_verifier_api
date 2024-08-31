//
//  WalletVerifierApiPluginModel.swift
//  Pods
//
//  Created by Santiago Quihui on 31/08/24.
//

import Foundation
import ProximityReader

@MainActor
final class WalletVerifierApiPluginModel {
    
    static let shared = WalletVerifierApiPluginModel()

    private var cachedSession: MobileDocumentReaderSession?

    func verifyButtonTapped() {
        Task {
            // Check that the device supports mobile document reading.
            guard MobileDocumentReader.isSupported else {
                // This device doesn't support the Verifier API.
                print("Device does not support Verifier API")
                return
            }
            
            do {
                print("Verifying age")
                try await self.verifyAge()
            } catch MobileDocumentReaderError.cancelled {
                print("User dismissed")
                // The user dismissed the document reader user interface.
            } catch {
                print("An error occurred while reading a mobile document: \(error.localizedDescription)")
            }
        }
    }

    private func verifyAge() async throws {
        // Create a driver's license display request containing the age over 21 element.
        let request = MobileDriversLicenseDisplayRequest(elements: [.ageAtLeast(21)])

        // Perform the request using a previously cached reader session, if present.
        // If the cached session has expired, prepare the device for document reading again.
        if let cachedSession = self.cachedSession {
            do {
                try await cachedSession.requestDocument(request)
                return
            } catch MobileDocumentReaderError.sessionExpired {
                self.cachedSession = nil
            }
        }

        // To prepare the device for document reading, first create a mobile document reader object.
        let reader = MobileDocumentReader()

        // Then, call `prepare`. If successful, cache the returned reader session object.
        let readerSession = try await reader.prepare()
        self.cachedSession = readerSession

        // Finally, request the document again with the newly created session.
        try await readerSession.requestDocument(request)
    }

}
