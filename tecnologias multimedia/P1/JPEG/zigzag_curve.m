function H=zigzag_curve(blocksize)
s=blocksize^2;
H=zeros(s,2);
for i=1:blocksize
 for j=1:blocksize
  H(blocksize*(i-1)+j,1)=i;
  H(blocksize*(i-1)+j,2)=j;
 end;
end;
s=blocksize^2;
for i=2:(s+1)
 for j=1:(s-1)
  sumA=H(j,1)+H(j,2);
  sumB=H(j+1,1)+H(j+1,2);
  if ( order_rel(H(j,:),H(j+1,:)) )
   aux=H(j,:);
   H(j,:)=H(j+1,:);
   H(j+1,:)=aux;
  end;
 end;
end;

function r=order_rel(v1,v2)
sumA=v1(1)+v1(2);
sumB=v2(1)+v2(2);
if (sumA>sumB)
 r=true;
 return;
end;
if (sumA<sumB)
 r=false;
 return;
end;
if ( ( (mod(sumA,2)==1) && (v1(1)>v2(1)) ) || ( (mod(sumA,2)==0) && (v1(1)<v2(1)) ) )
 r=true;
else
 r=false;
end;

