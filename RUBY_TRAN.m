%seq1='ATCGTGTGTCAGTGTCTTAGTT';
seq1='A';
fp = fopen('F:\RUBY\DNA\seq1.txt','wt');
fprintf(fp,seq1);
fclose(fp);
seq2='CGTAGTTCAAACGACGTGTTAC';

fp = fopen('F:\RUBY\DNA\seq2.txt','wt');
fprintf(fp,seq2);
fclose(fp);
[~,s]=system('F:\RUBY\DNA\thermo.rb');
%system('F:\RUBY\DNA\thermo.rb');
M=load('F:\RUBY\DNA\energy.txt');
M
