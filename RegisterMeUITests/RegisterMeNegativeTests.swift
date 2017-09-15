//
//  RegisterMeNegativeTests.swift
//  RegisterMe
//
//  Created by Nikhil Tanappagol on 12/6/16.
//  Copyright © 2016  Nikhil Tanappagol. All rights reserved.
//

import XCTest

class RegisterMeNegativeTests: testCommons {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTextFieldForNameWithAnEmptyString()
    {
        enterName(name: "")
        enterEmail(email: "auto@test.com")
        clickSubmitButton()
        
        let default_label_text = getTextFromDefaultLabel()
        
        XCTAssertTrue(!(default_label_text.isEmpty))
    }
    
    
    func testTextFieldForEmailWithAnEmptyString()
    {
        enterName(name: "AutoUser10")
        enterEmail(email: "")
        clickSubmitButton()
        
        let default_label_text = getTextFromDefaultLabel()
        XCTAssertTrue(!(default_label_text.isEmpty))
        
    }
    
    
    func testTextFieldsEmailAndNameBothEmpty()
    {
        enterName(name: "")
        enterEmail(email: "")
        clickSubmitButton()
        
        let default_label_text = getTextFromDefaultLabel()
        
        XCTAssertTrue(!(default_label_text.isEmpty))
    }
    
    func testRegistrationFailsForExistingUser()
    {
        let user_name = "AutoUser22"
        let user_email = "autouser22@test.com"
        enterName(name: user_name)
        enterEmail(email: user_email)
        clickSubmitButton()
        
        if(doesConfirmationLinkExists())
        {
            enterName(name: user_name)
            enterEmail(email: user_email)
            clickSubmitButton()
        }
        XCTAssertFalse(doesConfirmationLinkExists())
        
    }
    
    func testTextFieldForNameStartingWithNumber()
    {
        let user_name = "1autouser"
        let user_email = "1autouser@test.com"
        enterName(name: user_name)
        enterEmail(email: user_email)
        clickSubmitButton()
        
        let default_label_text = getTextFromDefaultLabel()
        
        XCTAssertTrue(!(default_label_text.isEmpty))
        
    }
    
    func testTextFieldForNameStartingWithSpecialCharacter()
    {
        let user_name = "$autouser10"
        let user_email = "autouser10@test.com"
        
        enterName(name: user_name)
        enterEmail(email: user_email)
        clickSubmitButton()
        
        let default_label_text = getTextFromDefaultLabel()
        
        XCTAssertTrue(!(default_label_text.isEmpty))
        
    }
    
    
    func testInvalidEmailAddress()
    {
        let user_name = "autouser44"
        let user_email = "autouser44"
        
        enterName(name: user_name)
        enterEmail(email: user_email)
        clickSubmitButton()
        
        let default_label_text = getTextFromDefaultLabel()
        
        XCTAssertTrue(!(default_label_text.isEmpty))
    }
    
    
}
