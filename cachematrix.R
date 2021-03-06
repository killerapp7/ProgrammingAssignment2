########################################################################################################
## The two functions makeCacheMatrix() and cachSolve() together is designed to compute the inverse of a matrix 
## and store it in cache, so that the user can retrive the inverse of the matrix from the cache if it is already
## solved for, else we can compute and store in the cache for further user, avoiding the redundant compute times
## required if we are to use the cached value in different functions 
#########################################################################################################

#########################################################################################################
## makeCacheMatrix() creates a matrix object that can cache its inverse. We have 4 functions withint the
## object to set, get the matrix to/from the object, and set, get the inverse of the matrix
#########################################################################################################

makeCacheMatrix <- function(x = matrix()) {
     xInverse <- NULL
     set <- function(y) {
          x <<- y
          xInverse <<- NULL
     }
     get <- function() x
     setInverse <- function(solve) xInverse <<- solve(x)
     getInverse <- function() xInverse
     list(set = set, get = get,
          setInverse = setInverse,
          getInverse = getInverse)

}

#########################################################################################################
## cacheSolve() function returns the inverse of the matrix passed as an argument. It first checks
## whether the inverse if already computed, else it computes it and finally returns the inverse
#########################################################################################################

cacheSolve <- function(x, ...) {
     xInverse <- x$getInverse()
     if(!is.null(xInverse)) {
          message("getting cached data")
          return(xInverse)
     }
     data <- x$get()
     xInverse <- solve(data, ...)
     x$setInverse(xInverse)
     xInverse

}

