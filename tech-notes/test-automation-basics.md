# Test Automation

## Overview
This document provides a comprehensive guide to test automation fundamentals, focusing on Selenium WebDriver and related technologies. It covers essential concepts, best practices, and practical implementations.

## Table of Contents
1. [Selenium WebDriver Basics](#selenium-webdriver-basics)
2. [Element Locators](#element-locators)
3. [WebDriver Commands](#webdriver-commands)
4. [Advanced Interactions](#advanced-interactions)
5. [Wait Mechanisms](#wait-mechanisms)
6. [Exception Handling](#exception-handling)
7. [Best Practices](#best-practices)

## Selenium WebDriver Basics

### Architecture Overview
Selenium WebDriver follows a client-server architecture:
- WebDriver Client (Test Script)
- WebDriver Server (Browser Driver)
- Browser

### Same Origin Policy
The Same Origin Policy is a critical security concept in web browsers that restricts JavaScript code from accessing elements from different domains. For example:
- JavaScript code from `www.google.com` can only access pages within the `google.com` domain
- It cannot access pages from different domains like `yahoo.com` or `guru99.com`

### WebDriver Setup
1. **Driver Installation**
   - ChromeDriver for Chrome
   - GeckoDriver for Firefox
   - EdgeDriver for Edge
   - SafariDriver for Safari

2. **Basic Configuration**
```typescript
import { Builder, WebDriver } from 'selenium-webdriver';
import chrome from 'selenium-webdriver/chrome';

const driver: WebDriver = await new Builder()
    .forBrowser('chrome')
    .setChromeOptions(new chrome.Options().windowSize({ width: 1920, height: 1080 }))
    .build();
```

## Element Locators

### Primary Locator Strategies
1. **ID**
```typescript
const element = await driver.findElement(By.id('elementId'));
```

2. **CSS Selector**
```typescript
// Basic syntax
css=tag#id
css=tag.class
css=tag[attribute=value]

// Advanced selectors
css=tag.class[attribute=value]
css=tag:contains("inner text")
css=select#oldSelectMenu>option:nth-of-type(2)
css=input[id^='userN']
css=input[id$='ame']
css=input[id*='ame']
```

3. **XPath**
```typescript
// Basic syntax
Xpath=//tagname[@attribute='value']
Xpath=//td[text()='UserID']

// Advanced XPath
Xpath=//*[contains(@type,'sub')]
Xpath=//*[contains(text(),'here')]
Xpath=//*[@type='submit' or @name='btnReset']
Xpath=//*[@type='submit' and @name='btnLogin']
```

4. **DOM Locators**
```typescript
document.getElementById("elementId")
document.getElementsByName("elementName")
document.getElementsByClassName("className")
```

## WebDriver Commands

### Navigation Commands
```typescript
await driver.get('https://www.example.com');
await driver.navigate().to('https://www.example.com');
await driver.navigate().back();
await driver.navigate().forward();
await driver.navigate().refresh();
```

### Element Interaction Commands
```typescript
// Click operations
await element.click();
await element.submit();

// Text input
await element.sendKeys('text');
await element.clear();

// Element state
await element.isEnabled();
await element.isDisplayed();
await element.isSelected();
```

## Advanced Interactions

### Handling Alerts
```typescript
// Alert interactions
const alert = await driver.switchTo().alert();
await alert.accept();
await alert.dismiss();
const alertText = await alert.getText();
await alert.sendKeys('text');
```

### Working with Dropdowns
```typescript
import { Select } from 'selenium-webdriver';

const dropdown = new Select(element);
await dropdown.selectByVisibleText('Option');
await dropdown.selectByValue('value');
await dropdown.selectByIndex(0);
```

### Window Handling
```typescript
// Get window handles
const mainWindow = await driver.getWindowHandle();
const allWindows = await driver.getAllWindowHandles();

// Switch between windows
await driver.switchTo().window(windowHandle);
```

## Wait Mechanisms

### Implicit Wait
```typescript
await driver.manage().setTimeouts({ implicit: 10000 });
```

### Explicit Wait
```typescript
import { WebDriverWait, until, By } from 'selenium-webdriver';

const wait = new WebDriverWait(driver, 10000);
await wait.until(until.elementLocated(By.id('elementId')));
```

### Fluent Wait
```typescript
import { WebDriverWait, until, By } from 'selenium-webdriver';

const wait = new WebDriverWait(driver, 30000);
await wait
    .pollingEvery(5000)
    .ignoring(NoSuchElementError)
    .until(until.elementLocated(By.id('elementId')));
```

## Exception Handling

### Common Selenium Exceptions
1. **ElementNotVisibleError**
   - Occurs when an element exists in DOM but is hidden

2. **NoSuchElementError**
   - Occurs when an element cannot be found in the DOM

3. **TimeoutError**
   - Thrown when a command doesn't complete within the specified time

4. **StaleElementReferenceError**
   - Occurs when the element is detached from the DOM

5. **WebDriverError**
   - Base exception for WebDriver errors

### Exception Handling Best Practices
```typescript
try {
    const element = await driver.findElement(By.id('elementId'));
    await element.click();
} catch (error) {
    if (error instanceof NoSuchElementError) {
        // Handle element not found
    } else if (error instanceof TimeoutError) {
        // Handle timeout
    } else if (error instanceof WebDriverError) {
        // Handle other WebDriver exceptions
    }
}
```

## Best Practices

### Test Design
1. Use Page Object Model
2. Implement proper wait mechanisms
3. Handle dynamic elements effectively
4. Use meaningful locators

### Code Organization
1. Separate test data from test logic
2. Implement proper logging
3. Use configuration files
4. Follow TypeScript best practices

### Performance Optimization
1. Minimize wait times
2. Use efficient locators
3. Implement parallel execution
4. Optimize test data

## Resources
- [Selenium Official Documentation](https://www.selenium.dev/documentation/)
- [Selenium WebDriver API](https://www.selenium.dev/selenium/docs/api/javascript/)
- [Test Automation Best Practices](https://www.selenium.dev/documentation/test_practices/)
