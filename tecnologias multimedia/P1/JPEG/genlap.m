function genlap(x,nf)
% genlap(x,nf) 
% Generates the Huffman file of a Laplacian distribution
% for the symbols found in vector v and writes it in file nf
% in the format accepted by the huffenc/huffdec programs.
% The parameter m (mean) and concentration (b) are estimated
% from the data in v.
% For a distribution of the form f(x|mu,b)=(1/2b)exp(-|x-mu|/b)
% the MLE estimation of emu is the median of the data and
% the MLE of b is (1/N)sum|(xi-emu)| where N is the number
% of samples and x1,x2,...,xN are the data.

if (nargin ~= 2)
 error('Function genlap accepts exactly two arguments.');
end;

if ( (size(x,1) ~= 1) && (size(x,2) ~= 1) )
 error('First argument to genlap must be a row or colum vector.');
end;

[f msg]=fopen(nf,"wt");
if (f==-1)
 error(msg)
end;

emu=median(x);
b=sum(abs(x-emu))/length(x);
fprintf(f,"# Laplacian distribution with parameters estim(mu)=%ld and estim(b)=%f\n",uint32(emu),b);

pmin=min(x);
pmax=max(x);
islong=false;
if (pmin>=0)
 if (pmax<=255)
  fprintf(f,"UC\n");
 else
  if (pmax<=65535)
   fprintf(f,"US\n");
  else
   fprintf(f,"UL\n");
   islong=true;
  end;
 end;
else 
 if ((pmin>=-128) && (pmax<=127))
  fprintf(f,"SC\n");
 else
  if ((pmin>=-32768) && (pmax<=32767))
   fprintf(f,"SS\n");
  else
   fprintf(f,"SL\n");
   islong=true;
  end;
 end;
end;

K=1/(2*b);
v=zeros(1,pmax-pmin);

for i=pmin:pmax
 j=i-pmin+1;
 v(j)=K*exp(-abs(i-emu)/b);
end;

sumv=sum(v);

for i=pmin:pmax
 j=i-pmin+1;
 if (islong==true)
  fprintf(f,"%ld %f\n",i,v(j)/sumv);
 else
  fprintf(f,"%d %f\n",i,v(j)/sumv);
 end;
end;

fclose(f);

