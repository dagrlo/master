function J=jpeg_compress(M,useHuffmann,blocksize, compresion)
% function J=jpeg_compress(M,blocksize,useHuffmann)
%   Calculates the JPEG compressed vector of values from the image in the
%   matrix M using the requested blocksize. Huffmann encoding is used with
%   the dictionary in the global variable Hdict if useHuffmann is true.
%   If not given, no Huffman encoding is done.
%   If blocksize is not given it takes the value 8
%   Returns: J, a row vector of rows(M)*cols(M) values.
%   Uses: global variables Qmat: a blocksize x blocksize quantization matrix

global Qmat;

if (nargin == 1)
 useHuffmann=false;
 blocksize=8;
end;

if ((nargin==3) && (size(Qmat) ~= [blocksize blocksize]))
  error('Matrix Qmat must be an square matrix of blocksize size');
end;

% This generates a two-column vector with the (x,y) list of coordinates of the zigzag curve that runs through
% a square of blocksize pixels of side.
H=zigzag_curve(blocksize);

% Image must be signed to apply the DCT. We substract the minimum value of signed types
% which is -128 for 8-bit images and -32768 for 16-bit images.
if (strcmp(class(M),'uint8'))
 s=128;
else
 if (strcmp(class(M),'uint16'))
  s=32768;
 else
  error('Input image must be uint8 or uint16');
 end;
end;

% The image to which we'll apply the DCT will be always signed int, irrespectively
% of the input type.
Msigned=int16(M);
Msigned=Msigned-s;
Me=grow(Msigned,blocksize);%rellena con ceros para que sea multiplo de 8
ms=size(Me,1)*size(Me,2);

% But the image that will contain the quantized DCT coefficients is 8 bit or
% 16 bits, depending on the input type.
if (strcmp(class(M),'uint8'))
 Jr=int8(zeros(1,size(Me,1)*size(Me,2)));
 fprintf(1,"Size of the original image is %d pixels, %d bytes.\n",ms,ms);
else
 Jr=int16(zeros(1,size(Me,1)*size(Me,2)));
 fprintf(1,"Size of the original image is %d pixels, %d bytes.\n",ms,2*ms);
end;

% The discrete cosine transform of each block, as a matrix and as a vector
DTM=zeros(blocksize,blocksize);
DTV=zeros(1,blocksize^2);
nb1=(size(Me,1)/blocksize);
nb2=(size(Me,2)/blocksize);
index=1;

% For each block in rows (block i), and in columns (block j)  (bloques de 8x8):
for i=1:nb1
 for j=1:nb2

  % Starting row and column coordinates of this block
  i1=blocksize*(i-1)+1;
  i2=blocksize*(j-1)+1;
  % DCT of the block, extracted from the signed image
  DTM=dct2(double(Me(i1:(i1+blocksize-1),i2:(i2+blocksize-1))));

  % This is to codify the DC coefficients. That of the first block
  % is simply left untouched (no coefficient before to find the difference)
  % and stored for the next block. Other DC coefficients are stored for the
  % next block, and then substituted by the difference with the former DC
  if ((i==1) && (j==1))
   lastDC=DTM(1,1);   %continua del anterior bloque
  else
   aux=DTM(1,1);
   DTM(1,1)=lastDC-DTM(1,1);
   lastDC=aux;
  end;

  % DTM is quantized by division point-by-point using the quantizacion matrix of the JPEG
  % (or other you want to experiment with...)
  DTM=DTM./Qmat;   %cuantizamos. aqui van las perdidas

  % DTV is DTM flattened in a row, following the order dictated by zig-zag curve H. 
  % This is because Huffman encoding gets a row vector, and is good to have it in that order.
  % Also, what else could yo do here?
  for auxind=1:(blocksize^2);
   DTV(auxind)=DTM(H(auxind,1),H(auxind,2));
  end;

  for auxind=(compresion):(blocksize^2)
    DTV(auxind)=0;
  end;

  

  
  % Finally, we make the type-conversion so that output vector has the same datatype
  % of the input image and left if in a long row vector, Jr, at the right place.
  if (strcmp(class(M),'uint8'))
   Jr(index:(index+blocksize^2-1))=int8(DTV);
  else
   Jr(index:(index+blocksize^2-1))=int16(DTV);
  end;
  % Where in Jr we will have to store the next block...
  index=index+blocksize^2;

 end;
end;

if (useHuffmann)
 J=huffenc(Jr);
 if (strcmp(class(J),'uint8'))
  es=size(J,1)*size(J,2);
 else
  es=2*size(J,1)*size(J,2);
 end;
 fprintf(1,"Size of Huffmann-encoded quantized DCT is %d bytes.\n",es);
else
 J=Jr;
end;


