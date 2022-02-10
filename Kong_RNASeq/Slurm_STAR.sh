#!/bin/bash

#SBATCH --job-name=erich1  
#SBATCH -p free              
#SBATCH --nodes=1            
#SBATCH --ntasks=16           
#SBATCH --mem-per-cpu=24G     
#SBATCH --error=%x.%A.err   
#SBATCH --out=%x.%A.out      

hn=`hostname`
echo "Running job on host $hn"
module purge
module load star
STAR --runThreadN 1 \
     --runMode genomeGenerate \
     --genomeDir /data/homezvol1/ehanse/Kong_RNASeq/data/Genome_Directory \
     --genomeFastaFiles /data/homezvol1/ehanse/Kong_RNASeq/data/mm39/GRCm39.genome.fa \
     --sjdbGTFfile /data/homezvol1/ehanse/Kong_RNASeq/data/GTF_Dir/gencode.vM28.annotation.gtf \
     --sjdbOverhang 99

