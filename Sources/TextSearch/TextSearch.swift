import Foundation

public protocol Searchable {
	static var fields: [KeyPath<Self,String>] { get }
}

public class Index<Element: Searchable, Key: Hashable> {
	var index: [String: [Key: [Range<String.Index>]]]

	init() {
		index = [:]
	}

	func add(element: Element, for key: Key) {
		for field in Element.fields {
			let string = element[keyPath: field]

			for wordRange in string.words {
				let word = String(string[wordRange]).normalized
				if index.keys.contains(word) {
					if index[word]!.keys.contains(key) {
						index[word]![key]!.append(wordRange)
					} else {
						index[word]![key] = [wordRange]
					}
				} else {
					index[word] = [key: [wordRange]]
				}
			}
		}
	}

	public subscript(_ string: String) -> [Key: [Range<String.Index>]] {
		index[string.normalized] ?? [:]
	}
}

public class ArrayIndex<Element: Searchable>: Index<Element, Int> {
	public init(array: [Element]) {
		super.init()
		for (index, element) in array.enumerated() {
			add(element: element, for: index)
		}
	}
}
