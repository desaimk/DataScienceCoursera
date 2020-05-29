## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Function creates matrix and caches inverse  
makeCacheMatrix <- function(x = matrix()) {
 a <- NULL
 set <- function(b) {
     x <<- b
     a <<- NULL
 }
 get <- function() x
 inverse <- function(inverse) a <<- inverse
 getinv <- function () a
 list(set = set, get = get, inverse = inverse, getinv = getinv)
}


## Write a short comment describing this function
## Compute inverse of matrix created
cacheSolve <- function(x, ...) {
    a <- x$getinv()
    if (!is.null(a)) {
        message("getting cached data")
        return(a)
    }
    data <- x$get()
    a <- solve(data, ...)
    x$inverse(a)
    a
        ## Return a matrix that is the inverse of 'x'
}
