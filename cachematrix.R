## Put comments here that give an overall description of what your
## functions do

#fucntion to manage matrix assignment. 
#get(): returns matrix
#set(): sets matrix
#getinv(): gets the cache inv. matrix
#setinv(): sets the inv. matrix.
makeCacheMatrix <- function(mt = matrix()) {
  inv <- NULL
  set <- function(yo) {
    mt <<- yo
    inv <<- NULL
  }
  get <- function() mt
  setinv <- function(inv) inv <<- inv
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)

}


#function to get the inverse matrix. 
cacheSolve <- function(mt, ...) {
  inv <- mt$getinv()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- mt$get()
  inv <- solve(data, ...)
  mt$setinv(inv)
  inv
}

