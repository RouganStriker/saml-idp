#!/bin/bash
set -e
echo "Executing with app params..."

params=""

# Use metadata if specified
if [ ! -z "${SP_METADATA_URL}" ]
then
  echo "SP Metadata URL: ${SP_METADATA_URL}"
  wget  -O sp_metadata.xml "${SP_METADATA_URL}"
  params="--spMetadata sp_metadata.xml"
else
  echo "SP Host: ${SP_HOST}"

  if [ ! -z "${SP_ENTITY_ID}" ]
  then
    echo "SP Entity ID: ${SP_ENTITY_ID}"
    params="${params} --audience ${SP_ENTITY_ID} --serviceProviderId=${SP_ENTITY_ID}"
  fi

  if [ ! -z "${SP_ACS_POST_PATH}" ]
  then
    acsUrl="${SP_HOST}${SP_ACS_POST_PATH}"
    echo "SP ACS URL: ${acsUrl}"
    params="${params} --acsUrl ${acsUrl}"
  fi

  if [ ! -z "${SP_LS_POST_PATH}" ]
  then
    sloUrl="${SP_HOST}${SP_LS_POST_PATH}"
    echo "SP SLO URL: ${sloUrl}"
    params="${params} --sloUrl ${sloUrl}"
  fi

  if [ ! -z "${IDP_SIGN_RESPONSE}" ]
  then
    echo "IdP Sign Response: ${IDP_SIGN_RESPONSE}"
    params="${params} --signResponse ${IDP_SIGN_RESPONSE}"
  fi
fi

echo ${params}

node app.js ${params}
