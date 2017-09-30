########## Problem 1 - Euler Project ##########

mult_1 <- 3             # First multiple
mult_2 <- 5             # Second multiple
target <- 1000        # Check all numbers below this        
sum <- 0                # Calculation vector

ptm <- proc.time()      # Start the clock!

for(i in 1:(target-1)) {
   if (i %%mult_1 ==0 | i %%mult_2 ==0){
     sum <- sum + i
   }
}
sum

proc.time() - ptm       # Stop the clock

##### ALTERNATIVE 1 - faster #####

target_vec <- 1:(target-1)

ptm <- proc.time()      # Start the clock!

mult_vec_1 <- target_vec[target_vec%%mult_1==0]
mult_vec_2 <- target_vec[target_vec%%mult_2==0]
multi_vec_comb <- target_vec[target_vec%%(mult_1*mult_2)==0]
sum_fast <- sum(as.numeric(mult_vec_1)) + sum(as.numeric(mult_vec_2)) - sum(as.numeric(multi_vec_comb))
sum_fast

proc.time() - ptm       # Stop the clock

##### ALTERNATIVE 2 - even more faster #####

ptm <- proc.time()      # Start the clock!

mult_vec <- target_vec[target_vec%%mult_1==0| target_vec%%mult_2==0]
sum_faster <- sum(as.numeric(mult_vec))
sum_faster

proc.time() - ptm       # Stop the clock

##### ALTERNATIVE 3 - the smartest and super FASTEST!!!!#####

SumDivisibleBy <- function(n) {
  p <- floor((target-1)/n)
  return(floor((n*(p*(p+1)))/2))
}
ptm <- proc.time()      # Start the clock!

sum_test <-SumDivisibleBy(mult_1) + SumDivisibleBy(mult_2) - SumDivisibleBy(mult_1*mult_2)
sum_test

proc.time() - ptm       # Stop the clock