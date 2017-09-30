########## Problem 6 - Euler Project ##########

max <- 100

ptm <- proc.time()      # Start the clock!

difference <- (((max+1)*max)/2)**2 - 1:max%*%1:max 
print(difference)

proc.time() - ptm       # Stop the clock