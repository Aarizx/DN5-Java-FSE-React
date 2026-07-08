# Spring Learn - Hands On 1

## Name
Spring Learn

## Group
com.cognizant

## Artifact
spring-learn

---

# Objective

Create a Spring Boot Web project using Maven and understand the project structure, Spring Boot application startup, Maven configuration, and dependency management.

---

# Project Structure

## src/main/java

Contains all Java source files of the application.

Example:

- SpringLearnApplication.java

---

## src/main/resources

Contains application configuration files.

Example:

- application.properties

---

## src/test/java

Contains JUnit test classes used for testing the application.

---

# SpringLearnApplication.java

This is the main class of the Spring Boot application.

```java
public static void main(String[] args) {
    SpringApplication.run(SpringLearnApplication.class, args);
}
```

The `main()` method starts the Spring Boot application, creates the Spring container, and starts the embedded Tomcat server.

---

# @SpringBootApplication

`@SpringBootApplication` is a combination of:

- @SpringBootConfiguration
- @EnableAutoConfiguration
- @ComponentScan

It enables auto-configuration and component scanning for the application.

---

# pom.xml

The `pom.xml` file is used by Maven to manage the project.

Important dependencies:

- spring-boot-starter-web
- spring-boot-devtools
- spring-boot-starter-test

Plugin used:

- spring-boot-maven-plugin

---

# Logging

Added logging statements in the main method.

```java
LOGGER.info("START");

SpringApplication.run(SpringLearnApplication.class, args);

LOGGER.info("END");
```

This verifies that the application starts successfully.

---

# Build

Command used:

```bash
.\mvnw clean package
```

Result:

```
BUILD SUCCESS
```

---

# Dependency Tree

Generated using:

```bash
.\mvnw dependency:tree
```

This displays all Maven dependencies used in the project.

---

# Output

- Application built successfully.
- Embedded Tomcat started on port 8080.
- Logging displayed START and END.