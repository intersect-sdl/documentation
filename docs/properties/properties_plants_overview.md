---
uuid: 180982f2-8dce-44b7-a779-216bcdb57092
title: Plant Properties
published: true
---

List of common plant-specific properties relevant to phenotyping, physiological studies, and ecological monitoring. Properties are grouped into categories based on their biological or functional domain. These can be used as `sosa:ObservableProperty` or `ssn:Property` in semantic web models.

---

## 🌱 Morphological Traits

| Property       | Description                              | Units  | Possible Ontologies |
| -------------- | ---------------------------------------- | ------ | ------------------- |
| `plantHeight`  | Height from base to apical meristem      | cm, mm | PPO, TO             |
| `leafNumber`   | Total number of leaves on the plant      | count  | TO                  |
| `leafLength`   | Length of individual leaves              | cm, mm | TO                  |
| `leafWidth`    | Width of individual leaves               | cm, mm | TO                  |
| `stemDiameter` | Thickness of the main stem near the base | mm     | TO                  |
| `rootLength`   | Total length of roots                    | cm, mm | TO                  |
| `rootMass`     | Mass of harvested roots                  | g      | TO                  |
| `canopyWidth`  | Width of the plant's foliage spread      | cm     | TO                  |
| `branchNumber` | Number of branches per plant             | count  | TO                  |
| `flowerNumber` | Number of flowers per plant              | count  | PPO, TO             |

---

## 🌼 Phenological Stages

| Property          | Description                        | Units | Possible Ontologies |
| ----------------- | ---------------------------------- | ----- | ------------------- |
| `germinationDate` | Date when germination occurred     | date  | PPO                 |
| `emergenceDate`   | Date seedling emerged above soil   | date  | PPO                 |
| `firstLeafDate`   | Date of first true leaf appearance | date  | PPO                 |
| `floweringDate`   | Date when first flower opened      | date  | PPO                 |
| `fruitingDate`    | Date when fruit first appeared     | date  | PPO                 |
| `senescenceDate`  | Onset of visible senescence        | date  | PPO                 |

---

## 🌾 Biomass and Yield

| Property             | Description                           | Units        | Possible Ontologies |
| -------------------- | ------------------------------------- | ------------ | ------------------- |
| `abovegroundBiomass` | Mass of all above-ground plant tissue | g/m²         | TO                  |
| `dryMass`            | Mass of plant tissue after drying     | g            | TO                  |
| `yieldPerPlant`      | Total harvestable yield per plant     | g or g/plant | TO                  |
| `seedCount`          | Number of seeds produced per plant    | count        | TO                  |
| `seedMass`           | Total or average mass of seeds        | g or mg      | TO                  |

---

## 🔋 Physiological Measurements

| Property                 | Description                                      | Units               | Possible Ontologies |
| ------------------------ | ------------------------------------------------ | ------------------- | ------------------- |
| `photosynthesisRate`     | Rate of CO₂ assimilation in photosynthesis       | µmol CO₂/m²/s       | TO                  |
| `transpirationRate`      | Rate of water vapor loss from leaves             | mmol H₂O/m²/s       | EO                  |
| `stomatalConductance`    | Conductance to water vapor through stomata       | mol/m²/s            | TO                  |
| `chlorophyllContent`     | Estimated chlorophyll content (e.g., SPAD value) | index (unitless)    | TO                  |
| `waterContent`           | Water content in tissues                         | %                   | TO                  |
| `isopreneEmission`       | Rate of isoprene released by leaves              | µg/g/h or nmol/m²/s | EO                  |
| `carbonAssimilationRate` | Net carbon gain per unit area                    | µmol/m²/s           | TO                  |
| `leafTemperature`        | Temperature of the leaf surface                  | °C                  | EO                  |
| `nutrientConcentration`  | Levels of N, P, K, etc. in tissues               | % or mg/g           | TO                  |

---

## 🌈 Color and Reflectance Properties

| Property                     | Description                            | Units           |
| ---------------------------- | -------------------------------------- | --------------- |
| `NDVI`                       | Normalized Difference Vegetation Index | unitless        |
| `PRI`                        | Photochemical Reflectance Index        | unitless        |
| `meanRGB`                    | Average RGB pixel values               | R, G, B (0–255) |
| `hue`, `saturation`, `value` | Color properties from HSV space        | unitless (0–1)  |

---

## 🔢 Shape and Geometry

| Property        | Description                                  | Units    |
| --------------- | -------------------------------------------- | -------- |
| `projectedArea` | Area of plant projected onto the image plane | px², cm² |
| `perimeter`     | Length around plant object                   | px, cm   |
| `aspectRatio`   | Ratio of plant height to width               | unitless |
| `solidity`      | Ratio of area to convex hull area            | unitless |
| `circularity`   | Shape descriptor based on area and perimeter | unitless |

---

## 🧪 Biochemical Properties

| Property            | Description                                 | Units        |
| ------------------- | ------------------------------------------- | ------------ |
| `nitrogenContent`   | Nitrogen concentration in leaves or tissues | % dry weight |
| `phosphorusContent` | Phosphorus concentration                    | % dry weight |
| `carbonContent`     | Carbon concentration                        | % dry weight |
| `ligninContent`     | Lignin concentration                        | % dry weight |
| `proteinContent`    | Protein content of tissues                  | %            |

---

## 🌍 Environmental Context Properties

| Property           | Description                                | Units     |
| ------------------ | ------------------------------------------ | --------- |
| `soilMoisture`     | Water content in the soil near plant roots | %         |
| `airTemperature`   | Temperature of air around plant            | °C        |
| `humidity`         | Relative humidity near plant               | %         |
| `lightIntensity`   | Incident light on leaf or canopy           | µmol/m²/s |
| `CO2Concentration` | Ambient CO₂ concentration                  | ppm       |

---

## 📚 Example in RDF (`sosa:observedProperty`)

```turtle
ex:plantHeight
    a sosa:ObservableProperty ;
    rdfs:label "Plant Height" ;
    dct:description "Measured height of the plant from soil level to apical meristem." ;
    dct:identifier "plantHeight" ;
    skos:exactMatch <http://purl.obolibrary.org/obo/TO_0000207> .
```

---

## ✅ Ontology References

* **PPO** (Plant Phenology Ontology): [https://github.com/PlantPhenoOntology/ppo](https://github.com/PlantPhenoOntology/ppo)
* **TO** (Plant Trait Ontology): [http://www.cropontology.org/ontology/CO\_320\:plant\_trait](http://www.cropontology.org/ontology/CO_320:plant_trait)
* **EO** (Environment Ontology): [http://purl.obolibrary.org/obo/eo.owl](http://purl.obolibrary.org/obo/eo.owl)
* **PSO** (Plant Structure Ontology): [http://purl.obolibrary.org/obo/pso.owl](http://purl.obolibrary.org/obo/pso.owl)
* **PO** (Plant Ontology): [http://purl.obolibrary.org/obo/po.owl](http://purl.obolibrary.org/obo/po.owl)
