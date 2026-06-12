# Bash Quick Reference Sheet

## 1. Variable Declaration

### Correct

```bash id="jk3sv0"
name="Micah"
age=23
```

### Wrong

```bash id="84pwrq"
name = "Micah"
age = 23
```

Error:

```text id="9k98ui"
command not found
```

---

## 2. User Input

### Syntax

```bash id="bztzjq"
read variable
```

Example:

```bash id="qowv6y"
read name

echo "$name"
```

---

### Prompt Style

```bash id="8bglbh"
read -p "Enter Name: " name
```

---

## 3. Printing Output

### Syntax

```bash id="kmc1lm"
echo "Hello"
```

### Variable

```bash id="0i0elr"
echo "$name"
```

---

## 4. Command Substitution

### Syntax

```bash id="xvlqpi"
today=$(date)
```

### Print

```bash id="17vkj2"
echo "$today"
```

---

# CONDITIONALS

## 5. if Statement

### Syntax

```bash id="vgut6e"
if [[ condition ]]
then
    commands
fi
```

Example:

```bash id="2cr2lb"
if [[ $age -gt 18 ]]
then
    echo "Adult"
fi
```

---

## 6. if else

### Syntax

```bash id="yj0ot6"
if [[ condition ]]
then
    commands
else
    commands
fi
```

Example:

```bash id="9vc5h0"
if [[ $age -ge 18 ]]
then
    echo "Eligible"
else
    echo "Not Eligible"
fi
```

---

## 7. if elif else

### Syntax

```bash id="4t4s6y"
if [[ condition1 ]]
then
    commands

elif [[ condition2 ]]
then
    commands

else
    commands
fi
```

Example:

```bash id="lfkt7o"
if [[ $num -gt 0 ]]
then
    echo "Positive"

elif [[ $num -lt 0 ]]
then
    echo "Negative"

else
    echo "Zero"
fi
```

---

# COMPARISON OPERATORS

## Numeric

| Operator | Meaning            |
| -------- | ------------------ |
| -eq      | Equal              |
| -ne      | Not Equal          |
| -gt      | Greater Than       |
| -lt      | Less Than          |
| -ge      | Greater Than Equal |
| -le      | Less Than Equal    |

Example:

```bash id="5mrqq0"
[[ $age -ge 18 ]]
```

---

## String

| Operator | Meaning   |
| -------- | --------- |
| ==       | Equal     |
| !=       | Not Equal |

Example:

```bash id="gr6fkc"
[[ $company == "UBS" ]]
```

---

# LOGICAL OPERATORS

## AND

```bash id="7fd5z9"
-a
```

Example:

```bash id="f1y5ig"
[ $age -ge 18 -a $age -le 60 ]
```

---

## OR

```bash id="4cdw4h"
-o
```

Example:

```bash id="8x5wce"
[ $age -lt 18 -o $age -gt 60 ]
```

---

# CASE STATEMENT

## Basic Syntax

```bash id="l8s3s6"
case $variable in

value1)
    commands
    ;;

value2)
    commands
    ;;

*)
    default commands
    ;;

esac
```

---

## Example

```bash id="1d3lvn"
case $char in

a)
    echo "Vowel"
    ;;

e)
    echo "Vowel"
    ;;

*)
    echo "Not Vowel"
    ;;

esac
```

---

## Multiple Values

```bash id="umtxv0"
a|A)
    echo "Vowel"
    ;;
```

Means:

```text id="pnm8rx"
a OR A
```

---

# LOOPS

## 1. For Loop

### Syntax

```bash id="5q6xlq"
for i in 1 2 3 4 5
do
    echo $i
done
```

Output:

```text id="l1nccu"
1
2
3
4
5
```

---

## 2. C Style For Loop

### Syntax

```bash id="6odzk8"
for (( i=1; i<=5; i++ ))
do
    echo $i
done
```

---

## 3. While Loop

### Syntax

```bash id="7m1w9n"
while [ condition ]
do
    commands
done
```

Example:

```bash id="4wfy5v"
num=1

while [ $num -le 5 ]
do
    echo $num
    num=$((num+1))
done
```

---

## 4. Arithmetic While Loop

### Syntax

```bash id="vk0x5q"
while (( num <= 5 ))
do
    echo $num
    ((num++))
done
```

---

## 5. Break

### Syntax

```bash id="9bgcnw"
break
```

Stops loop immediately.

---

## 6. Continue

### Syntax

```bash id="m2q3tb"
continue
```

Skips current iteration.

---

# COMMAND LINE ARGUMENTS

Run:

```bash id="0j14a6"
./script.sh friend1 friend2
```

Access:

```bash id="g8t0b8"
$0
$1
$2
$#
```

Meaning:

```text id="dl40z4"
$0 = Script Name
$1 = First Argument
$2 = Second Argument
$# = Total Arguments
```

---

# MOST COMMON BEGINNER MISTAKES

## Mistake 1

Wrong:

```bash id="vc4jyv"
name = "Micah"
```

Correct:

```bash id="h3h3rf"
name="Micah"
```

---

## Mistake 2

Wrong:

```bash id="y3g4cu"
if [[$age -gt 18]]
```

Correct:

```bash id="kkg7gd"
if [[ $age -gt 18 ]]
```

Spaces are mandatory.

---

## Mistake 3

Wrong:

```bash id="egud0f"
echo "Hello
```

Correct:

```bash id="6jx6w2"
echo "Hello"
```

---

## Mistake 4

Wrong:

```bash id="0a8qf1"
num = $((num+1))
```

Correct:

```bash id="glu8l4"
num=$((num+1))
```

---

## Mistake 5

Wrong:

```bash id="aqo7s4"
if [[ $name = UBS ]]
```

Correct:

```bash id="2vgwqz"
if [[ $name == "UBS" ]]
```

---

## Mistake 6

Wrong:

```bash id="9yaj5t"
if [[ $num % 2 == 0 ]]
```

Correct:

```bash id="9u56i4"
if (( num % 2 == 0 ))
```

Use `(( ))` for arithmetic.

---

## Mistake 7

Wrong:

```bash id="odk5rz"
for ((i=1;i<=5;i++))
```

Correct:

```bash id="s55fut"
for (( i=1; i<=5; i++ ))
```

Much easier to read and debug.

---

# Interview Tip

Use:

```bash id="1rq4mq"
[[ ]]
```

for strings.

Use:

```bash id="iujf0w"
(( ))
```

for arithmetic.

This single rule eliminates most Bash syntax errors.
