//
//  ImageGeneratorUITests.swift
//  ImageGeneratorUITests
//
//  Created by Nurgun Nalyiakhov on 25.05.2023.
//

import XCTest
@testable import ImageGenerator

final class ImageGeneratorUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        let generatorButton = app.buttons.element(matching: XCUIElement.ElementType.button, identifier: "generatorButton")
        XCTAssertTrue(generatorButton.exists, "Unable to find Generator button")
        generatorButton.tap()
        
        let generatorTextField = app.textFields.element(matching: XCUIElement.ElementType.textField, identifier: "generateText")
        XCTAssertTrue(generatorTextField.exists, "Unable to find Query text field")
        generatorTextField.tap()
        generatorTextField.typeText("Test text")
        
        let generateButton = app.buttons.element(matching: XCUIElement.ElementType.button, identifier: "generateButton")
        XCTAssertTrue(generateButton.exists, "Unable to find Generate button")
        generateButton.tap()

        let generatedImage = app.images.element(matching: XCUIElement.ElementType.image, identifier: "generatedImage")
        XCTAssertTrue(generatedImage.waitForExistence(timeout: 5))

        let favoriteButton = app.buttons.element(matching: XCUIElement.ElementType.button, identifier: "favoriteButton")
        XCTAssertTrue(favoriteButton.exists, "Unable to find Favorite button")
        favoriteButton.tap()

        let favoritesTabButton = app.buttons.element(matching: XCUIElement.ElementType.button, identifier: "favoritesButton")
        XCTAssertTrue(favoritesTabButton.exists, "Unable to find Favorites tab button")
        favoritesTabButton.tap()
        
        let noImagesLabel = app.staticTexts.element(matching: XCUIElement.ElementType.any, identifier: "emptyLabel")
        XCTAssertTrue(!noImagesLabel.exists, "Favorites is empty")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
