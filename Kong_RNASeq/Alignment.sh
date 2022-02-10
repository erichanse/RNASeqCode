##login to the server
ssh ehanse@hpc3.rcic.uci.edu
## use your uci credentials to login. If offsite login through the vpn client

cd /data/homezvol1/ehanse/Kong_RNASeq/data

##Unzip the files from current directory into new directory
for f in *.gz ; do gunzip -c "$f" > /data/homezvol1/ehanse/Kong_RNASeq/data/Trimmed_Unzipped/"${f%.*}"; done

cd /data/homezvol1/ehanse/Kong_RNASeq/data

## install bioconda (includes STAR)
conda install star -c bioconda

##Help function for STAR so you can better understand the commands
Star --help
StarPart1 = $(data/homezvol1/ehanse/Kong_RNASeq/data/STAR_Gen_Assembly.sh)
##Activate the STAR software
module load star

## STEP 1 of alignment. Read in the genome assembly and annotation
STAR --runThreadN 4 \
     --runMode genomeGenerate \
     --genomeDir /data/homezvol1/ehanse/Kong_RNASeq/data/Genome_Directory \
     --genomeFastaFiles /data/homezvol1/ehanse/Kong_RNASeq/data/mm39/GRCm39.genome.fa \
     --sjdbGTFfile /data/homezvol1/ehanse/Kong_RNASeq/data/GTF_Dir/gencode.vM28.annotation.gtf \
     --sjdbOverhang 99
     
## Step 2 of alignment. Mapping to the genome using the assembled genome file just created in step 1
STAR --runThreadN 12 \
     --genomeDir /data/homezvol1/ehanse/Kong_RNASeq/data/Genome_Directory \
     --readFilesIn /data/homezvol1/ehanse/Kong_RNASeq/data/Trimmed_Unzipped/020222_1.trim.fa \
     --outFilterIntronMotifs RemoveNoncanonical \
     --outFileNamePrefix mapped_ \
     --outSAMtype BAM SortedByCoordinate
     






## Close your session

exit
logout
