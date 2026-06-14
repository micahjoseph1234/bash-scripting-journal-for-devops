# Day 4 - Package Management, Tomcat Installation, Environment Variables and sed

## Objective

Learn:

* Package Management in Linux
* Manual Software Installation
* Java Installation
* Tomcat Installation
* Environment Variables
* PATH Configuration
* sed Command
* Server Provisioning Basics

---

# 1. Package Management

Package managers automate software installation.

### Ubuntu

```bash
apt
```

Examples:

```bash
sudo apt update -y
sudo apt install git -y
sudo apt install maven -y
sudo apt install nginx -y
```

### RHEL/CentOS

```bash
yum
```

Examples:

```bash
yum install git -y
yum install nginx -y
```

---

# 2. Types of Software Installation

## Method 1 - Package Manager

```bash
sudo apt install maven -y
```

Advantages:

* Automatic dependency management
* Easy updates
* Faster installation

---

## Method 2 - Manual Installation

Download package manually.

Example:

```bash
wget package.tar.gz
```

Extract:

```bash
tar -xvzf package.tar.gz
```

Used when software is unavailable through apt/yum.

---

## Method 3 - Binary Installation

Download binaries.

Examples:

```text
Java
Maven
Tomcat
Terraform
Jenkins
```

After extraction:

```bash
export PATH=...
```

must be configured.

---

# 3. Java Installation

Update package repository:

```bash
sudo apt update -y
```

Install Java:

```bash
sudo apt install default-jdk -y
```

Verify:

```bash
java --version
```

Purpose:

* Required for Maven
* Required for Tomcat
* Required for Java applications

---

# 4. Tomcat Installation

## What is Tomcat?

Apache Tomcat is a Java Application Server.

Used to run:

* Java Web Applications
* Servlets
* JSP Applications
* WAR Files

---

## Installation Steps

Move to installation directory:

```bash
cd /opt
```

Download Tomcat:

```bash
wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.99/bin/apache-tomcat-8.5.99.tar.gz
```

Extract:

```bash
tar -xvzf apache-tomcat-8.5.99.tar.gz
```

Rename folder:

```bash
mv apache-tomcat-8.5.99 tomcat
```

Move to bin directory:

```bash
cd tomcat/bin
```

Start Tomcat:

```bash
./startup.sh
```

---

## Verify Tomcat

Check process:

```bash
ps -ef | grep tomcat
```

Check port:

```bash
ss -tulnp | grep 8080
```

Open browser:

```text
http://SERVER_IP:8080
```

Expected:

```text
Apache Tomcat Welcome Page
```

---

# 5. tar Command

Used to extract compressed files.

Syntax:

```bash
tar -xvzf file.tar.gz
```

Meaning:

| Option | Description |
| ------ | ----------- |
| x      | Extract     |
| v      | Verbose     |
| z      | Gzip        |
| f      | File        |

---

# 6. Environment Variables

Environment variables store important system paths.

---

## JAVA_HOME

Stores Java installation location.

Example:

```bash
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
```

Verify:

```bash
echo $JAVA_HOME
```

---

## MAVEN_HOME

Stores Maven installation location.

Example:

```bash
export MAVEN_HOME="/usr/share/maven"
```

Verify:

```bash
echo $MAVEN_HOME
```

---

# 7. PATH Variable

PATH tells Linux where to search for executable programs.

View PATH:

```bash
echo $PATH
```

Example:

```bash
PATH=$PATH:$JAVA_HOME/bin
```

Now Linux can locate:

```bash
java
javac
jar
```

without specifying full path.

---

## Add Maven to PATH

```bash
PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin
```

Now:

```bash
mvn -version
```

works globally.

---

# 8. Profile Configuration

File:

```bash
/etc/profile
```

Used to store environment variables permanently.

Example:

```bash
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin

export MAVEN_HOME="/usr/share/maven"
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin:$MAVEN_HOME/bin
```

Reload:

```bash
source /etc/profile
```

---

# 9. sed Command

sed = Stream Editor

Used for:

* Search
* Replace
* Modify Text

---

## Replace First Occurrence

```bash
echo "Bash Scripting Bash Language" | sed 's/Bash/Perl/'
```

Output:

```text
Perl Scripting Bash Language
```

Only first occurrence replaced.

---

## Replace All Occurrences

```bash
echo "Bash Bash Bash" | sed 's/Bash/Perl/g'
```

Output:

```text
Perl Perl Perl
```

The g option means:

```text
Global Replacement
```

---

# Real DevOps Flow

```text
Provision Server
        ↓
Install Java
        ↓
Configure JAVA_HOME
        ↓
Install Maven
        ↓
Configure MAVEN_HOME
        ↓
Install Tomcat
        ↓
Start Tomcat
        ↓
Deploy Application
```

---

# Interview Questions

### What is JAVA_HOME?

Stores Java installation path.

---

### What is PATH?

Directories Linux searches for executable commands.

---

### Difference between JDK and JRE?

JDK:

```text
Development + Runtime
```

JRE:

```text
Runtime Only
```

---

### What is Tomcat?

Java Application Server used to deploy web applications.

---

### What does tar -xvzf do?

Extracts compressed .tar.gz files.

---

### What is Maven?

Java build and dependency management tool.

---

### What is sed?

Stream editor used for text manipulation.

---

# Commands Practiced Today

```bash
apt update
apt install
java --version
wget
tar -xvzf
mv
startup.sh
ps -ef
ss -tulnp
echo $PATH
source
sed
```

---

# Learning Outcome

By completing this lab, I learned:

* Linux package management
* Manual software installation
* Java installation and verification
* Tomcat installation and startup
* Environment variable configuration
* PATH management
* Basic text processing using sed
* Real-world DevOps server provisioning workflow
