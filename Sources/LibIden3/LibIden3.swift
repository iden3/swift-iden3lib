import Foundation
import os

import LibIden3C

// config, status
fileprivate typealias GoFunc0 = (UnsafeMutablePointer<CChar>,
                                 UnsafeMutablePointer<UnsafeMutablePointer<PLGNStatus>?>) -> GoUint8
// response,
fileprivate typealias GoFunc1 = (UnsafeMutablePointer<UnsafeMutablePointer<CChar>?>,
                                 UnsafeMutablePointer<CChar>,
                                 UnsafeMutablePointer<UnsafeMutablePointer<PLGNStatus>?>) -> GoUint8

fileprivate typealias GoFunc2 = (UnsafeMutablePointer<UnsafeMutablePointer<CChar>?>,
                                 UnsafeMutablePointer<CChar>,
                                 UnsafeMutablePointer<CChar>,
                                 UnsafeMutablePointer<UnsafeMutablePointer<PLGNStatus>?>) -> GoUint8

fileprivate typealias GoFunc3 = (UnsafeMutablePointer<CChar>,
                                 UnsafeMutablePointer<CChar>,
                                 UnsafeMutablePointer<UnsafeMutablePointer<PLGNStatus>?>) -> GoUint8


/// Swift wrapper for the Golang PolygonID library
public enum LibIden3 {
    public static func getAuthV2Inputs(input: String) -> String {
        callWithStatus(input: input,
                       functionName: #function,
                       goFunction: PLGNAuthV2InputsMarshal)
    }
    
    public static func calculateGenesisID(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNNewGenesisID)
    }
    
    public static func calculateGenesisIdFromEth(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNNewGenesisIDFromEth)
    }
    
    public static func createClaim(input: String) -> String {
        callWithStatus(input: input,
                       functionName: #function,
                       goFunction: PLGNCreateClaim)
    }
    
    public static func convertIdToBigInt(input: String) -> String {
        callWithStatus(input: input,
                       functionName: #function,
                       goFunction: PLGNIDToInt)
    }
    
    public static func proofFromSmartContract(input: String) -> String {
        callWithStatus(input: input,
                       functionName: #function,
                       goFunction: PLGNProofFromSmartContract)
    }
    
    public static func calculateProfileID(input: String) -> String {
        callWithStatus(input: input,
                       functionName: #function,
                       goFunction: PLGNProfileID)
    }
    
    public static func getSigProofInputs(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNAtomicQuerySigV2Inputs)
    }
    
    public static func getMtpProofInputs(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNAtomicQueryMtpV2Inputs)
    }
    
    public static func getSigOnChainProofInputs(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNAtomicQuerySigV2OnChainInputs)
    }
    
    public static func getMtpOnChainProofInputs(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNAtomicQueryMtpV2OnChainInputs)
    }
    
    public static func getV3Inputs(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNAtomicQueryV3Inputs)
    }
    
    public static func getV3OnChainInputs(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNAtomicQueryV3OnChainInputs)
    }
    
    public static func getLinkedMultiQuery10Inputs(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNALinkedMultiQueryInputs)
    }
    
    public static func cleanCache(config: String) -> String {
        callWithStatus(config: config,
                       functionName: #function,
                       goFunction: PLGNCleanCache2)
    }
    
    public static func cacheCredentials(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNCacheCredentials)
    }
    
    public static func credentialFromOnchainHex(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNW3CCredentialFromOnchainHex)
    }
    
    public static func describeID(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNDescribeID)
    }
    
    public static func signPoseidon(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNBabyJubJubSignPoseidon)
    }
    
    public static func verifyPoseidon(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNBabyJubJubVerifyPoseidon)
    }
    
    public static func bjjPrivateToPublic(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNBabyJubJubPrivate2Public)
    }
    
    public static func bjjPublicUncompress(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNBabyJubJubPublicUncompress)
    }
    
    public static func bjjPublicCompress(input: String, config: String) -> String {
        callWithStatus(input: input,
                       config: config,
                       functionName: #function,
                       goFunction: PLGNBabyJubJubPublicCompress)
    }
    
    private static func callWithStatus(config: String, functionName: String, goFunction: GoFunc0) -> String {
        Logger().debug("Calling function \(functionName)")
        Logger().debug("Config: \(config)")
        
        var status: UnsafeMutablePointer<PLGNStatus>? = nil
        defer {
            status?.deallocate()
        }
        
        let configCString = config.asUnsafeCStringPointer
        
        let res = goFunction(configCString, &status)
        
        if (res == 0) {
            consumeStatus(status: status)
        }
        return ""
    }
    
    private static func callWithStatus(input: String, functionName: String, goFunction: GoFunc1) -> String {
        Logger().debug("Calling function \(functionName)")
        Logger().debug("Input: \(input)")
        
        var response: UnsafeMutablePointer<CChar>? = nil
        defer {
            response?.deallocate()
        }
        
        let inputCString = input.asUnsafeCStringPointer
        
        var status: UnsafeMutablePointer<PLGNStatus>? = nil
        defer {
            status?.deallocate()
        }
        
        let res = goFunction(&response, inputCString, &status)
        
        return processResult(res: res, response: response, status: status, functionName: functionName)
    }
    
    private static func callWithStatus(input: String,
                                       config: String,
                                       functionName: String,
                                       goFunction: GoFunc2) -> String {
        Logger().debug("Calling function \(functionName)")
        Logger().debug("Input: \(input)")
        Logger().debug("Config: \(config)")
        
        var response: UnsafeMutablePointer<CChar>? = nil
        defer {
            response?.deallocate()
        }
        
        let inputCString = input.asUnsafeCStringPointer
        let configCString = config.asUnsafeCStringPointer
        
        var status: UnsafeMutablePointer<PLGNStatus>? = nil
        defer {
            status?.deallocate()
        }
        
        let res = goFunction(&response, inputCString, configCString, &status)
        
        return processResult(res: res, response: response, status: status, functionName: functionName)
    }
    
    private static func callWithStatus(input: String, config: String, functionName: String, goFunction: GoFunc3) -> String {
        Logger().debug("Calling function \(functionName)")
        Logger().debug("Input: \(input)")
        Logger().debug("Config: \(config)")
        
        var status: UnsafeMutablePointer<PLGNStatus>? = nil
        defer {
            status?.deallocate()
        }
        
        let inputCString = input.asUnsafeCStringPointer
        let configCString = config.asUnsafeCStringPointer
        
        let res = goFunction(inputCString, configCString, &status)
        
        if (res == 0) {
            consumeStatus(status: status)
        }
        return ""
    }
    
    private static func processResult(res: GoUint8,
                                      response: UnsafeMutablePointer<CChar>?,
                                      status: UnsafeMutablePointer<PLGNStatus>?,
                                      functionName: String) -> String {
        if (res == 0) {
            consumeStatus(status: status)
        }
        guard let response = response else {
            Logger().log("Unexpected null response from \(functionName)")
            return ""
        }
        
        guard let responseString = String(validatingUTF8: response) else {
            Logger().log("Unparsable response from \(functionName)")
            return ""
        }
        
        return responseString
    }
    
    private static func consumeStatus(status: UnsafeMutablePointer<PLGNStatus>?,
                                      message: String = "") {
        guard let status else {
            Logger().log("Unable to allocate status!")
            return
        }
        
        let statusValue = status.pointee.status.rawValue
        if statusValue >= 0 {
            let msg: String
            if (message.isEmpty) {
                msg = "status is not OK with code \(statusValue)"
            } else {
                msg = message
            }
            
            let json = String(validatingUTF8:  status.pointee.error_msg) ?? ""
            
            let errorMsg = "\(msg): \(json)"
            Logger().log("\(statusValue): \(errorMsg)")
            
        }
    }
}

extension LibIden3 {
    public static func callLibIden3<T: Codable>(request: Codable,
                                                name: String,
                                                function: (String) -> String) -> T? {
        guard let requestString = request.toJson() else {
            Logger().log("Error creating request string for \(name)")
            return nil
        }
        
        let responseString = function(requestString)
        guard let response = T(json: responseString) else {
            Logger().log("Error parsing the response for \(name): \(responseString)")
            return nil
        }
        return response
    }
    
    public static func callLibIden3<T: Codable>(request: Codable,
                                                config: Codable,
                                                name: String,
                                                function: (String, String) -> String) -> T? {
        guard let requestString = request.toJson() else {
            Logger().log("Error creating request string for \(name)")
            return nil
        }
        guard let configString = config.toJson() else {
            Logger().log("Error creating config string for \(name)")
            return nil
        }
        
        let responseString = function(requestString, configString)
        guard let response = T(json: responseString) else {
            Logger().log("Error parsing the response for \(name): \(responseString)")
            return nil
        }
        return response
    }
}
