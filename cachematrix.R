## Joe Telafici - Johns Hopkins Data Science R Programming Assignment 2
## Caching matrix inversion

## Creates a special vector out of a matrix capable of storing and retrieving the inverse of the matrix as well as it's value

makeCacheMatrix <- function(x = matrix()) {

   
    inv <- NULL # the inverse of the matrix - always set to NULL at initialization
    
    # function to reset the value of the matrix after creation.  Not usually necessary
    set <- function(y) {
        x <<- y
        inv <<- NULL #have to make sure to clear whatever inverse we had stored for the last value of the matrix
    }
    
    # output the value of the matrix
    get <- function() x
    
    # set the inverse of this matrix.  Note that this is done OUTSIDE of this function by the caller
    setinverse <- function(Inverse) inv <<- Inverse
    
    # retrieve the storied value of the inverse (note, will be NULL if not calculated outside this function)
    getinverse <- function() inv
    
    # Create a list of functions so the $ notation can be used, e.g. x$get()
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)

}


## Return a matrix that is the inverse of 'x', where x is create by makeCacheMatrix

cacheSolve <- function(x, ...) {
        
    
  ## see if we have a cached value stored  
  m <- x$getinverse()
    
    ## if we do, return it
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
  
    ## if we do not, use the solve() function to determine the inverse.
    ## Note that if the matrix doesn't have an inverse if will error out with something like:
    ## " Error in solve.default(x$get()) : Lapack routine dgesv: system is exactly singular: U[3,3] = 0 
    m <- solve(x$get())
    
    ## add the newly calculated inverse to the cache
    x$setinverse(m)
    
    ## print the inverse matrix
    m
}


