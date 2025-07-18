
---
uuid: 211437c8-b04b-4423-beb9-9575458ec56d
title: Properties for Solid State Chemistry
published: true
---

The following is a list of **properties typical to solid-state chemistry**, organized by category, with notes on how they may be modeled semantically. These properties are essential for describing **materials**, **crystal structures**, **electronic**, **magnetic**, **thermal**, and **mechanical** characteristics relevant to solid-state synthesis and characterization.

---

## Structural Properties

| Property            | Description                                                    | Common Units    |
| ------------------- | -------------------------------------------------------------- | --------------- |
| `crystalStructure`  | Type of crystal system (e.g., cubic, tetragonal, orthorhombic) | – (categorical) |
| `spaceGroup`        | International space group symbol/number                        | –               |
| `latticeParameters` | Unit cell dimensions (a, b, c, α, β, γ)                        | Å, degrees      |
| `unitCellVolume`    | Volume of the crystallographic unit cell                       | Å³              |
| `density`           | Mass per unit volume of material                               | g/cm³           |
| `atomicPositions`   | Fractional coordinates of atoms in the unit cell               | –               |

---

## Synthesis & Phase Properties

| Property                 | Description                                                     | Common Units    |
| ------------------------ | --------------------------------------------------------------- | --------------- |
| `synthesisMethod`        | Method used (e.g., solid-state reaction, sol-gel, hydrothermal) | – (categorical) |
| `calcinationTemperature` | Temperature used in calcination                                 | °C              |
| `annealingTime`          | Duration of annealing                                           | hours, minutes  |
| `phasePurity`            | Degree to which a single phase is present                       | %               |
| `secondaryPhases`        | Names/composition of impurities or secondary phases             | –               |

---

## Electronic Properties

| Property                    | Description                                           | Common Units |
| --------------------------- | ----------------------------------------------------- | ------------ |
| `bandGap`                   | Energy difference between valence and conduction band | eV           |
| `electricalConductivity`    | Measure of how easily electrons flow                  | S/cm         |
| `resistivity`               | Electrical resistance per unit length and area        | Ω·cm         |
| `carrierConcentration`      | Number of charge carriers per volume                  | cm⁻³         |
| `mobility`                  | Speed of charge carriers in an electric field         | cm²/V·s      |
| `ferroelectricPolarization` | Spontaneous polarization                              | μC/cm²       |

---

## Magnetic Properties

| Property           | Description                                       | Common Units |
| ------------------ | ------------------------------------------------- | ------------ |
| `magneticMoment`   | Magnetic dipole moment per atom/unit              | μB           |
| `susceptibility`   | Magnetic response of material                     | emu/mol      |
| `CurieTemperature` | Transition temperature to ferromagnetic behavior  | K            |
| `NeelTemperature`  | Transition temperature to antiferromagnetic order | K            |

---

## Thermal Properties

| Property              | Description                                       | Common Units |
| --------------------- | ------------------------------------------------- | ------------ |
| `thermalConductivity` | Ability to conduct heat                           | W/m·K        |
| `heatCapacity`        | Heat required to raise temperature                | J/g·K        |
| `DebyeTemperature`    | Characteristic temperature for lattice vibrations | K            |
| `thermalExpansion`    | Rate of change of dimension with temperature      | ppm/K        |
| `meltingPoint`        | Temperature at which the material melts           | °C or K      |

---

## Mechanical Properties

| Property            | Description                                     | Common Units       |
| ------------------- | ----------------------------------------------- | ------------------ |
| `hardness`          | Resistance to deformation (e.g., Mohs, Vickers) | GPa or scale units |
| `YoungsModulus`     | Elastic modulus (stiffness)                     | GPa                |
| `bulkModulus`       | Resistance to uniform compression               | GPa                |
| `shearModulus`      | Resistance to shape change                      | GPa                |
| `fractureToughness` | Resistance to crack propagation                 | MPa·m¹ᐟ²           |

---

## Optional Metadata Properties

| Property          | Description                                            | Common Values    |
| ----------------- | ------------------------------------------------------ | ---------------- |
| `chemicalFormula` | Empirical or molecular formula                         | e.g., LiFePO₄    |
| `materialName`    | Common or synthesized material name                    | e.g., perovskite |
| `ICSDNumber`      | Reference ID from Inorganic Crystal Structure Database | –                |
| `pubChemCID`      | Link to PubChem compound if applicable                 | –                |

---

## Ontology Suggestions

If you want to encode these properties in RDF, consider aligning with:

| Ontology/Vocab                              | Purpose                                           |
| ------------------------------------------- | ------------------------------------------------- |
| **CHEMINF** (Chemical Information Ontology) | For physicochemical properties                    |
| **CHMO** (Chemical Methods Ontology)        | For synthesis and measurement methods             |
| **PATO** (Phenotype and Trait Ontology)     | For generic quality descriptors (e.g., hardness)  |
| **QUDT** (Quantities, Units, Dimensions)    | For unit semantics                                |
| **EFO/OBI**                                 | For assay metadata, provenance                    |
| **DCAT/PROV**                               | For linking datasets and their generation process |
