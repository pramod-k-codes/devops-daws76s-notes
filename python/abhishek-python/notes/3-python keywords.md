Here’s the transformed version of the transcript into reviewable format notes with coding examples based on your request:

---

**YouTube Video Title**: [Day-3 | Keywords, Variables & Best Practices | Global vs Local | #python #abhishekveeramalla](https://www.youtube.com/watch?v=7sWFBuVwScM)  
**Speaker**: Abhishek Veeramalla  
**Video URL**: [YouTube Link](https://www.youtube.com/watch?v=7sWFBuVwScM)

---

### **1. Python Keywords**

**Brief Explanation**:  
Python keywords are reserved words that have a specific meaning and cannot be used for variable names. They help to define the structure and flow of a Python program. Without understanding and using keywords, it is impossible to write efficient and working code in Python.

#### **1-1. Popular Python Keywords**  
- **`for`, `if`, `else`**: Used for loops and conditional logic.
- **`try`, `except`, `finally`**: For error handling (exception handling).
- **`def`**: Used to define functions.
- **`class`**: Used to create classes.
- **`import`, `from`**: Used for importing modules or specific parts of modules.
- **`True`, `False`**: Boolean values.
- **`None`**: Represents a null or non-existent value.

**Real-Time Example**:  
As a DevOps engineer, you might fetch a list of AWS S3 buckets and print only those that contain a specific keyword in their name using `if-else` logic.

```python
buckets = ["dev-abhi-bucket", "prod-app-bucket", "test-abhi-bucket"]
for bucket in buckets:
    if "abhi" in bucket:
        print(bucket)
```

**Quiz**:  
1. What are Python keywords?  
2. What keyword is used to define a function?

---

### **2. Variables in Python**

**Brief Explanation**:  
A variable in Python is a named location used to store data in memory. It holds a value, which can be changed later in the program. Unlike some programming languages, Python does not require you to declare the type of variable explicitly.

#### **2-1. Global vs. Local Variables**  
- **Global Variables**: Declared outside of all functions and accessible inside any function.
- **Local Variables**: Declared inside a function and can only be used within that function.

**Real-Time Example**:  
In a Python script that manages AWS EC2 instances, a global variable could be used for an instance name, which will be accessed by multiple functions for different operations like start, stop, or describe.

```python
ec2_instance_name = "dev-instance"  # Global variable

def start_instance():
    print(f"Starting {ec2_instance_name}")

def stop_instance():
    print(f"Stopping {ec2_instance_name}")

start_instance()  # Output: Starting dev-instance
stop_instance()   # Output: Stopping dev-instance
```

**Quiz**:  
1. What is the difference between global and local variables?  
2. What are the advantages of using global variables?

---

### **3. Best Practices for Variable Naming**

**Brief Explanation**:  
Proper variable naming improves code readability and reduces errors. It is important to use meaningful names that clearly indicate the purpose of the variable.

#### **3-1. Naming Conventions**  
- **Use lower case for variable names**:  
    ```python
    name = "Abhishek"
    ```
- **Use snake_case for multi-word variables**:  
    ```python
    ec2_instance_name = "project_xyz_instance"
    ```
- **CamelCase is another option**:  
    ```python
    ec2InstanceName = "project_xyz_instance"
    ```

#### **3-2. Descriptive Variable Names**  
Choose descriptive variable names that indicate their purpose. Avoid short or vague names unless in small loops.

```python
# Good
full_name = "Abhishek Veeramalla"

# Bad
fn = "Abhishek Veeramalla"
```

**Quiz**:  
1. What is snake_case and camelCase in variable naming?  
2. Why should variable names be descriptive?

---

### **4. Python's Dynamic Typing**

**Brief Explanation**:  
Python is a dynamically typed language, meaning that you don't need to specify the type of a variable when declaring it. Python determines the type based on the value assigned to the variable.

**Example**:  
You can assign different types of values to variables without declaring the type.

```python
name = "Abhishek"  # String
age = 30           # Integer
is_devops = True   # Boolean
```

**Quiz**:  
1. What does it mean that Python is a dynamically typed language?  
2. How does Python handle variable types?

---

### **Questions**

1. What are Python keywords, and why are they important?  
   **Answer**: Python keywords are reserved words used to define the structure of Python programs. They are essential because without them, you cannot build logic or perform operations.
   
2. What is the purpose of using variables in Python?  
   **Answer**: Variables store values and allow easy updates across multiple parts of the program without changing every instance manually.

3. How do you define a global variable in Python?  
   **Answer**: A global variable is defined outside any function and can be accessed inside all functions.

4. What are the two primary naming conventions for variables in Python?  
   **Answer**: The two naming conventions are **snake_case** and **camelCase**.

---

### **Topics and Subtopics for Skimming**

1. Python Keywords
   - 1-1. Popular Python Keywords
2. Variables in Python
   - 2-1. Global vs. Local Variables
3. Best Practices for Variable Naming
   - 3-1. Naming Conventions
   - 3-2. Descriptive Variable Names
4. Python's Dynamic Typing

---

### **Key Topics for Revision**

- **Keywords**: Focus on the most commonly used keywords like `for`, `if`, `else`, `def`, and `try-except`.
- **Variables**: Understand how to define and differentiate between global and local variables.
- **Variable Naming**: Stick to snake_case or camelCase and use meaningful names.
- **Dynamic Typing**: Understand Python's flexible nature of handling variable types without explicit declaration.

---

This format captures the core information from the transcript, providing real-time industry examples and coding practices for better comprehension.