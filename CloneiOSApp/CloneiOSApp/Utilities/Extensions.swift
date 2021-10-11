//
//  Extensions.swift
//  CloneiOSApp
//
//  Created by 백동열 on 2021/08/07.
//

import SwiftUI
import SwiftyChat

extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        else {
            throw NSError()
        }
        return dictionary
    }
    
}

extension Decodable {
    init(fromDictionary: Any) throws {
        let data = try JSONSerialization.data(withJSONObject: fromDictionary, options: .prettyPrinted)
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: data)
    }
}

extension String {
    func splitString() -> [String] {
        var stringArray: [String] = []
        let trimmed = String(self.filter { !"\n\t\r".contains($0)})
        
        for (index, _) in trimmed.enumerated() {
            let prefixIndex = index + 1
            let substringPrefix = String(trimmed.prefix(prefixIndex)).lowercased()
            stringArray.append(substringPrefix)
        }
        return stringArray
    }
    
    func removeWhiteSpace() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}

extension Date {
    func timeAgo() -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.year, .month, .day, .hour, .minute, .second]
        formatter.zeroFormattingBehavior = .dropAll
        formatter.maximumUnitCount = 1
        return String(format: formatter.string(from: self, to: Date()) ?? "", locale: .current)
    }
}

let futuraFont = Font.custom("Futura", size: 17)

internal extension ChatMessageCellStyle {
    
    static let basicStyle = ChatMessageCellStyle(
        incomingTextStyle: .init(
            textStyle: .init(textColor: .black, font: futuraFont),
            textPadding: 16,
            attributedTextStyle: .init(textColor: .black),
            cellBackgroundColor: Color(#colorLiteral(red: 0.7861273885, green: 0.7897668481, blue: 0.7986581922, alpha: 1)),
            cellBorderWidth: 0,
            cellShadowRadius: 0
        ),
        outgoingTextStyle: .init(
            textStyle: .init(textColor: .white, font: futuraFont),
            textPadding: 16,
            cellBackgroundColor: Color(#colorLiteral(red: 0.1405690908, green: 0.1412397623, blue: 0.25395751, alpha: 1)),
            cellBorderWidth: 0,
            cellShadowRadius: 0
        ),
        incomingAvatarStyle: .init(imageStyle: .init(imageSize: .zero))
    )
    
}


