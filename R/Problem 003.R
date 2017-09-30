########## Problem 3 - Euler Project ##########

target <- 600851475143

ptm <- proc.time()      # Start the clock!

fact <- target
primes <- c(NULL)
while (fact!=1) {
  i <- 2
  while (i<=target) {
    if (fact%%i==0) {
      fact <- fact/i
      primes <- c(primes,i)
      break
    }
    i <- i+1
  }
}
primes
max(primes)

proc.time() - ptm       # Stop the clock

##### ALTERNATIVE maybe a bit faster #####

ptm <- proc.time()      # Start the clock!

n <- target
factor <- 2
last_fact <- 1
while (n>1) {
  if (n%%factor==0) {
    last_fact <- factor
    n <- n/factor
    while (n%%factor==0) {
      n <- n/factor
    }
  }
  factor <- factor + 1
}
last_fact

proc.time() - ptm       # Stop the clock