// The Swift Programming Language
// https://docs.swift.org/swift-book

/// A macro that produces both a value and a string containing the
/// source code that generated the value. For example,
///
///     #stringify(x + y)
///
/// produces a tuple `(x + y, "x + y")`.
@freestanding(expression)
public macro stringify<T>(_ value: T) -> (T, String) = #externalMacro(
    module: "AutowireMacros",
    type: "StringifyMacro"
)

@attached(peer, names: prefixed(_))
public macro Memoize() = #externalMacro(
    module: "AutowireMacros",
    type: "MemoizeMacro"
)

//@attached(peer, names: arbitrary)
//public macro Memoize<T>() = #externalMacro(
//    module: "AutowireMacros",
//    type: "MemoizeTMacro"
//)
