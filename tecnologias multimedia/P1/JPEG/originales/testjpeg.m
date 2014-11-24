close all;
clear all;

pkg load general image signal

global Qmat;
useHuffmann=true;
global huffprob;
% This must be the name of the Huffman symbol/probability file,
% or "SELFLAP" to indicate that a file with a Laplacian distribution
% with parameters estimated from the data themselves should be used.  
huffprob="SELFLAP";

M=imread("myelin.pgm");
C=[linspace(0,1,256); linspace(0,1,256); linspace(0,1,256)]';
image(M);
axis('equal');
colormap(C);

block_size=8;

if (block_size==4)
 Qmat=[
  13 15  37  57
  14 23  59  67
  25 48  90  96
  69 89 109 106];
else
 if (block_size==8)
 % This is the JPEG Experts Group Standard table.
 Qmat=[
  16 11 10 16  24  40  51  61
  12 12 14 19  26  58  60  55
  14 13 16 24  40  57  69  56
  14 17 22 29  51  87  80  62
  18 22 37 56  68 109 103  77
  24 35 55 64  81 104 113  92
  49 64 78 87 103 121 120 101
  72 92 95 98 112 100 103  99];
 else
  if (block_size==16)
   Qmat=[
      16 16 11 11 10 10 16 16  24  24  40  40  51  51  61  61
      16 16 11 11 10 10 16 16  24  24  40  40  51  51  61  61
      12 12 12 12 14 14 19 19  26  26  58  58  60  60  55  55
      12 12 12 12 14 14 19 19  26  26  58  58  60  60  55  55
      14 14 13 13 16 16 24 24  40  40  57  57  69  69  56  56
      14 14 13 13 16 16 24 24  40  40  57  57  69  69  56  56
      14 14 17 17 22 22 29 29  51  51  87  87  80  80  62  62
      14 14 17 17 22 22 29 29  51  51  87  87  80  80  62  62
      18 18 22 22 37 37 46 46  68  68 109 109 103 103  77  77
      18 18 22 22 37 37 46 46  68  68 109 109 103 103  77  77
      24 24 35 35 55 55 64 64  81  81 104 140 113 133  92  92
      24 24 35 35 55 55 64 64  81  81 104 140 113 133  92  92
      49 49 64 64 78 78 87 87 103 103 121 121 120 120 101 101
      49 49 64 64 78 78 87 87 103 103 121 121 120 120 101 101
      72 72 92 92 95 95 98 98 112 112 100 100 103 103  99  99
      72 72 92 92 95 95 98 98 112 112 100 100 103 103  99  99];   
  else
   Qmat=ones(block_size,block_size);
  end;
 end;
end;

J=jpeg_compress(M,useHuffmann,block_size);
M1=jpeg_uncompress(J,size(M,2),'uint8',useHuffmann,block_size);
figure(2);
image(M1);
axis('equal');
colormap(C);

Noise=M-M1;
fprintf(1,'Image compressed by our method:\n');
fprintf(1,'Max. difference is %d\n',max(max(abs(Noise))));
Ps=sum(sum(M.*M));
Pn=sum(sum(Noise.*Noise));
SNR=10*log10(Ps/Pn);
fprintf(1,'SNR is %f dB\n',SNR);

