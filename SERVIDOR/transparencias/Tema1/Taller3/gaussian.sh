#! /usr/bin/octave -qf

arg_list = argv ();
mux=str2num(arg_list{1});
muy=str2num(arg_list{2});
cxx=str2num(arg_list{3});
cxy=str2num(arg_list{4});
cyy=str2num(arg_list{5});
cyx=cxy;

suffix=num2str(10000*rand());

mu=[mux;muy];
C=[cxx cxy; cyx cyy];

[Y,X]= ndgrid(mux-3*sqrt(cxx):0.5:mux+3*sqrt(cxx),muy-3*sqrt(cyy):0.5:muy+3*sqrt(cyy));

G = zeros(size(X,1), size(X,2));

for i=1:size(X,1)
   for j=1:size(X,2)
      D = [X(i,j);Y(i,j)];
      G(i,j) =  exp( - ( (D-mu)' * (C \ (D-mu)))/2 )/sqrt((2*pi)^2*det(C));
   end 
end

size(G)

figure,mesh(X,Y,G);

print(['/tmp/gaussian-' suffix '.png']);

close;

system("printf \"hola\r\n\"");
