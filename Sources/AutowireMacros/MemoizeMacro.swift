//
//  MemoizeMacro.swift
//
//
//  Created by Joel McCance on 12/21/23.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct MemoizeMacro: PeerMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingPeersOf declaration: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let declaration = declaration.as(VariableDeclSyntax.self),
              let binding = declaration.bindings.first,
              let identifier = binding.pattern.as(IdentifierPatternSyntax.self),
              let type = binding.typeAnnotation?.type
        else {
            throw MemoizeError.onlyVariable
        }
        
        return [
            """
            func _\(identifier)() -> \(type) {
                \(identifier)
            }
            """
        ]
    }
}

enum MemoizeError: Error, CustomStringConvertible {
    case onlyVariable
    
    var description: String {
        switch self {
        case .onlyVariable: return "@Memoize can only be attached to variables."
        }
    }
}
