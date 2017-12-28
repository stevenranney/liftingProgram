# fx to build the Verkhoshansky program

library(dplyr)

build_verk <- function(lift, lift_weight){
  
  x <- data.frame(week = as.integer(c(rep(1, 17),
                           rep(2, 16), 
                           rep(3, 16), 
                           rep(4, 14), 
                           rep(5, 11), 
                           rep(6, 16))), 
                  day = as.integer(c(rep(1, 7), 
                          rep(2, 10), 
                          rep(1, 6), 
                          rep(2, 10),
                          rep(1, 7), 
                          rep(2, 9),
                          rep(1, 6), 
                          rep(2, 8),
                          rep(1, 5), 
                          rep(2, 6),
                          rep(1, 6), 
                          rep(2, 10))), 
                  reps = as.integer(c(10,8,6,6,6,6,6, 
                           10,8,5,5,5,5,5,5,6,12, 
                           10,8,6,5,5,5,
                           10,8,5,4,4,4,4,4,5,8,
                           10,8,6,4,3,3,3,
                           10,8,5,4,3,3,3,5,10,
                           10,8,5,4,3,3,
                           10,8,5,4,2,2,2,6,
                           10,8,5,5,5,
                           10,8,5,3,3,2,
                           10,8,5,3,2,2,
                           10,8,5,3,2,1,1,1,1,1)),
                  weight_prop = c(.45,.55,.65,.65,.65,.65,.65,
                                  .45,.55,.65,.75,.80,.80,.80,.75,.65,.55,
                                  .45,.55,.65,.70,.75,.75,
                                  .45,.55,.65,.75,.80,.85,.85,.85,.80,.70,
                                  .45,.55,.65,.70,.75,.80,.80,
                                  .45,.55,.65,.75,.85,.90,.90,.80,.60,
                                  .45,.55,.65,.75,.85,.85,
                                  .45,.55,.65,.75,.85,.90,.95,.75,
                                  .45,.55,.65,.75,.75,
                                  .45,.55,.65,.75,.80,.85,
                                  .45,.55,.65,.75,.80,.80,
                                  .45,.55,.65,.75,.85,.90,.95,1,1.02,1.05))
  x %>%
    mutate(weight = weight_prop * lift_weight, 
           weight = (round(weight/5) * 5) %>% as.integer(),
           lift = lift) %>%
    select(-weight_prop)

}

build_531 <- function(lift, lift_weight){
  
  x <- data.frame(week = as.integer(
                          c(rep(1, 8), 
                           rep(2, 8), 
                           rep(3, 8), 
                           rep(4, 8))), 
                  reps = as.integer(
                            c(rep(5, 3), 
                           rep(10, 5), 
                           rep(3, 3), 
                           rep(10, 5), 
                           5, 3, 1, 
                           rep(10, 5), 
                           rep(5, 3), 
                           rep(10, 5))), 
                  weight_prop = c(.65,.75,.85,
                                  rep(.5, 5),
                                  .70,.80,.90,
                                  rep(.6, 5),
                                  .75,.85,.95,
                                  rep(.7, 5),
                                  .40,.50,.60, 
                                  rep(.5, 5)))
  
  x %>%
    mutate(weight = weight_prop * (lift_weight*.90), 
           weight = (round(weight/5) * 5) %>% as.integer(),
           lift = lift) %>%
       select(-weight_prop)
                           
  
}