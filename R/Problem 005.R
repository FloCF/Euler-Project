########## Problem 5 - Euler Project ##########


ptm <- proc.time()      # Start the clock!

max <- 10
i <- 1
success <- 0
while (success==0) {
  if (sum(i %% 10:max)==0) {
    success <- i
  } else {
    i <- i + 1
  }
}
success

proc.time() - ptm       # Stop the clock