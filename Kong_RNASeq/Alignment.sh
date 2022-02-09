##login to the server
ssh ehanse@hpc3.rcic.uci.edu
## use your uci credentials to login. If offsite login through the vpn client

## Open a SLURM sessio
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

## Read in the genome assembly and annotation
STAR --runThreadN 62 \
     --runMode genomeGenerate \
     --genomeDir /data/homezvol1/ehanse/Kong_RNASeq/data/Genome_Directory \
     --genomeFastaFiles /data/homezvol1/ehanse/Kong_RNASeq/data/mm39/chr1.fa \
     --sjdbGTFfile /data/homezvol1/ehanse/Kong_RNASeq/data/GTF_Dir/Mus_musculus.GRCm39.105.gtf \
     --sjdbOverhang 99
     


## Check directory permissions, you need read/write/executable
ls -lah
chmod a+x /data/homezvol1/ehanse/Kong_RNASeq/data/mm39/Mus_musculus.GRCm39.105.gtf
ls -lah
