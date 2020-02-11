import XCTest
@testable import TextSearch

extension String: Searchable {
	public static var fields: [KeyPath<String, String>] {
		[\.self]
	}
}

final class TextSearchTests: XCTestCase {
    func testHelloWorld() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
		let sentence = "Hello world, this is me!"
		XCTAssertEqual(sentence.words.map{String(sentence[$0])}, ["Hello", "world", "this", "is", "me"])
    }

	func testSearchInLorem() {
		let index = ArrayIndex(array: lorem)
		XCTAssertEqual(index["Dolor"].reduce(into: 0, {$0 += $1.value.count}), 2)
		XCTAssertEqual(index["sed"].reduce(into: 0, {$0 += $1.value.count}), 19)
	}

	func testSpecialLetter() {
		XCTAssertEqual("één".normalized, "een")
		let string = "één"
		let index = ArrayIndex(array: [string])
		let match = index["een"][0]![0]
		XCTAssertEqual(String(string[match]), string) 
	}

    static var allTests = [
        ("testHelloWorld", testHelloWorld),
		("testSearchInLorem", testSearchInLorem),
    ]
}

let lorem = [
	"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Aliquet bibendum enim facilisis gravida. Risus in hendrerit gravida rutrum quisque non. Aliquet risus feugiat in ante metus. Massa sed elementum tempus egestas sed. Ut venenatis tellus in metus vulputate eu scelerisque felis imperdiet. Vel eros donec ac odio tempor orci dapibus. Non quam lacus suspendisse faucibus interdum. In pellentesque massa placerat duis ultricies. Vulputate dignissim suspendisse in est. Consequat id porta nibh venenatis cras sed felis eget. Faucibus pulvinar elementum integer enim neque volutpat ac. Aenean vel elit scelerisque mauris pellentesque pulvinar pellentesque habitant morbi. Amet venenatis urna cursus eget nunc. Ipsum a arcu cursus vitae congue. Dictum fusce ut placerat orci nulla pellentesque dignissim enim sit. Quis risus sed vulputate odio ut. Ac ut consequat semper viverra nam libero. Consectetur lorem donec massa sapien faucibus et. Eget nunc lobortis mattis aliquam faucibus.",
	"Semper feugiat nibh sed pulvinar proin gravida. Risus sed vulputate odio ut enim. Parturient montes nascetur ridiculus mus mauris vitae ultricies leo. Et tortor at risus viverra adipiscing at. Aliquam vestibulum morbi blandit cursus risus at ultrices. Sapien eget mi proin sed libero enim sed. Quisque non tellus orci ac. Quam id leo in vitae turpis. Justo nec ultrices dui sapien eget mi proin. Sit amet consectetur adipiscing elit ut aliquam purus sit. Mauris sit amet massa vitae tortor condimentum lacinia quis. Tristique senectus et netus et malesuada fames ac turpis egestas. Fermentum posuere urna nec tincidunt praesent. Dolor sit amet consectetur adipiscing elit. Viverra adipiscing at in tellus. Viverra nam libero justo laoreet sit. Est ultricies integer quis auctor elit sed vulputate mi. Tincidunt ornare massa eget egestas purus viverra accumsan in nisl. Euismod quis viverra nibh cras. Id nibh tortor id aliquet.",
	"Quis lectus nulla at volutpat diam. Sapien nec sagittis aliquam malesuada bibendum arcu vitae elementum curabitur. Varius vel pharetra vel turpis nunc eget lorem. Senectus et netus et malesuada fames ac turpis egestas integer. Fames ac turpis egestas maecenas pharetra convallis posuere morbi. Consequat id porta nibh venenatis cras sed felis. Ut lectus arcu bibendum at. Scelerisque in dictum non consectetur a erat nam at lectus. Enim nunc faucibus a pellentesque. Sed augue lacus viverra vitae congue eu. Odio tempor orci dapibus ultrices in iaculis nunc sed. Leo a diam sollicitudin tempor id eu. Ullamcorper morbi tincidunt ornare massa eget egestas. Fermentum leo vel orci porta.",
	"Id semper risus in hendrerit gravida rutrum quisque non tellus. Enim facilisis gravida neque convallis a cras semper auctor. Blandit volutpat maecenas volutpat blandit aliquam etiam. Duis at consectetur lorem donec massa sapien faucibus. Sapien eget mi proin sed libero enim. Montes nascetur ridiculus mus mauris vitae ultricies leo integer. Urna nec tincidunt praesent semper feugiat nibh. Iaculis at erat pellentesque adipiscing commodo elit at imperdiet dui. Elit at imperdiet dui accumsan sit amet nulla. Mattis ullamcorper velit sed ullamcorper morbi tincidunt ornare massa eget. Facilisis leo vel fringilla est ullamcorper eget nulla facilisi etiam. Tortor condimentum lacinia quis vel eros donec ac odio tempor. Turpis egestas integer eget aliquet nibh praesent tristique. Risus quis varius quam quisque id. Lacus luctus accumsan tortor posuere. Pretium lectus quam id leo in vitae turpis. Enim diam vulputate ut pharetra sit amet.",
	"Nunc vel risus commodo viverra maecenas accumsan lacus vel. Ac ut consequat semper viverra nam libero. Euismod elementum nisi quis eleifend quam. Suspendisse sed nisi lacus sed. A scelerisque purus semper eget duis at tellus at. Cursus turpis massa tincidunt dui ut. Nulla aliquet enim tortor at auctor. Tortor condimentum lacinia quis vel. Fermentum leo vel orci porta non pulvinar neque laoreet. Non arcu risus quis varius quam quisque. Odio ut enim blandit volutpat. Duis convallis convallis tellus id interdum. Elit eget gravida cum sociis natoque. Amet mattis vulputate enim nulla. Vel quam elementum pulvinar etiam non quam. Nullam ac tortor vitae purus faucibus ornare suspendisse sed nisi. Libero justo laoreet sit amet cursus. Porta nibh venenatis cras sed felis. Curabitur gravida arcu ac tortor dignissim convallis aenean et tortor."
]
