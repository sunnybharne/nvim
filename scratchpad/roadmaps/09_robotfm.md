# Robot Framework Learning Plan

A structured, phase-by-phase guide to learning test automation with Robot Framework using its official documentation. Ideal for testers, Python devs, and QA engineers looking to write readable, maintainable automated tests.

---

## Resources

- [Robot Framework Official Site](https://robotframework.org/)
- [User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [BuiltIn Library Docs](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html)
- [Browser Library Docs](https://robotframework.org/robotframework/latest/libraries/Browser.html)
- [Robot Framework GitHub](https://github.com/robotframework)

---

## Tips for Success

- Keep tests human-readable using keywords.
- Structure your tests: use resources, variables, and test setup/teardown wisely.
- Start with CLI, then use IDEs like VS Code or RIDE.
- Use #RobotFramework, #TestAutomation, and #PythonTesting on LinkedIn to share progress.

---

## Phase-by-Phase Learning

### Phase 1: Setup & Syntax Basics (Week 1)
- **Topics:**
  - Installing Robot Framework + VS Code extension
  - Understanding `.robot` file structure
  - Running tests from CLI
- **Projects:**
  - Hello World Test Suite
  - Smoke test for a sample app
  - Test with variable and keyword usage
- **LinkedIn Post:**
  "Started learning Robot Framework! Wrote my first test suite using plain English keywords 🔍✅"

---

### Phase 2: Variables, Keywords & Resource Files (Week 2)
- **Topics:**
  - Scalar, list, and dictionary variables
  - Creating and importing custom keywords
  - Reusable test resources
- **Projects:**
  - Calculator keyword library
  - Resource file for login/logout
  - Shared test suite with global variables
- **LinkedIn Post:**
  "Practicing reusability in Robot Framework — created custom keywords and a shared resource library 🧩"

---

### Phase 3: Control Structures & BuiltIn Library (Week 3)
- **Topics:**
  - IF/ELSE, FOR loops, RETURN
  - Error handling with `Run Keyword And Continue On Failure`
  - Using BuiltIn keywords
- **Projects:**
  - Loop-based test for multiple users
  - Conditional login validation
  - Retry test for flaky scenarios
- **LinkedIn Post:**
  "Learning control flow in Robot Framework — built test cases with loops, conditions, and retries 🔁✅"

---

### Phase 4: Web Testing with Browser Library (Weeks 4–5)
- **Topics:**
  - Installing Browser library (Playwright-based)
  - Locators and selectors
  - Interacting with web elements (click, input, wait)
- **Projects:**
  - Google search test
  - Login + form submission test
  - End-to-end flow for a web app
- **LinkedIn Post:**
  "Built my first automated browser test with Robot Framework! Browser library + Playwright is 🔥"

---

### Phase 5: Data-Driven Testing (Week 6)
- **Topics:**
  - Using variables from test cases
  - Test templates
  - Running tests with multiple inputs
- **Projects:**
  - Login tests with multiple credentials
  - Form validation with parameterized inputs
  - Data-driven product search tests
- **LinkedIn Post:**
  "Built data-driven tests using Robot Framework templates — test once, run many! 🧪📊"

---

### Phase 6: Integration with Python & APIs (Week 7)
- **Topics:**
  - Writing Python-based custom keywords
  - Calling REST APIs (using `RequestsLibrary`)
  - Combining UI + API testing
- **Projects:**
  - Custom Python library for date validation
  - Weather API test suite
  - Hybrid test with frontend + backend checks
- **LinkedIn Post:**
  "Wrote custom Python keywords for Robot Framework — combined UI and API testing like a pro 🧠💻"

---

### Phase 7: Test Organization, Reports & CI (Week 8)
- **Topics:**
  - Suite setup/teardown
  - Output.xml, log.html, report.html
  - Integrating with GitHub Actions or Jenkins
- **Projects:**
  - Organized test folder structure
  - Upload test reports to CI
  - Create badges and automation status
- **LinkedIn Post:**
  "Automated tests + reports + CI = 💥 Just integrated my Robot Framework tests with GitHub Actions for auto runs!"

---

### Phase 8: Capstone Project
- **Goal:** Create a full test automation suite for a real web application
- **Ideas:**
  - Test a blog platform (login, post, comment)
  - E-commerce flow (search, add to cart, checkout)
  - Hybrid app: login via API, test via UI
- **LinkedIn Post:**
  "Wrapped up my Robot Framework capstone — a fully automated test suite with API, UI, and CI workflows. Repo is live!"

---

## What’s Next After Robot Framework?

- Learn SeleniumLibrary or AppiumLibrary for mobile testing
- Extend with Python-based custom libraries
- Integrate with TestRail or Allure for advanced reporting
- Contribute to Robot Framework plugins or tooling
