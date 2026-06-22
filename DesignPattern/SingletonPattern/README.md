# Singleton Pattern

## Objective
Implement the Singleton Design Pattern to ensure that only one instance of the Logger class exists throughout the application lifecycle.

## Scenario
A logging utility class should have only one instance to maintain consistent logging across the application.

## Files
- Logger.java
- TestLogger.java

## Implementation
- Created a private static instance of Logger.
- Made the constructor private.
- Provided a public static getInstance() method.
- Verified that multiple calls return the same object.

## Output

```text
Logger instance created
LOG: Application Started
LOG: User Logged In
Singleton Pattern Verified: Only one instance exists
```

## Output Screenshot

![Output](ex-1_SinglrTon Output ScreenShot.png)

## Result
Singleton Pattern implemented successfully.