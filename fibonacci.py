# Function to print Fibonacci series up to n terms
def fibonacci(n):
    a, b = 0, 1  # Initialize the first two numbers of the series
    for _ in range(n):
        print(a, end=" ")  # Print the current number
        a, b = b, a + b  # Update the values of a and b

# Input: Number of terms in the Fibonacci series
num_terms = int(input("Enter the number of terms in the Fibonacci series: "))

# Call the function to print Fibonacci series
fibonacci(num_terms)

