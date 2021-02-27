# https://cloud.google.com/appengine/docs/standard/java/accessing-instance-metadata
GCP_PROJECT=$(curl -s "metadata.google.internal/computeMetadata/v1/project/project-id" -H "Metadata-Flavor: Google")
GCP_ZONE=$(curl -s "metadata.google.internal/computeMetadata/v1/instance/zone" -H "Metadata-Flavor: Google" | xargs basename)

echo -e "===== GCP INSTANCE METADATA ==================================================
 ${COLOR_COLUMN}- Project ID${RESET_COLORS}.........: ${COLOR_VALUE} ${GCP_PROJECT} ${RESET_COLORS}
 ${COLOR_COLUMN}- Zone${RESET_COLORS}...............: ${COLOR_VALUE} ${GCP_ZONE} ${RESET_COLORS}"
