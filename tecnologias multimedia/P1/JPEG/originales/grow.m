function e = grow(m,blocksize)
% function e = grow(m,blocksize)
%   Pads matrix m with as many rows and columns as needed so that
%   their row and column sizes are both multiples of blocksize.
%   Resulting matrix is returned
s1=size(m,1);
s2=size(m,2);
d1=mod(blocksize-mod(s1,blocksize),blocksize);
d2=mod(blocksize-mod(s2,blocksize),blocksize);
e=zeros(s1+d1,s2+d2);
e(1:s1,1:s2)=m;

