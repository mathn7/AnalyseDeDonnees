function float_to_RGB(i,imagergb)

    (a,b,_) = size(i)
    imagergb = imagergb[1:a,1:b]
    for k=1:a
        for l=1:b
            imagergb[k,l] = RGB(i[k,l,1],i[k,l,2],i[k,l,3])
        end
    end
    return imagergb
end