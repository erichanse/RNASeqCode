#!/bin/bash

#SBATCH --job-name=erich  
#SBATCH -p free              
#SBATCH --nodes=1            
#SBATCH --ntasks=8           
#SBATCH --mem-per-cpu=30G     
#SBATCH --error=%x.%A.err   
#SBATCH --out=%x.%A.out  
#SBATCH --mail-type=END
#SBATCH --mail-user=ehanse

hn=`hostname`
echo "Running job on host $hn"
module purge
module load star
STAR --runThreadN 8 \
     --runMode genomeGenerate \
     --genomeDir /data/homezvol1/ehanse/Kong_RNASeq/Jan.23/Genome_Directory \
     --genomeFastaFiles /data/homezvol1/ehanse/Kong_RNASeq/Jan.23/hg38/GRCh38.p13.genome.fa \
     --sjdbGTFfile /data/homezvol1/ehanse/Kong_RNASeq/Jan.23/GTF_Dir/gencode.v42.basic.annotation.gtf \
     --sjdbOverhang 99 