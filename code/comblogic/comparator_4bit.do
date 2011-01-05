view wave 
wave clipboard store
wave modify -driver freeze -pattern random -initialvalue 0101 -period 50ns -random_type Uniform -seed 5 -range 3 0 -starttime 0ns -endtime 1000ns Edit:/comp4/a 
wave modify -driver freeze -pattern random -initialvalue 1110 -period 50ns -random_type Uniform -seed 5 -range 3 0 -starttime 0ns -endtime 1000ns Edit:/comp4/b 
wave modify -driver freeze -pattern random -initialvalue 0110 -period 50ns -random_type Uniform -seed 5 -range 3 0 -starttime 0ns -endtime 1000ns Edit:/comp4/b 
wave modify -driver freeze -pattern random -initialvalue 0101 -period 50ns -random_type Uniform -seed 5 -range 3 0 -starttime 0ns -endtime 1000ns Edit:/comp4/b 
wave modify -driver freeze -pattern random -initialvalue 0101 -period 50ns -random_type Exponential -seed 5 -range 3 0 -starttime 0ns -endtime 1000ns Edit:/comp4/b 
wave modify -driver freeze -pattern counter -startvalue 0000 -endvalue 1111 -type Range -direction UpThenDown -period 50ns -step 1 -repeat forever -range 3 0 -starttime 0ns -endtime 1000ns Edit:/comp4/a 
wave modify -driver freeze -pattern counter -startvalue 1111 -endvalue 0000 -type Range -direction DownThenUp -period 50ns -step 1 -repeat forever -range 3 0 -starttime 0ns -endtime 1000ns Edit:/comp4/b 
wave modify -driver freeze -pattern counter -startvalue 0000 -endvalue 1111 -type Range -direction UpThenDown -period 50ns -step 1 -repeat forever -range 3 0 -starttime 0ns -endtime 2000ns Edit:/comp4/a 
wave modify -driver freeze -pattern counter -startvalue 1111 -endvalue 0000 -type Range -direction DownThenUp -period 50ns -step 1 -repeat forever -range 3 0 -starttime 0ns -endtime 2000ns Edit:/comp4/b 
wave modify -driver freeze -pattern counter -startvalue 1111 -endvalue 0000 -type Range -direction Down -period 50ns -step 1 -repeat forever -range 3 0 -starttime 0ns -endtime 2000ns Edit:/comp4/b 
wave modify -driver freeze -pattern counter -startvalue 1111 -endvalue 0001 -type Range -direction Down -period 50ns -step 1 -repeat forever -range 3 0 -starttime 0ns -endtime 2000ns Edit:/comp4/b 
wave modify -driver freeze -pattern counter -startvalue 1111 -endvalue 0001 -type Range -direction Down -period 50ns -step 1 -repeat forever -range 3 0 -starttime 0ns -endtime 1000ns Edit:/comp4/b 
[findWindow wave].tree collapseall -1
wave clipboard restore
