//
//  File.swift
//  
//
//  Created by Damiaan on 10/02/2020.
//

import Foundation

let wordPattern = #"\w*"#
let wordExpression = try! NSRegularExpression(pattern: wordPattern, options: .useUnicodeWordBoundaries)

extension String {
	var words: [Range<String.Index>] {
		let range = NSRange(startIndex..<endIndex, in: self)
		var result = [Range<String.Index>]()
		wordExpression.enumerateMatches(in: self, options: [], range: range) { (match, flags, stop) in
			if let match = match, let wordRange = Range(match.range, in: self), wordRange.lowerBound != wordRange.upperBound {
				result.append( wordRange )
			}
		}
		return result
	}

	var normalized: String {
		folding(
			options: [.caseInsensitive, .diacriticInsensitive, .widthInsensitive],
			locale: nil
		)
	}
}
