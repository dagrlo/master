function M=jpeg_uncompress(J,nrows,restype,withHuffmann,blocksize)
% function M=jpeg_uncompress(J,nrows,ncols,withHuffmann,blocksize)
%   Calculates the vector of values of the image from the compressed
%   values in the vector J using the requested blocksize and quantization
%   matrix. nrows is the number of rows of the original image. Its ncols
%   are calculated from the size of J. restype is the type of the
%   resulting image. It can be 'uint8' or 'uint16'. 
%   withHuffman is a boolean parameter to indicate if the input is in
%   Huffmann-encoded form. If not given is taken as false.
%   If blocksize is not given it takes the value 8
%   Returns: M, a matrix of the requested type with nrows rows and
%            as many columns as the original image that generated it.
%   Uses: global variables Qmat: a (blocksize x blocksize) quantization matrix

global Qmat;
global Hdict;

if (nargin < 4)
 error('This functions needs at least four arguments');
end;

if (!(strcmp(restype,'uint8') || strcmp(restype,'uint16')))
 error('restype can only be uint8 or uint16');
end;

if (nargin == 3)
 withHuffmann=false;
 blocksize=8;
end;

if (nargin==4)
 blocksize=8;
end;

if ((nargin==5) && (size(Qmat) ~= [blocksize blocksize]))
  error('Matrix Qmat must be an square matrix of blocksize size');
end;

% This generates a two-column vector with the (x,y) list of coordinates of the zigzag curve that runs through
% a square of blocksize pixels of side.
H=zigzag_curve(blocksize);

if (withHuffmann)
 Jr=huffdec(J);
else
 Jr=J;
end;

% The number of columns is calculated from the size of the Huffman decoded vector,
% which is the number of pixels in the original image. We cannot calculate before
% because the size of the Huffman encoded stream does not say us anything about
% the original size, at least not until it is decoded.
ncols=max(size(Jr,1),size(Jr,2))/nrows;

% DCT of the image is signed but resulting image is unsigned so we will add
% the appropriate offset (128 for 8-bit images and 32768 for 16-bit ones).
if (strcmp(restype,'uint8'))
 M=uint8(zeros(nrows,ncols));
 offset=128;
else
 M=uint16(zeros(nrows,ncols));
 offset=32768;
end;

% The discrete cosine transform of each block, as a matrix and as a vector
DTM=zeros(blocksize,blocksize);
DTV=zeros(1,blocksize^2);
nb1=(nrows/blocksize);
nb2=(ncols/blocksize);
index=1;

% For each block in rows (block i), and in columns (block j):
for i=1:nb1
 for j=1:nb2

  % First, we extract the block from the appropriate place of the input
  % vector and make the type-conversion to double because DCT will operate on doubles
  DTV=double(Jr(index:(index+blocksize^2-1)));
  % From where in Jr we will have to read the next block...
  index=index+blocksize^2;

  % DTM is DTV organized as a matrix, following the order dictated by zig-zag curve H. 
  for auxind=1:(blocksize^2)
   DTM(H(auxind,1),H(auxind,2))=DTV(auxind);
  end;

  % DTM is dequantized by multiplication point-by-point using the quantizacion matrix
  % of the JPEG (or other you want to experiment with, but then use the same you chose
  % for quatization..)
  DTM=DTM.*Qmat;

  % This is to decodify the DC coefficients. That of the first block
  % is simply taken as it was stored. Other DC coefficients are reconstructed
  % from the one of the previous next block, adding it the stored difference.
  if ((i==1) && (j==1))
   lastDC=DTM(1,1);
  else
   DTM(1,1)=lastDC-DTM(1,1);
   lastDC=DTM(1,1);
  end;

  % Starting row and column coordinates of this block
  i1=blocksize*(i-1)+1;
  i2=blocksize*(j-1)+1;

  % Inverse DCT of the block, extracted from the signed image
  M(i1:(i1+blocksize-1),i2:(i2+blocksize-1))=uint8(idct2(DTM)+offset);

 end;
end;

