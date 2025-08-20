# https://cloud.google.com/appengine/docs/standard/java/accessing-instance-metadata
# https://cloud.google.com/compute/docs/reference/rest/v1/instances/list
GCP_EXTERNAL_IP=$(curl -s -H "Metadata-Flavor: Google" "metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip")
GCP_EXTERNAL_IP=${GCP_EXTERNAL_IP:-'None'}

GCP_PROJECT=$(curl -s -H "Metadata-Flavor: Google" "metadata.google.internal/computeMetadata/v1/project/project-id")
GCP_INSTANCE_MACHINE_TYPE=$(curl -s -H "Metadata-Flavor: Google" "metadata.google.internal/computeMetadata/v1/instance/machine-type" | xargs basename)
GCP_INSTANCE_IMAGE=$(curl -s -H "Metadata-Flavor: Google" "metadata.google.internal/computeMetadata/v1/instance/image" | xargs basename)
GCP_INSTANCE_PREEMPTIBLE=$(curl -s -H "Metadata-Flavor: Google" "metadata.google.internal/computeMetadata/v1/instance/scheduling/preemptible")
GCP_INSTANCE_VPC=$(curl -s -H "Metadata-Flavor: Google" "metadata.google.internal/computeMetadata/v1/instance/network-interfaces/0/network" | xargs basename)
GCP_INSTANCE_ZONE=$(curl -s -H "Metadata-Flavor: Google" "metadata.google.internal/computeMetadata/v1/instance/zone" | xargs basename)

input_scopes=$(curl -s -H "Metadata-Flavor: Google" "http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/scopes")

# https://cloud.google.com/compute/docs/access/service-accounts#default_scopes
DEFAULT_SCOPE=(
  "devstorage.read_only"
  "logging.write"
  "monitoring.write"
  "service.management.readonly"
  "servicecontrol"
  "trace.append"
)

# Initialize the ADDITIONAL_SCOPE list
ADDITIONAL_SCOPE=()

# Read the input line by line
while IFS= read -r line; do
  # Remove leading/trailing whitespace
  line=$(echo "$line" | xargs)

  # Skip empty lines
  if [[ -z "$line" ]]; then
    continue
  fi

  # Get the basename of the URL
  basename=$(basename "$line")

  # Check if the basename is in DEFAULT_SCOPE
  is_default=false
  for default_item in "${DEFAULT_SCOPE[@]}"; do
    if [[ "$basename" == "$default_item" ]]; then
      is_default=true
      break
    fi
  done

  # If not a member of DEFAULT_SCOPE, add to ADDITIONAL_SCOPE
  if ! $is_default; then
    ADDITIONAL_SCOPE+=("$basename")
  fi

done <<< "$input_scopes" # Use here-string to feed the input

# Join the ADDITIONAL_SCOPE array elements with commas
GCP_ADDITIONAL_SCOPES=$(IFS=,; echo "${ADDITIONAL_SCOPE[*]}")


echo -e "===== GCP INSTANCE METADATA ==================================================
 ${COLOR_COLUMN}- External IP${RESET_COLORS}........: ${COLOR_VALUE} ${GCP_EXTERNAL_IP} ${RESET_COLORS}
 ${COLOR_COLUMN}- Project ID${RESET_COLORS}.........: ${COLOR_VALUE} ${GCP_PROJECT} ${RESET_COLORS}
 ${COLOR_COLUMN}- Machine Type${RESET_COLORS}.......: ${COLOR_VALUE} ${GCP_INSTANCE_MACHINE_TYPE} ${RESET_COLORS}
 ${COLOR_COLUMN}- Image${RESET_COLORS}..............: ${COLOR_VALUE} ${GCP_INSTANCE_IMAGE} ${RESET_COLORS}
 ${COLOR_COLUMN}- Preemptible${RESET_COLORS}........: ${COLOR_VALUE} ${GCP_INSTANCE_PREEMPTIBLE} ${RESET_COLORS}
 ${COLOR_COLUMN}- VPC${RESET_COLORS}................: ${COLOR_VALUE} ${GCP_INSTANCE_VPC} ${RESET_COLORS}
 ${COLOR_COLUMN}- Zone${RESET_COLORS}...............: ${COLOR_VALUE} ${GCP_INSTANCE_ZONE} ${RESET_COLORS}
 ${COLOR_COLUMN}- Additional Scopes${RESET_COLORS}..: ${COLOR_VALUE} [${GCP_ADDITIONAL_SCOPES}] ${RESET_COLORS}"
