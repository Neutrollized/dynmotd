# https://cloud.google.com/appengine/docs/standard/java/accessing-instance-metadata
# https://cloud.google.com/compute/docs/reference/rest/v1/instances/list
GCP_PROJECT=$(curl -s -H "Metadata-Flavor: Google" "metadata.google.internal/computeMetadata/v1/project/project-id")
GCP_INSTANCE_MACHINE_TYPE=$(curl -s -H "Metadata-Flavor: Google" "metadata.google.internal/computeMetadata/v1/instance/machine-type" | xargs basename)
GCP_INSTANCE_PREEMPTIBLE=$(curl -s -H "Metadata-Flavor: Google" "metadata.google.internal/computeMetadata/v1/instance/scheduling/preemptible")
GCP_INSTANCE_VPC=$(curl -s -H "Metadata-Flavor: Google" "metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/network" | xargs basename)
GCP_INSTANCE_ZONE=$(curl -s -H "Metadata-Flavor: Google" "metadata.google.internal/computeMetadata/v1/instance/zone" | xargs basename)

echo -e "===== GCP INSTANCE METADATA ==================================================
 ${COLOR_COLUMN}- Project ID${RESET_COLORS}.........: ${COLOR_VALUE} ${GCP_PROJECT} ${RESET_COLORS}
 ${COLOR_COLUMN}- Machine Type${RESET_COLORS}.......: ${COLOR_VALUE} ${GCP_INSTANCE_MACHINE_TYPE} ${RESET_COLORS}
 ${COLOR_COLUMN}- Preemptible${RESET_COLORS}........: ${COLOR_VALUE} ${GCP_INSTANCE_PREEMPTIBLE} ${RESET_COLORS}
 ${COLOR_COLUMN}- VPC${RESET_COLORS}................: ${COLOR_VALUE} ${GCP_INSTANCE_VPC} ${RESET_COLORS}
 ${COLOR_COLUMN}- Zone${RESET_COLORS}...............: ${COLOR_VALUE} ${GCP_INSTANCE_ZONE} ${RESET_COLORS}"
