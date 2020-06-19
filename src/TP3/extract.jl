function extract(d)
           expr = quote end
           for (k, v) in d
               push!(expr.args, :($(Symbol(k)) = $v))
           end
           eval(expr)
           return
       end
