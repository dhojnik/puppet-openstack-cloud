#!/usr/bin/env bash
#
# A sample ENC Script
#
# Please note that the if the puppetmaster includes this script as /path/to/$environment/enc/puppet_enc.sh
# $environment is the environment of the MASTER not the AGENT.
#
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin
#export $PATH

# puppet client cert name (default: fqdn)
CERTNAME="$1"
#CERTNAME="$(facter fqdn)"

LOG_TAG="PUPPET_CODE_PIPELINE"

# logger -p user.notice -t $LOG_TAG "ENC Called with '$0 $*' at $(date) on $(hostname)"

## Enable the next line to use foreman as ENC
# exec /usr/local/bin/foreman_enc-foremanlocal.rb "$@"


declare -A PARAMETERS
ENVIRONMENT="staging"
CLASSES="ntp"


### Mapping ...
# this assumes a hiera mapping like this
# :hierarchy:
#  - "%{::environment}/hieradata/certname/%{::clientcert}"
#  - "%{::environment}/hieradata/cluster/%{::cluster}"
#  - "%{::environment}/hieradata/role/%{::role}"
#  - "%{::environment}/hieradata/topic/%{::topic}"
#  - "%{::environment}/hieradata/location/%{::location}"
#  - "%{::environment}/hieradata/common"

role=$(echo $CERTNAME | cut -d. -f1 | cut -d- -f1 | sed -e 's/[0-9][0-9]*$//g')
#cluster=$(echo $CERTNAME | cut -d. -f1 | cut -d- -f2 -s)
#copic=$(echo $CERTNAME | cut -d. -f1 | cut -d- -f3 -s)
#cocation=$(echo $CERTNAME | cut -d. -f1 | cut -d- -f4 -s)

PARAMETERS[cluster]=${cluster:-""}
PARAMETERS[role]=${role:-""}
PARAMETERS[topic]=${topic:-""}
PARAMETERS[location]=${location:-""}

#### Output the yaml ...
export PARAMETERS
export ENVIRONMENT
export CLASSES

echo -e "---\nclasses:";
for aClass in $CLASSES; do
    echo "  - $aClass";
done
if [ -n "$ENVIRONMENT" ]; then
    echo "environment: $ENVIRONMENT"
fi
echo "parameters:"

for i in "${!PARAMETERS[@]}"; do
   if [ -n "${PARAMETERS[$i]}" ]; then
       echo "  $i: ${PARAMETERS[$i]}"
   fi
done

## Note: If this script exits with RC != 0, puppet aborts the run and uses
## the cached manifest
exit 0
