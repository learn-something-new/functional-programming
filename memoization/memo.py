# Memoize allows us to store the args and value of each function call
# and on any future calls matching the same args, we can return the value
# without evaluating the function

# Define a function memoize that takes a function, and returns a function
def memoize(f):
    memo = {}
    def delegate(*args):            # Delegate function:
        if not args in memo:        #   If we don't have a stored value yet
            memo[args] = f(*args)   #       Call f and store the value
        return memo[args]           #   Return the stored value
    return delegate                 # Return the delegate

# Define a marginally nontrivial function
def buildURI(a, b, c, d):
    return a + "://" + b + ":" + `c` + "/" + d

# Rebind the function with its own memoized version
buildURI = memoize(buildURI)

print(buildURI("http", "localhost", 80, "index.html"))      # This calls the real buildURI()
print(buildURI("http", "localhost", 80, "index.html"))      # This does not

# Because Python does late binding, this will work even for memoizing intermediate
# values of recursive functions
