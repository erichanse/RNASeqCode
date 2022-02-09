##login to the server
ssh ehanse@hpc3.rcic.uci.edu
## use your uci credentials to login. If offsite login through the vpn client

## Open a SLURM session
srun --pty /bin/bash -i
## command line will change to [user@hpc3-l18-04:~]$

##change to the current directory
cd /data/homezvol1/ehanse/

##Unzip the files from current directory into new directory
for f in *.gz ; do gunzip -c "$f" > /data/homezvol1/ehanse/Kong_RNASeq/data/Trimmed_Unzipped/"${f%.*}"; done

## install bioconda (includes STAR)
conda install star -c bioconda

##Help function for STAR so you can better understand the commands
Star --help

##Activate the STAR software
module load star

## STEP 1 of alignment. Read in the genome assembly and annotation
STAR --runThreadN 1 \
     --runMode genomeGenerate \
     --genomeDir /data/homezvol1/ehanse/Kong_RNASeq/data/Genome_Directory \
     --genomeFastaFiles /data/homezvol1/ehanse/Kong_RNASeq/data/mm39/GRCm39.genome.fa \
     --sjdbGTFfile /data/homezvol1/ehanse/Kong_RNASeq/data/GTF_Dir/gencode.vM28.annotation.gtf \
     --sjdbOverhang 99
    
## Step 2 of alignment. Mapping to the genome using the assembled genome file just created in step 1






## Close your session

exit
logout
