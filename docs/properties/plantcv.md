---
uuid: dece2aa9-ca31-4e02-a6c5-70d44a8e6590
title: Observational Properties based on PlantCV
published: true
---

Based on [**PlantCV**](https://plantcv.danforthcenter.org/), which is an open-source image analysis tool for plant phenotyping, one can derive a structured list of **plant phenotyping properties** it computes. These correspond to **morphological**, **color**, **shape**, and **derived traits** extracted from image data.

The following is categorized list of **PlantCV-derived properties** you can use in RDF/semantic models (e.g., as `sosa:ObservableProperty` or :rdfterm[ssn:Property]).

---

## Morphological / Geometric Properties

| Property                         | Description                                             |
| -------------------------------- | ------------------------------------------------------- |
| `area`                           | Total number of pixels in plant object (projected area) |
| `height`                         | Height of bounding box around plant object              |
| `width`                          | Width of bounding box around plant object               |
| `perimeter`                      | Length of the plant object's perimeter                  |
| `extent`                         | Ratio of pixels in plant region to bounding box area    |
| `solidity`                       | Ratio of pixels in the plant to its convex hull         |
| `hullArea`                       | Area of the convex hull around the plant                |
| `aspectRatio`                    | Ratio of width to height                                |
| `ellipseMajorAxis`               | Length of major axis of best-fit ellipse                |
| `ellipseMinorAxis`               | Length of minor axis of best-fit ellipse                |
| `ellipseAngle`                   | Angle of ellipse orientation                            |
| `centerOfMassX`, `centerOfMassY` | Pixel coordinates of center of mass                     |
| `orientationAngle`               | Orientation of the major axis of the plant object       |

---

## Color Properties

| Property                                    | Description                                               |
| ------------------------------------------- | --------------------------------------------------------- |
| `meanHue`, `medianHue`                      | Hue values from HSV color space                           |
| `meanSaturation`, `medianSaturation`        | Saturation values from HSV                                |
| `meanValue`, `medianValue`                  | Brightness (value) from HSV                               |
| `meanRGB_R`, `meanRGB_G`, `meanRGB_B`       | Average red, green, blue pixel values                     |
| `medianRGB_R`, etc.                         | Median RGB values                                         |
| `histogram_R`, `histogram_G`, `histogram_B` | RGB histograms                                            |
| `nirMean`, `nirStdDev`                      | NIR intensity mean and standard deviation (if applicable) |

---

## Shape Descriptors

| Property             | Description                                              |
| -------------------- | -------------------------------------------------------- |
| `eccentricity`       | Elliptical eccentricity (0 = circle, closer to 1 = line) |
| `compactness`        | Ratio of area to perimeter²                              |
| `circularity`        | 4π × area / (perimeter²)                                 |
| `convexHullVertices` | Number of vertices in convex hull                        |
| `numberOfContours`   | Number of distinct contours (e.g., multiple leaves)      |

---

## Mask-based Traits / Pseudo-color Segmentation

| Property                  | Description                                                  |
| ------------------------- | ------------------------------------------------------------ |
| `leafMaskArea`            | Area of detected leaf mask                                   |
| `stemMaskArea`            | Area of detected stem mask                                   |
| `objectCount`             | Number of connected plant components (e.g., leaf blobs)      |
| `foregroundCoverage`      | Proportion of image area occupied by the plant               |
| `backgroundMeanIntensity` | Background intensity average (used for segmentation control) |

---

## Derived or Temporal Traits *(requires time series)*

| Property              | Description                                         |
| --------------------- | --------------------------------------------------- |
| `growthRate`          | Change in projected area over time                  |
| `leafExpansionRate`   | Change in mask area per unit time                   |
| `colorChangeOverTime` | Temporal variation in color metrics                 |
| `plantMovementAngle`  | Tilt or movement in orientation between time points |

---

## Suggested RDF Modeling Pattern

Each property could be defined as a `sosa:ObservableProperty`, like:

```turtle
ex:projectedArea
    a sosa:ObservableProperty ;
    rdfs:label "Projected Area" ;
    dct:description "Number of pixels in the segmented plant region, representing projected leaf area." ;
    qudt:applicableUnit qudt:Pixel ;
    skos:exactMatch <https://plantcv.readthedocs.io/en/stable/traits/#area> .
```
