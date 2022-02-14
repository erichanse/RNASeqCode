#!/bin/bash

#SBATCH --job-name=Sample_4 
#SBATCH -p free              
#SBATCH --nodes=1            
#SBATCH --ntasks=8
#SBATCH --mem=50G  
#SBATCH --error=%x.%A.err   
#SBATCH --out=%x.%A.out  
#SBATCH --mail-type=END
#SBATCH --mail-user=ehanse     

hn=`hostname`
echo "Running job on host $hn"
module purge
module load star
STAR --runThreadN 8 \
     --genomeDir /pub/ehanse/Genome_Directory \
     --readFilesIn /pub/ehanse/Trimmed_Unzipped/020222_4.trim.fastq \
     --outFilterIntronMotifs RemoveNoncanonical \
     --outFileNamePrefix 020222_4_ \
     --outSAMtype BAM SortedByCoordinate
