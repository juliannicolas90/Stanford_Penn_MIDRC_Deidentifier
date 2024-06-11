#!/bin/bash

# Parse input arguments
INPUT_PATH=$1
OUTPUT_PATH=$2
OUTPUT_REVIEWS_PATH=$3
DEVICE=$4

# Build the Docker image
docker build -t deidentifier .

# Run the Docker container with the specified arguments
docker run -v $(pwd):/usr/src/app/Stanford_Penn_Deidentifier deidentifier $INPUT_PATH $OUTPUT_PATH $OUTPUT_REVIEWS_PATH $DEVICE

# Remove temporary files
rm deidentification_details_for_review.csv
rm reports.npy
rm reports_deidentified.npy
rm deidentification_details_for_review_reports.npy
rm deidentification_details_for_review_labeled_reports.npy
rm deidentification_details_for_review_phi_lengths.npy