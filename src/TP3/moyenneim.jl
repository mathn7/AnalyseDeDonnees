function moyenneim(I)
	I=float(I)
	B = I[:,:,3];
	R = I[:,:,1];
	V = I[:,:,2];
	r= R./max.(1,R+V+B)
	v= V./max.(1,R+V+B)
	r_bar=mean(r[:])
	v_bar=mean(v[:])
	x=[r_bar,v_bar]
	return x
end
