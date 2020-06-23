using Gaston

x = y = -15:0.4:15
f1 = (x,y) -> @. sin(sqrt(x*x+y*y))/sqrt(x*x+y*y)
s1 = Gaston.surf(x, y, f1)
s2 = Gaston.surf(x,y,f1)
s3 = Gaston.surf(x,y,f1)
Gaston.plot([s1 ; s2  ; s3])

