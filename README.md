# HEA-AlCoCrFeNi-SRO-Data-Analytics
Codes and scripts for atomistic simulations and data analytics of AlCoCrFeNi high-entropy alloys, from the paper "Investigation of Short-Range Order and Mechanical Strength of AlCoCrFeNi High-Entropy Alloys using Atomistic Simulations and Data Analytics” (COMMAT-D-25-02843).


**"Investigation of Short-Range Order and Mechanical Strength of AlCoCrFeNi High-Entropy Alloys using Atomistic Simulations and Data Analytics"**  
Manuscript No.: COMMAT-D-25-02843  
Article Type: Full Length Article  

**Authors:** Md Abdullah Al Hasan, Prattay Datta, Peter K. Liaw, Seungha Shin  
**Corresponding Author:** Dr. Seungha Shin

## File Summary (Main Branch)

## Initial Structure Creation (LAMMPS Input)**  
`create_atoms_Al0.3Co1.7CrFeNi_FCC.in` – #Five-element HEA atomic structure creation |  
`create_atoms_Al0.5CoCrFe_FCC.in` – #Four-element HEA atomic structure creation |  
`FeNiCrCoAl-heaweight.setfl` – #Potential file for LAMMPS simulations |  
`AlCoCrFeNi_Job_submission_file.sh` – #HPC job submission script  

## Short Range Order Calculation (MATLAB)**  
`SRO_calc_HEA.m` – #Calculates SRO parameters |  
`Nn_dis_count.m` – #Computes nearest-neighbor distribution |  
`read_lmp.m` – #Reads LAMMPS output for SRO analysis  

## Uniaxial Tensile Test (LAMMPS Input)**  
`input_tensile_with_SRO.in` – #LAMMPS input for tensile test including SRO  

## Stress-Strain Extraction (MATLAB)**  
`Stress_Strain.m` – #Extracts stress-strain data and generates plots  

## Machine Learning (Python/Jupyter Notebook Codes)**  

`ANN_composition_code.ipynb` – #ANN prediction of yield stress from composition data alone |  
`RF_SRO_Code.ipynb` – #Random Forest prediction of yield stress from SRO data alone |  
`GBR_Both_code.ipynb` – #Gradient Boosting Regression prediction from both composition & SRO data 
