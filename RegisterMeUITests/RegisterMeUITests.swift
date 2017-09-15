//
//  RegisterMeUITests.swift
//  RegisterMeUITests
//
//  Created by Alpa Sanghavi on 11/19/16.
//  Copyright © 2016 Alpa Sanghavi. All rights reserved.
//

import XCTest

class RegisterMeUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    func getTextFromDefaultLabel() -> String
    {
        let default_label = app.staticTexts["auto_default_label"]
        
        return default_label.label
        
    }
    
    func enterName(name : String)
    {
        let name_textField = app.textFields["auto_name"]
        name_textField.tap()
        
        let clear_text_button = name_textField.buttons["Clear text"]
        
        let current_value = name_textField.value as! String
        
        if(!(current_value.isEmpty))
        {
            clear_text_button.tap()
        }
        name_textField.typeText(name)
        sleep(1)
    }
    

    func enterEmail(email : String)
    {
        let email_textField = app.textFields["auto_email"]
        email_textField.tap()
        
        let clear_text_button = email_textField.buttons["Clear text"]
        
        let current_value = email_textField.value as! String
        
        if(!(current_value.isEmpty))
        {
            clear_text_button.tap()
        }
        email_textField.typeText(email)
      
        sleep(1)
        
    }
    
    
    func clickSubmitButton()
    {
        let button_submit = app.buttons["auto_submit"]
        
        button_submit.tap()
        sleep(3)
    }
    
    
    func doesConfirmationLinkExists() -> Bool
    {
        let registration_link = app.links["Confirm Registration"]
        
        if(registration_link.exists)
        {
            return true
        }
        else{
            return false
        }
    }
    
    func clickOnConfirmationLink()
    {
        app.links["Confirm Registration"].tap()
    }
    
    
    
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
    
    func testRegistrationPassesForNewUsersWithvalidNameAndEmail()
    {
        enterName(name: "AutoUser55")
        enterEmail(email: "autouser55@test.com")
        clickSubmitButton()
        
        let link_exists = doesConfirmationLinkExists()
        
        if(link_exists)
        {
            clickOnConfirmationLink()
        }
        
        XCTAssertTrue(link_exists)
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
    
    func testRetrySuccessfulWithNewEmail()
    {
        let user_name = "AutoUser99"
        let user_email = ""
        enterName(name: user_name)
        enterEmail(email: user_email)
        clickSubmitButton()
        
        let default_label_text = getTextFromDefaultLabel()
        
        if(!(default_label_text.isEmpty))
        {
            enterName(name: user_name)
            enterEmail(email: "autouser99@test.com")
            clickSubmitButton()
        }
        
        XCTAssertTrue(doesConfirmationLinkExists())
        
    }
    
    
    func testRetrySuccessfulWithNewName()
    {
        let user_name = ""
        let user_email = "autouser88@test.com"
        
        enterName(name: user_name)
        enterEmail(email: user_email)
        clickSubmitButton()
        
        let default_label_text = getTextFromDefaultLabel()
        
        if(!(default_label_text.isEmpty))
        {
            enterName(name: "AutoUser88")
            enterEmail(email: user_email)
            clickSubmitButton()
        }
        
        XCTAssertTrue(doesConfirmationLinkExists())
        
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
    
    
    func testTextFieldForNameStartingWithSpace()
    {
        let user_name = " autouser10"
        let user_email = "autouser10@test.com"
        
        enterName(name: user_name)
        enterEmail(email: user_email)
        clickSubmitButton()
        
        let default_label_text = getTextFromDefaultLabel()
        
        XCTAssertTrue(default_label_text.isEmpty)
        
    }
    
    func testTextFieldForNameEndingWithSpace()
    {
        let user_name = "autouser22 "
        let user_email = "autouser22@gmail.com"
        
        enterName(name: user_name)
        enterEmail(email: user_email)
        clickSubmitButton()
        
        let default_label_text = getTextFromDefaultLabel()
        
        XCTAssertTrue(default_label_text.isEmpty)
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
