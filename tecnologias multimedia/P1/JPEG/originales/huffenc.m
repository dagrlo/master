function Je=huffenc(J)
% function Je=huffenc(J)
% Encodes the matrix J using the Huffman code obtained from
% the table of symbols/probabilities stored in the file whose
% name is in the global variable huffprob.
% Returns: Je a vector of Huffman codes packed in bytes. 
%          Packing is done on the Huffman string so end of a symbol
%          does not necessarily coincides with the end of a byte.
% Uses: global variable huffprob
%       If huffprob has the value SELFLAP a table is generated
%       with a Laplace distribution whose parameters mu and b are
%       estimated usign the histogram of the input data and left
%       in the file Jlap.huff. In this case variable huffprob is
%       updated to the string "Jlap.huff".
% Requires: the program huffenc, installed in /usr/local/bin

global huffprob;

if (strcmp(huffprob,"SELFLAP")==1)
 huffprob="Jlap.huff";
 genlap(J,huffprob);
end;
command=sprintf('/usr/local/bin/huffenc %s -i /tmp/inenc -o /tmp/outenc',huffprob);

[fout,msg]=fopen("/tmp/inenc","wb");
if (fout==-1)
 fprintf(2,'Cannot open file /tmp/inenc to write the data.');
 error(msg);
end;

if (strcmp(class(J),'int8'))
 count = fwrite(fout,J,"int8");
else
 if (strcmp(class(J),'int16'))
  count = fwrite(fout,J,"int16");
 else
  error('Vector of unknown type.\n');
 end;
end;

if (count!=size(J,2))
 error('Cannot write all the data in the temporary file /tmp/inenc');
end;
fclose(fout);

system(command);

[fin,msg]=fopen("/tmp/outenc","rb");
if (fin==-1)
 fprintf(2,'Cannot open file /tmp/outenc to read the data.');
 error(msg);
end;

if (strcmp(class(J),'int8'))
 [Je, count] = fread(fin,Inf,"int8");
else
 [Je, count] = fread(fin,Inf,"int16");
end;
fclose(fin);

if (strcmp(class(J),'int8'))
 Je=int8(Je');
else
 Je=int16(Je');
end;


