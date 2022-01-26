//
//  DeserializableWithContext.swift
//  Outlaw
//
//  Created by Brian Mullen on 11/15/16.
//  Copyright © 2016 Molbie LLC. All rights reserved.
//

import Foundation


public protocol DeserializableWithContext: Outlaw.ValueWithContext {
    init(object: Outlaw.Extractable, using context: Context) throws
}

extension DeserializableWithContext {
    public static func value(from object: Any, using context: Context) throws -> ValueType {
        guard let objectValue = object as? Outlaw.Extractable else {
            throw OutlawError.typeMismatch(expected: Outlaw.Extractable.self, actual: type(of: object))
        }
        guard let value = try self.init(object: objectValue, using: context) as? ValueType else {
            throw OutlawError.typeMismatch(expected: ValueType.self, actual: type(of: object))
        }
        return value
    }
}
