//
//  PassportElement.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a Telegram Passport element
internal enum PassportElement: Codable {
    /// A Telegram Passport element containing the user's personal details
    case passportElementPersonalDetails(PassportElementPersonalDetails)

    /// A Telegram Passport element containing the user's passport
    case passportElementPassport(PassportElementPassport)

    /// A Telegram Passport element containing the user's driver license
    case passportElementDriverLicense(PassportElementDriverLicense)

    /// A Telegram Passport element containing the user's identity card
    case passportElementIdentityCard(PassportElementIdentityCard)

    /// A Telegram Passport element containing the user's internal passport
    case passportElementInternalPassport(PassportElementInternalPassport)

    /// A Telegram Passport element containing the user's address
    case passportElementAddress(PassportElementAddress)

    /// A Telegram Passport element containing the user's utility bill
    case passportElementUtilityBill(PassportElementUtilityBill)

    /// A Telegram Passport element containing the user's bank statement
    case passportElementBankStatement(PassportElementBankStatement)

    /// A Telegram Passport element containing the user's rental agreement
    case passportElementRentalAgreement(PassportElementRentalAgreement)

    /// A Telegram Passport element containing the user's passport registration pages
    case passportElementPassportRegistration(PassportElementPassportRegistration)

    /// A Telegram Passport element containing the user's temporary registration
    case passportElementTemporaryRegistration(PassportElementTemporaryRegistration)

    /// A Telegram Passport element containing the user's phone number
    case passportElementPhoneNumber(PassportElementPhoneNumber)

    /// A Telegram Passport element containing the user's email address
    case passportElementEmailAddress(PassportElementEmailAddress)

    private enum Kind: String, Codable {
        case passportElementPersonalDetails
        case passportElementPassport
        case passportElementDriverLicense
        case passportElementIdentityCard
        case passportElementInternalPassport
        case passportElementAddress
        case passportElementUtilityBill
        case passportElementBankStatement
        case passportElementRentalAgreement
        case passportElementPassportRegistration
        case passportElementTemporaryRegistration
        case passportElementPhoneNumber
        case passportElementEmailAddress
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .passportElementPersonalDetails:
            let value = try PassportElementPersonalDetails(from: decoder)
            self = .passportElementPersonalDetails(value)
        case .passportElementPassport:
            let value = try PassportElementPassport(from: decoder)
            self = .passportElementPassport(value)
        case .passportElementDriverLicense:
            let value = try PassportElementDriverLicense(from: decoder)
            self = .passportElementDriverLicense(value)
        case .passportElementIdentityCard:
            let value = try PassportElementIdentityCard(from: decoder)
            self = .passportElementIdentityCard(value)
        case .passportElementInternalPassport:
            let value = try PassportElementInternalPassport(from: decoder)
            self = .passportElementInternalPassport(value)
        case .passportElementAddress:
            let value = try PassportElementAddress(from: decoder)
            self = .passportElementAddress(value)
        case .passportElementUtilityBill:
            let value = try PassportElementUtilityBill(from: decoder)
            self = .passportElementUtilityBill(value)
        case .passportElementBankStatement:
            let value = try PassportElementBankStatement(from: decoder)
            self = .passportElementBankStatement(value)
        case .passportElementRentalAgreement:
            let value = try PassportElementRentalAgreement(from: decoder)
            self = .passportElementRentalAgreement(value)
        case .passportElementPassportRegistration:
            let value = try PassportElementPassportRegistration(from: decoder)
            self = .passportElementPassportRegistration(value)
        case .passportElementTemporaryRegistration:
            let value = try PassportElementTemporaryRegistration(from: decoder)
            self = .passportElementTemporaryRegistration(value)
        case .passportElementPhoneNumber:
            let value = try PassportElementPhoneNumber(from: decoder)
            self = .passportElementPhoneNumber(value)
        case .passportElementEmailAddress:
            let value = try PassportElementEmailAddress(from: decoder)
            self = .passportElementEmailAddress(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .passportElementPersonalDetails(value):
            try container.encode(Kind.passportElementPersonalDetails, forKey: .type)
            try value.encode(to: encoder)
        case let .passportElementPassport(value):
            try container.encode(Kind.passportElementPassport, forKey: .type)
            try value.encode(to: encoder)
        case let .passportElementDriverLicense(value):
            try container.encode(Kind.passportElementDriverLicense, forKey: .type)
            try value.encode(to: encoder)
        case let .passportElementIdentityCard(value):
            try container.encode(Kind.passportElementIdentityCard, forKey: .type)
            try value.encode(to: encoder)
        case let .passportElementInternalPassport(value):
            try container.encode(Kind.passportElementInternalPassport, forKey: .type)
            try value.encode(to: encoder)
        case let .passportElementAddress(value):
            try container.encode(Kind.passportElementAddress, forKey: .type)
            try value.encode(to: encoder)
        case let .passportElementUtilityBill(value):
            try container.encode(Kind.passportElementUtilityBill, forKey: .type)
            try value.encode(to: encoder)
        case let .passportElementBankStatement(value):
            try container.encode(Kind.passportElementBankStatement, forKey: .type)
            try value.encode(to: encoder)
        case let .passportElementRentalAgreement(value):
            try container.encode(Kind.passportElementRentalAgreement, forKey: .type)
            try value.encode(to: encoder)
        case let .passportElementPassportRegistration(value):
            try container.encode(Kind.passportElementPassportRegistration, forKey: .type)
            try value.encode(to: encoder)
        case let .passportElementTemporaryRegistration(value):
            try container.encode(Kind.passportElementTemporaryRegistration, forKey: .type)
            try value.encode(to: encoder)
        case let .passportElementPhoneNumber(value):
            try container.encode(Kind.passportElementPhoneNumber, forKey: .type)
            try value.encode(to: encoder)
        case let .passportElementEmailAddress(value):
            try container.encode(Kind.passportElementEmailAddress, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A Telegram Passport element containing the user's personal details
internal struct PassportElementPersonalDetails: Codable {
    /// Personal details of the user
    internal let personalDetails: PersonalDetails

    internal init(personalDetails: PersonalDetails) {
        self.personalDetails = personalDetails
    }
}

/// A Telegram Passport element containing the user's passport
internal struct PassportElementPassport: Codable {
    /// Passport
    internal let passport: IdentityDocument

    internal init(passport: IdentityDocument) {
        self.passport = passport
    }
}

/// A Telegram Passport element containing the user's driver license
internal struct PassportElementDriverLicense: Codable {
    /// Driver license
    internal let driverLicense: IdentityDocument

    internal init(driverLicense: IdentityDocument) {
        self.driverLicense = driverLicense
    }
}

/// A Telegram Passport element containing the user's identity card
internal struct PassportElementIdentityCard: Codable {
    /// Identity card
    internal let identityCard: IdentityDocument

    internal init(identityCard: IdentityDocument) {
        self.identityCard = identityCard
    }
}

/// A Telegram Passport element containing the user's internal passport
internal struct PassportElementInternalPassport: Codable {
    /// Internal passport
    internal let internalPassport: IdentityDocument

    internal init(internalPassport: IdentityDocument) {
        self.internalPassport = internalPassport
    }
}

/// A Telegram Passport element containing the user's address
internal struct PassportElementAddress: Codable {
    /// Address
    internal let address: Address

    internal init(address: Address) {
        self.address = address
    }
}

/// A Telegram Passport element containing the user's utility bill
internal struct PassportElementUtilityBill: Codable {
    /// Utility bill
    internal let utilityBill: PersonalDocument

    internal init(utilityBill: PersonalDocument) {
        self.utilityBill = utilityBill
    }
}

/// A Telegram Passport element containing the user's bank statement
internal struct PassportElementBankStatement: Codable {
    /// Bank statement
    internal let bankStatement: PersonalDocument

    internal init(bankStatement: PersonalDocument) {
        self.bankStatement = bankStatement
    }
}

/// A Telegram Passport element containing the user's rental agreement
internal struct PassportElementRentalAgreement: Codable {
    /// Rental agreement
    internal let rentalAgreement: PersonalDocument

    internal init(rentalAgreement: PersonalDocument) {
        self.rentalAgreement = rentalAgreement
    }
}

/// A Telegram Passport element containing the user's passport registration pages
internal struct PassportElementPassportRegistration: Codable {
    /// Passport registration pages
    internal let passportRegistration: PersonalDocument

    internal init(passportRegistration: PersonalDocument) {
        self.passportRegistration = passportRegistration
    }
}

/// A Telegram Passport element containing the user's temporary registration
internal struct PassportElementTemporaryRegistration: Codable {
    /// Temporary registration
    internal let temporaryRegistration: PersonalDocument

    internal init(temporaryRegistration: PersonalDocument) {
        self.temporaryRegistration = temporaryRegistration
    }
}

/// A Telegram Passport element containing the user's phone number
internal struct PassportElementPhoneNumber: Codable {
    /// Phone number
    internal let phoneNumber: String

    internal init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
}

/// A Telegram Passport element containing the user's email address
internal struct PassportElementEmailAddress: Codable {
    /// Email address
    internal let emailAddress: String

    internal init(emailAddress: String) {
        self.emailAddress = emailAddress
    }
}
