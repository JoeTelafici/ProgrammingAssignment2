---
title: "Testing Notes"
author: "Joe Telafici"
date: "January 11, 2018"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Testing Notes for Week 3 Programming Assignment for matrix inversion and caching

Because this assignment covers a bunch of material not covered in the lecture, 
make sure to read https://github.com/lgreski/datasciencectacontent/blob/master/markdown/rprog-breakingDownMakeVector.md and it's links.  I had no idea what was going on until I stumbled on that in the discussion forums

## How to test

The two functions written are inadequate to prove they work without a bunch of additional command-line interaction.  You have to create multiple variables with makeCacheMatrix and then call CacheSolve on them multiple times to see it working.  

Since the instructors didn't include validating that the matrix HAS an inverse, I am relying on the solve() function to behave correctly.  So far it seems to agree with examples I've seen on math sites and based on my own (limited) understanding of matrix inversion.  

If the matrix is NOT invertible, solve will throw an error like the following:

...
    > a <- makeCacheMatrix(matrix(1:9, ncol=3, nrow=3))
    > solve (a$get())
    Error in solve.default(a$get()) : 
      Lapack routine dgesv: system is exactly singular: U[3,3] = 0    
...    
   
   
## Unit tests

I ran tests such as the following to verify the functionaliy of the code:

...

    > a <- makeCacheMatrix(matrix(c(4,2,7,5), ncol=2, nrow=2))
    > a$get()
         [,1] [,2]
    [1,]    4    7
    [2,]    2    5
    > cacheSolve(a)
               [,1]       [,2]
    [1,]  0.8333333 -1.1666667
    [2,] -0.3333333  0.6666667
    > cacheSolve(a)
    getting cached data
               [,1]       [,2]
    [1,]  0.8333333 -1.1666667
    [2,] -0.3333333  0.6666667
    > a$set(matrix(1:4, ncol=2, nrow=2))
    > cacheSolve(a)
         [,1] [,2]
    [1,]   -2  1.5
    [2,]    1 -0.5
    > cacheSolve(a)
    getting cached data
         [,1] [,2]
    [1,]   -2  1.5
    [2,]    1 -0.5
    > a <- makeCacheMatrix(matrix(c(1,3,5,7,8,3,4,5,2), ncol=3, nrow=3))
    > b <- makeCacheMatrix(matrix(c(1,3,5,7,8,3,4,5,2), ncol=3, nrow=3))
    > b$get()
         [,1] [,2] [,3]
    [1,]    1    7    4
    [2,]    3    8    5
    [3,]    5    3    2
    > cacheSolve(b)
         [,1] [,2] [,3]
    [1,]  0.1 -0.2  0.3
    [2,]  1.9 -1.8  0.7
    [3,] -3.1  3.2 -1.3
    > cacheSolve(b)
    getting cached data
         [,1] [,2] [,3]
    [1,]  0.1 -0.2  0.3
    [2,]  1.9 -1.8  0.7
    [3,] -3.1  3.2 -1.3

...

If you do fnd problems, please let me know in the grading comments.