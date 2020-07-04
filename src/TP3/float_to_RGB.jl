using Images
function float_to_RGB(img)

    a = size(img)[1]
    b = size(img)[2]
    rgb_image = zeros(RGB{N0f8},a,b)
    for k=1:a
        for l=1:b
            rgb_image[k,l] = RGB(img[k,l,1],img[k,l,2],img[k,l,3])
        end
    end
    return rgb_image
end