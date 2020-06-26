"""
-------------------------------------------------------------------------------
 ENSEEIHT - 1SN - Analyse de donnees
 TP3 - Classification bayesienne
 moyenne_image.jl
-------------------------------------------------------------------------------
"""
function moyenne_image(image)

	image = float(image)

	B = image[:,:,3]
	R = image[:,:,1]
	V = image[:,:,2]

	r = R ./ max.(1,R + V + B)
	v = V ./ max.(1,R + V + B)

	r_bar = mean(r[:])
	v_bar = mean(v[:])
	
	return [r_bar, v_bar]
end
