# Day 4 - Real World DevOps Assignments

## Objective

Practice Package Management, Software Installation, Environment Variables, Functions and DevOps Automation using real-world scenarios.

---

# Module 1 - Package Management

## Assignment 1 - Git Installation Automation

### Scenario

A new Ubuntu server has been provisioned.

Developers need Git to clone repositories.

Write a script that:

- Checks if Git is installed
- Installs Git if missing
- Verifies installation

### Expected Outcome

```text
Git already installed
OR
Git installed successfully
```

### Solution

```text
git_installation.sh
```

---

## Assignment 2 - Java Installation Automation

### Scenario

A Java application needs to be deployed on a server.

Before deployment, Java must be installed.

Write a script that:

- Checks if Java is installed
- Installs Java if missing
- Verifies installation

### Expected Outcome

```text
Java already installed
OR
Java installed successfully
```

### Solution

```text
java_installation.sh
```

---

## Assignment 3 - Maven Installation Automation

### Scenario

A build server needs Maven to compile Java applications.

Write a script that:

- Checks if Maven is installed
- Installs Maven if missing
- Verifies installation

### Solution

```text
maven_installation.sh
```

---

## Assignment 4 - Build Server Setup

### Scenario

Your manager asks you to prepare a new Build Server.

Required software:

- Git
- Java
- Maven

Write a script that:

- Checks all required software
- Installs missing software
- Displays versions

### Solution

```text
build_server_setup.sh
```

---

# Module 2 - Software Installation

## Assignment 5 - Tomcat Installation

### Scenario

A Java Web Application must be hosted.

Install and configure Tomcat on a Linux server.

Script should:

- Verify Java
- Download Tomcat
- Extract package
- Rename folder
- Start Tomcat

### Expected Outcome

```text
Tomcat Started Successfully
```

### Solution

```text
tomcat_installation.sh
```

---

## Assignment 6 - Software Download Automation

### Scenario

Operations team frequently downloads software packages manually.

Write a script that:

- Accepts download URL
- Downloads package
- Verifies download

### Solution

```text
software_download.sh
```

---

# Module 3 - Environment Variables

## Assignment 7 - Java Environment Setup

### Scenario

Java has been installed manually.

Configure JAVA_HOME and PATH variables.

Tasks:

- Set JAVA_HOME
- Update PATH
- Verify configuration

### Solution

```text
java_environment_setup.sh
```

---

## Assignment 8 - Maven Environment Setup

### Scenario

Maven is installed but commands are not accessible globally.

Tasks:

- Set MAVEN_HOME
- Update PATH
- Verify configuration

### Solution

```text
maven_environment_setup.sh
```

---

## Assignment 9 - Custom Environment Variables

### Scenario

Store project-related configuration in environment variables.

Tasks:

- Create variable
- Read variable
- Remove variable

### Solution

```text
environment_variable_lab.sh
```

---

# Module 4 - Text Processing

## Assignment 10 - Configuration File Update

### Scenario

A configuration file contains outdated values.

Use sed to:

- Replace text
- Replace multiple occurrences
- Verify changes

### Example

Replace:

```text
Bash
```

with:

```text
Shell
```

### Solution

```text
sed_demo.sh
```

---

# Module 5 - Functions

## Assignment 11 - Reusable Package Checker

### Scenario

Different teams require different software.

Instead of writing separate scripts, create reusable functions.

Tasks:

- Create package check function
- Create package install function
- Reuse for multiple packages

### Solution

```text
package_checker_function.sh
```

---

## Assignment 12 - Generic Package Installer

### Scenario

Automate installation of any package.

Script should accept:

```text
Executable Name
Package Name
```

Example:

```text
git git
java default-jdk
mvn maven
```

### Solution

```text
generic_package_installer.sh
```

---

# Mini Project

## Project - Build Server Provisioning

### Scenario

A new build server is provisioned for a development team.

Requirements:

- Install Git
- Install Java
- Install Maven
- Configure Environment Variables
- Verify Versions

### Deliverables

```text
build_server_setup.sh
java_environment_setup.sh
maven_environment_setup.sh
```

---

# Concepts Covered

✅ Package Management

✅ Software Installation

✅ Java Installation

✅ Maven Installation

✅ Tomcat Installation

✅ Environment Variables

✅ PATH Configuration

✅ sed

✅ Functions

✅ Reusable Functions

✅ Build Server Provisioning

---

# Revision Checklist

Before moving to Day 5, ensure you can complete:

[ ] Git Installation

[ ] Java Installation

[ ] Maven Installation

[ ] Build Server Setup

[ ] Tomcat Installation

[ ] JAVA_HOME Setup

[ ] MAVEN_HOME Setup

[ ] PATH Configuration

[ ] sed Text Replacement

[ ] Function Creation

[ ] Generic Package Installer
