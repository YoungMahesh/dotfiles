---
description: Review staged code in git
---

// turbo-all

1. List the files that are currently staged for commit.
run_command: git diff --cached --name-only

2. Get the full diff of all staged changes to understand the content of the proposed commit.
run_command: git diff --cached

3. Perform a comprehensive review of the changes, evaluating:
   - **Logic & Reliability**: Are there any bugs, edge cases not handled, or potential runtime errors?
   - **Security**: Are there any hardcoded secrets, insecure patterns, or potential vulnerabilities?
   - **Maintainability**: Is the code clear, well-named, and easy to understand?
   - **Modern Practices**: Does the code use modern language features and patterns?
   - **Performance**: Are there any obvious performance bottlenecks or inefficient operations?
   - **Cleanup**: Are there any debug statements, unused code, or redundant comments?

4. Provide a structured review summary with prioritized feedback (Critical, Important, Minor).
