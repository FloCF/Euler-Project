########## Problem 4 - Euler Project ##########

##### slow but very general #####

max <- 999
min <- 100
max_length <- length(as.numeric(strsplit(as.character(max), "")[[1]]))
palindrom <- matrix(rep(0,3),nrow=3 )

ptm <- proc.time()      # Start the clock!


for (i in max:min) {
  for (j in max:min) {
    test <- as.numeric(strsplit(as.character(i*j), "")[[1]])
    if (length(test)==6) {
      if (test[1]==test[6] && test[2]==test[5] && test[3]==test[4]) {
        if (!any(i*j==palindrom[1,])) {
          palindrom <- matrix(c(palindrom,i*j,i,j), nrow=3)
        }
      }
    } else if (length(test)==5) {
      if (test[1]==test[5] && test[2]==test[4]) {
        if (!any(i*j==palindrom[1,])) {
          palindrom <- matrix(c(palindrom,i*j,i,j), nrow=3)
        }
      }
    } else {
      if (test[1]==test[4] && test[2]==test[3]) {
        if (!any(i*j==palindrom[1,])) {
          palindrom <- matrix(c(palindrom,i*j,i,j), nrow=3)
        }
      }
    }
  }
}
result <- as.data.frame(t(palindrom[,-1]))
names(result) <- c("palidrome","first factor","second factor")
result[result$palidrome==max(result$palidrome),]

proc.time() - ptm       # Stop the clock

##### ALTERNATIVE - NOT FASTER! #####

reverse <- function(n) {
  reversed <- 0
  while (n>0) {
    reversed <- 10*reversed + n %% 10
    n <- floor(n/10)
  }
  return(reversed)
}

isPalindrome <- function(n) {
  return(n==reverse(n))
}

ptm <- proc.time()      # Start the clock!


largestPalindrome <- 0
i <- min
while (i <= max) {
  j <- min
  while (j<= 999) {
    if (isPalindrome(i*j) & i*j>largestPalindrome) {
      largestPalindrome <- i*j
    }
    j <- j+1
  }
  i <- i+1
}
largestPalindrome

proc.time() - ptm       # Stop the clock

##### ALTERNATIVE - SUPER fast #####

ptm <- proc.time()      # Start the clock!

largestPalindrome <- 0
i <- max
while (i >= min) {
  j <- max
  while (j >= i) {
    if (i*j <= largestPalindrome) {
      break
    } else if (isPalindrome(i*j)) {
      largestPalindrome <- i*j
    }
    j <- j-1
  }
  i <- i-1
}
largestPalindrome

proc.time() - ptm       # Stop the clock


