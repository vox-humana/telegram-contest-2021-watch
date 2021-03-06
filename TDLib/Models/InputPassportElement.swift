//
//  InputPassportElement.swift
//  tl2swift
//
//  Created by Code Generator
//

import Foundation

/// Contains information about a Telegram Passport element to be saved
internal enum InputPassportElement: Codable {
    /// A Telegram Passport element to be saved containing the user's personal details
    case inputPassportElementPersonalDetails(InputPassportElementPersonalDetails)

    /// A Telegram Passport element to be saved containing the user's passport
    case inputPassportElementPassport(InputPassportElementPassport)

    /// A Telegram Passport element to be saved containing the user's driver license
    case inputPassportElementDriverLicense(InputPassportElementDriverLicense)

    /// A Telegram Passport element to be saved containing the user's identity card
    case inputPassportElementIdentityCard(InputPassportElementIdentityCard)

    /// A Telegram Passport element to be saved containing the user's internal passport
    case inputPassportElementInternalPassport(InputPassportElementInternalPassport)

    /// A Telegram Passport element to be saved containing the user's address
    case inputPassportElementAddress(InputPassportElementAddress)

    /// A Telegram Passport element to be saved containing the user's utility bill
    case inputPassportElementUtilityBill(InputPassportElementUtilityBill)

    /// A Telegram Passport element to be saved containing the user's bank statement
    case inputPassportElementBankStatement(InputPassportElementBankStatement)

    /// A Telegram Passport element to be saved containing the user's rental agreement
    case inputPassportElementRentalAgreement(InputPassportElementRentalAgreement)

    /// A Telegram Passport element to be saved containing the user's passport registration
    case inputPassportElementPassportRegistration(InputPassportElementPassportRegistration)

    /// A Telegram Passport element to be saved containing the user's temporary registration
    case inputPassportElementTemporaryRegistration(InputPassportElementTemporaryRegistration)

    /// A Telegram Passport element to be saved containing the user's phone number
    case inputPassportElementPhoneNumber(InputPassportElementPhoneNumber)

    /// A Telegram Passport element to be saved containing the user's email address
    case inputPassportElementEmailAddress(InputPassportElementEmailAddress)

    private enum Kind: String, Codable {
        case inputPassportElementPersonalDetails
        case inputPassportElementPassport
        case inputPassportElementDriverLicense
        case inputPassportElementIdentityCard
        case inputPassportElementInternalPassport
        case inputPassportElementAddress
        case inputPassportElementUtilityBill
        case inputPassportElementBankStatement
        case inputPassportElementRentalAgreement
        case inputPassportElementPassportRegistration
        case inputPassportElementTemporaryRegistration
        case inputPassportElementPhoneNumber
        case inputPassportElementEmailAddress
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DtoCodingKeys.self)
        let type = try container.decode(Kind.self, forKey: .type)
        switch type {
        case .inputPassportElementPersonalDetails:
            let value = try InputPassportElementPersonalDetails(from: decoder)
            self = .inputPassportElementPersonalDetails(value)
        case .inputPassportElementPassport:
            let value = try InputPassportElementPassport(from: decoder)
            self = .inputPassportElementPassport(value)
        case .inputPassportElementDriverLicense:
            let value = try InputPassportElementDriverLicense(from: decoder)
            self = .inputPassportElementDriverLicense(value)
        case .inputPassportElementIdentityCard:
            let value = try InputPassportElementIdentityCard(from: decoder)
            self = .inputPassportElementIdentityCard(value)
        case .inputPassportElementInternalPassport:
            let value = try InputPassportElementInternalPassport(from: decoder)
            self = .inputPassportElementInternalPassport(value)
        case .inputPassportElementAddress:
            let value = try InputPassportElementAddress(from: decoder)
            self = .inputPassportElementAddress(value)
        case .inputPassportElementUtilityBill:
            let value = try InputPassportElementUtilityBill(from: decoder)
            self = .inputPassportElementUtilityBill(value)
        case .inputPassportElementBankStatement:
            let value = try InputPassportElementBankStatement(from: decoder)
            self = .inputPassportElementBankStatement(value)
        case .inputPassportElementRentalAgreement:
            let value = try InputPassportElementRentalAgreement(from: decoder)
            self = .inputPassportElementRentalAgreement(value)
        case .inputPassportElementPassportRegistration:
            let value = try InputPassportElementPassportRegistration(from: decoder)
            self = .inputPassportElementPassportRegistration(value)
        case .inputPassportElementTemporaryRegistration:
            let value = try InputPassportElementTemporaryRegistration(from: decoder)
            self = .inputPassportElementTemporaryRegistration(value)
        case .inputPassportElementPhoneNumber:
            let value = try InputPassportElementPhoneNumber(from: decoder)
            self = .inputPassportElementPhoneNumber(value)
        case .inputPassportElementEmailAddress:
            let value = try InputPassportElementEmailAddress(from: decoder)
            self = .inputPassportElementEmailAddress(value)
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: DtoCodingKeys.self)
        switch self {
        case let .inputPassportElementPersonalDetails(value):
            try container.encode(Kind.inputPassportElementPersonalDetails, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementPassport(value):
            try container.encode(Kind.inputPassportElementPassport, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementDriverLicense(value):
            try container.encode(Kind.inputPassportElementDriverLicense, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementIdentityCard(value):
            try container.encode(Kind.inputPassportElementIdentityCard, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementInternalPassport(value):
            try container.encode(Kind.inputPassportElementInternalPassport, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementAddress(value):
            try container.encode(Kind.inputPassportElementAddress, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementUtilityBill(value):
            try container.encode(Kind.inputPassportElementUtilityBill, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementBankStatement(value):
            try container.encode(Kind.inputPassportElementBankStatement, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementRentalAgreement(value):
            try container.encode(Kind.inputPassportElementRentalAgreement, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementPassportRegistration(value):
            try container.encode(Kind.inputPassportElementPassportRegistration, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementTemporaryRegistration(value):
            try container.encode(Kind.inputPassportElementTemporaryRegistration, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementPhoneNumber(value):
            try container.encode(Kind.inputPassportElementPhoneNumber, forKey: .type)
            try value.encode(to: encoder)
        case let .inputPassportElementEmailAddress(value):
            try container.encode(Kind.inputPassportElementEmailAddress, forKey: .type)
            try value.encode(to: encoder)
        }
    }
}

/// A Telegram Passport element to be saved containing the user's personal details
internal struct InputPassportElementPersonalDetails: Codable {
    /// Personal details of the user
    internal let personalDetails: PersonalDetails

    internal init(personalDetails: PersonalDetails) {
        self.personalDetails = personalDetails
    }
}

/// A Telegram Passport element to be saved containing the user's passport
internal struct InputPassportElementPassport: Codable {
    /// The passport to be saved
    internal let passport: InputIdentityDocument

    internal init(passport: InputIdentityDocument) {
        self.passport = passport
    }
}

/// A Telegram Passport element to be saved containing the user's driver license
internal struct InputPassportElementDriverLicense: Codable {
    /// The driver license to be saved
    internal let driverLicense: InputIdentityDocument

    internal init(driverLicense: InputIdentityDocument) {
        self.driverLicense = driverLicense
    }
}

/// A Telegram Passport element to be saved containing the user's identity card
internal struct InputPassportElementIdentityCard: Codable {
    /// The identity card to be saved
    internal let identityCard: InputIdentityDocument

    internal init(identityCard: InputIdentityDocument) {
        self.identityCard = identityCard
    }
}

/// A Telegram Passport element to be saved containing the user's internal passport
internal struct InputPassportElementInternalPassport: Codable {
    /// The internal passport to be saved
    internal let internalPassport: InputIdentityDocument

    internal init(internalPassport: InputIdentityDocument) {
        self.internalPassport = internalPassport
    }
}

/// A Telegram Passport element to be saved containing the user's address
internal struct InputPassportElementAddress: Codable {
    /// The address to be saved
    internal let address: Address

    internal init(address: Address) {
        self.address = address
    }
}

/// A Telegram Passport element to be saved containing the user's utility bill
internal struct InputPassportElementUtilityBill: Codable {
    /// The utility bill to be saved
    internal let utilityBill: InputPersonalDocument

    internal init(utilityBill: InputPersonalDocument) {
        self.utilityBill = utilityBill
    }
}

/// A Telegram Passport element to be saved containing the user's bank statement
internal struct InputPassportElementBankStatement: Codable {
    /// The bank statement to be saved
    internal let bankStatement: InputPersonalDocument

    internal init(bankStatement: InputPersonalDocument) {
        self.bankStatement = bankStatement
    }
}

/// A Telegram Passport element to be saved containing the user's rental agreement
internal struct InputPassportElementRentalAgreement: Codable {
    /// The rental agreement to be saved
    internal let rentalAgreement: InputPersonalDocument

    internal init(rentalAgreement: InputPersonalDocument) {
        self.rentalAgreement = rentalAgreement
    }
}

/// A Telegram Passport element to be saved containing the user's passport registration
internal struct InputPassportElementPassportRegistration: Codable {
    /// The passport registration page to be saved
    internal let passportRegistration: InputPersonalDocument

    internal init(passportRegistration: InputPersonalDocument) {
        self.passportRegistration = passportRegistration
    }
}

/// A Telegram Passport element to be saved containing the user's temporary registration
internal struct InputPassportElementTemporaryRegistration: Codable {
    /// The temporary registration document to be saved
    internal let temporaryRegistration: InputPersonalDocument

    internal init(temporaryRegistration: InputPersonalDocument) {
        self.temporaryRegistration = temporaryRegistration
    }
}

/// A Telegram Passport element to be saved containing the user's phone number
internal struct InputPassportElementPhoneNumber: Codable {
    /// The phone number to be saved
    internal let phoneNumber: String

    internal init(phoneNumber: String) {
        self.phoneNumber = phoneNumber
    }
}

/// A Telegram Passport element to be saved containing the user's email address
internal struct InputPassportElementEmailAddress: Codable {
    /// The email address to be saved
    internal let emailAddress: String

    internal init(emailAddress: String) {
        self.emailAddress = emailAddress
    }
}
