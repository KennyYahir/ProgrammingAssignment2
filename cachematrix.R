
## I have thwo functions, one of them creates a special matrix that
## sets the inverse of a matrix A if this is not exist yet and
## return it if already exist while the other checks the state of
## such matrix and compute the inverse just if is needed


# Creates a special matrix

makeCacheMatrix <- function(A = matrix()) {

	NULL -> inv
    set <-function(B) {
        B ->> A
        NULL ->> inv
    }
    get <- function() A
    setInverse <- function(inverse) inverse ->> inv
    getInverse <- function() inv
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


# Checks the state of inverse of A
# If doesn't exist yet compute and return it

cacheSolve <- function(A, ...) {
	## Return a matrix that is the inverse of 'A'

	A$getInverse() -> inv
    if(!is.null(inv)) {

        return (inv)
    }
    A$get() -> data
    solve(data, ...) -> inv
    A$setInverse(inv)
    inv
}
