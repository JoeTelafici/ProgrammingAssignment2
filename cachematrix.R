## Joe Telafici - Johns Hopkins Data Science R Programming Assignment 2
## Caching matrix inversion

## Write a short comment demastrscribing this function

makeCacheMatrix <- function(x = matrix()) {

   # m is the 
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) inv <<- solve
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    m <- x$getinverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    m <- solve(x$get())
    x$setinverse(m)
    m
}

