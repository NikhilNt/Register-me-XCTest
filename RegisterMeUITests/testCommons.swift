//
//  testCommons.swift
//  RegisterMe
//
//  Created by Nikhil Tanappagol on 12/6/16.
//  Copyright © 2016  Nikhil Tanappagol All rights reserved.
//

import XCTest

class testCommons: XCTestCase {
        
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
    
    
    
}
