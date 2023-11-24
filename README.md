# ML-model-for-Drowsiness-Detection-using-EEG-Signals


## Overview

This project implements a drowsiness detection system using EEG signals. The code processes EEG data, extracts features, and trains a Long Short-Term Memory (LSTM) neural network for classification. The system distinguishes between states of "fatigue" and "normal" based on the processed EEG data. The labeled dataset used for training is based on the work by Hu and Min (2018), containing EEG data from twelve healthy subjects in different states during driving.

## Prerequisites

Before running the code, ensure that you have the following:

- MATLAB installed on your machine.
- EEG dataset (downloaded from the provided link)
- EEGLAB toolbox

## Code Structure

The code is organized into two main sections: data preprocessing and LSTM classification.

### Data Preprocessing

1. **Load and Format Data:** EEG data is loaded from MAT files, and unnecessary channels are discarded.

2. **Segmentation:** The data is segmented into smaller chunks for further analysis.

3. **Feature Extraction:** Bandpower features are calculated for each segment.

4. **Save Segmented Data:** Segmented data is saved for later use.

### LSTM Classification

1. **Load Segmented Data:** Segmented data is loaded for training and testing.

2. **Data Splitting:** The data is split into training and testing sets.

3. **LSTM Network Configuration:** The architecture of the LSTM network is defined.

4. **Training:** The LSTM network is trained using the training data.

5. **Testing and Evaluation:** The trained network is used to classify EEG data, and the accuracy is evaluated.

## Instructions

1. Update the file paths for EEG data according to your directory structure.

2. Run the script in MATLAB.

## File Structure

- **Main Script:** `drowsiness_detection.m`
- **Saved Data:** Segmented data is saved in the specified directory.

## Results

After running the script, the accuracy of the LSTM network is displayed along with a confusion matrix.

# Notes
- The script assumes a specific file structure. Modify paths if your setup is different.
- EEGLab toolbox is required for data loading and preprocessing.
- The provided model achieves an accuracy above 90%, as mentioned in the repository.
## Citation

If you use this code or the provided dataset, please cite the original work by Hu and Min (2018).

**Reference:**
- Hu, S., & Min, J. (2018). [Driver fatigue detection with single-channel EEG data](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6198113/). *Computational Intelligence and Neuroscience*, 2018.


## Disclaimer

This code is provided as-is and may require further customization based on your specific use case and data. The accuracy of the drowsiness detection system depends on the quality and diversity of the EEG data used for training.

Feel free to reach out for any questions or assistance.
