#!/bin/bash

#SBATCH --job-name=Read_1 
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
     --readFilesIn /pub/ehanse/Reads/Read1.fastq /pub/ehanse/Reads/Read2.fastq  \
     --outFilterIntronMotifs RemoveNoncanonical \
     --outFileNamePrefix 013123_1_ \
     --outSAMtype BAM SortedByCoordinate
