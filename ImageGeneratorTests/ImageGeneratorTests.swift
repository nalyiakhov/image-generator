//
//  ImageGeneratorTests.swift
//  ImageGeneratorTests
//
//  Created by Nurgun Nalyiakhov on 25.05.2023.
//

import XCTest
@testable import ImageGenerator

final class ImageGeneratorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHasEmptyFavorites() {
        let favoriteImages = sharedfavoriteImages
        XCTAssertTrue(!favoriteImages.contains(where: { !$0.isNotBlank() }), "Has empty favorites")
    }

    func testHasMissingImage() {
        for imageName in sharedfavoriteImages {
            let favoriteImage = FavoriteImage(fileName: imageName)
            XCTAssertNotNil(favoriteImage.image, "Has missing favorite image - \(imageName)")
        }
    }

}
