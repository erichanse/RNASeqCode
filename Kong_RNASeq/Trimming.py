 ##This is performed on BASH shell Copy and paste code into it from here
 ## Start with a directory that contains your read files and the adaptor file.
 ##
 conda create -n trimmomatic trimmomatic
 
 conda activate Trimmomatic
 ##change directory to read in files and adaptors
 cd ~/Desktop/YOUR_FILENAME

##For one sample (dual read) 
 Trimmomatic PE 020222_9.txt.gz 020222_10.txt.gz \
              020222_9.trim.txt.gz 020222_9.untrim.txt.gz \
              020222_10.trim.txt.gz 020222_10.untrim.txt.gz \
              SLIDINGWINDOW:4:20 MINLEN:25 ILLUMINACLIP:NexteraPE-PE.fa:2:40:15 \
 ## To use a a loop and automate all the samples
 for infile in *_1.txt.gz
 do
  base=$(basename ${infile} _1.txt.gz)
  Trimmomatic PE ${infile} ${base}_2.txt.gz \
  ${base}_1.trim.fastq.gz ${base}_1un.trim.fastq.gz \
  ${base}_2.trim.fastq.gz ${base}_2un.trim.fastq.gz \
  SLIDINGWINDOW:4:20 MINLEN:25 ILLUMINACLIP:NexteraPE-PE.fa:2:40:15 \
done
  
 
              
              
## 020222_1 is the reference read #1 and 020222_2 is reference read # two from sam sample
## The other commands are telling trimmomatic to trim based on our adaptors (Nextera)
## The adapter fa file is moved to the directory to ease the coding
## This command takes some tome to run
