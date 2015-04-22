## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## 函数makeCacheMatrix用于创建可缓存逆矩阵的特殊“矩阵”对象，实际上它是包含具有以下用途的函数的列表
## 1.   设置矩阵值
## 2.	获取矩阵值
## 3.	设置逆矩阵值
## 4.	获取逆矩阵值
makeCacheMatrix <- function(x = matrix()) {
        s <- NULL
        set <- function(y) {
                x <<- y
                s <<- NULL
        }
        get <- function() x
        setsolve <- function(inverse) s <<- inverse
        getsolve <- function() s
        list(set = set, get = get, setsolve = setsolve, getsolve = getsolve)
}


## Write a short comment describing this function
# 函数cacheSolve用于计算上述makeCacheMatrix返回的特殊“矩阵”的逆矩阵。
# 如果已经计算逆矩阵（且尚未更改矩阵），那么cachesolve将检索缓存中的逆矩阵。
# 计算正方形矩阵的逆矩阵可以在R中通过solve函数来完成。
# 注：假设提供的矩阵始终可逆。
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        s <- x$getsolve()
        if(!is.null(s)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        s <- solve(x, ...)
        x$setsolve(s)
        s
}
