#!/bin/bash

gmx grompp -f minim.mdp -c system.gro -p topol.top -o em.tpr
gmx mdrun -deffnm em

gmx grompp -f nvt.mdp -c em.gro -p topol.top -o nvt.tpr
gmx mdrun -deffnm nvt

gmx grompp -f npt.mdp -c nvt.gro -p topol.top -o npt.tpr
gmx mdrun -deffnm npt

gmx grompp -f md.mdp -c npt.gro -p topol.top -o md.tpr
gmx mdrun -deffnm md
