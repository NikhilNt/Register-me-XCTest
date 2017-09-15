//
//  RegisterMePositiveTests.swift
//  RegisterMe
//
//  Created by  Nikhil Tanappagol on 12/6/16.
//  Copyright © 2016  Nikhil Tanappagol. All rights reserved.
//

import XCTest

class RegisterMePositiveTests: testCommons{
        
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
    
    func testRegistrationPassesForNewUsersWithvalidNameAndEmail()
    {
        enterName(name: "AutoUser55")
        enterEmail(email: "autouser55@test.com")
        clickSubmitButton()
        sleep(5)
        
        let link_exists = doesConfirmationLinkExists()
        
        if(link_exists)
        {
            clickOnConfirmationLink()
        }
        
        XCTAssertTrue(link_exists)
    }
    
   /*
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
 */
 
}
