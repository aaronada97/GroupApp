//
//  String.swift
//  LoginPage
//
//  Created by user242205 on 7/22/23.
//

import Foundation

extension String {
    func isValidUsername() -> Bool{
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z][a-zA-Z0-9]{2,15}$",
                                             options: .caseInsensitive)
        return regex.firstMatch(in: self, range: NSRange(location: 0, length: count)) != nil
    }
}
