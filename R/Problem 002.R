########## Problem 2 - Euler Project ##########

fib_seq <- c(1,2)
runtime <- 4000000

ptm <- proc.time()      # Start the clock!

while (fib_seq[length(fib_seq)] <= runtime) {
  fib_seq <- c(fib_seq, fib_seq[length(fib_seq)-1]+fib_seq[length(fib_seq)])
}
fib_seq <- fib_seq[-length(fib_seq)]
sum(fib_seq[fib_seq%%2==0])

proc.time() - ptm       # Stop the clock

##### Alternative - NOT faster#####

fib_seq <- c(1,2)
fib_seq_even <- c(2)

ptm <- proc.time()      # Start the clock!

while (length(fib_seq_even)<2) {
  cand <- fib_seq[length(fib_seq)-1]+fib_seq[length(fib_seq)]
  if (cand%%2==0) {
    fib_seq_even <- c(fib_seq_even,cand)
  }
  fib_seq <- c(fib_seq,cand)
}
#Use the fact that even_num(n)=4*even_num(n-1)+even_num(n-2)
while (fib_seq_even[length(fib_seq_even)]<=runtime) {
  fib_seq_even <- c(fib_seq_even,4*fib_seq_even[length(fib_seq_even)]+fib_seq_even[length(fib_seq_even)-1])
}
sum(fib_seq_even[-length(fib_seq_even)])

proc.time() - ptm       # Stop the clock
