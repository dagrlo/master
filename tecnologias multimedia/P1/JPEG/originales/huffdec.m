function J=huffdec(Je)
% function J=huffdec(Je)
% Decodes the matrix Je using the Huffman code obtained from
% the table of symbols/probabilities stored in the file whose
% name is in the global variable huffprob.
% Returns: A vector with the decoded data.
% Requires: the program huffdec installed in /usr/local/bin
%           A valid Huffman symbol/probability file with the correct
%           type specification according to the type of symbols we
%           intend to decode.

global huffprob;
command=sprintf('/usr/local/bin/huffdec %s -i /tmp/indec -o /tmp/outdec',huffprob);

[fout,msg]=fopen("/tmp/indec","wb");
if (fout==-1)
 fprintf(2,'Cannot open file /tmp/indec to write the data.');
 error(msg);
end;

if (strcmp(class(Je),'int8'))
 count = fwrite(fout,Je,"int8");
else
 if (strcmp(class(Je),'int16'))
  count = fwrite(fout,Je,"int16");
 else
  error('Vector of unknown type.');
 end;
end;

if (count!=size(Je,2))
 error('Cannot write all the data in the temporary file /tmp/indec');
end;
fclose(fout);

system(command);

[fin,msg]=fopen("/tmp/outdec","rb");
if (fin==-1)
 fprintf(2,'Cannot open file /tmp/outdec to read the data.');
 error(msg);
end;

if (strcmp(class(Je),'int8'))
 [J, count] = fread(fin,Inf,"int8");
else
 [J, count] = fread(fin,Inf,"int16");
end;

fclose(fin);

J=J';

