# $1 : action to execute, value: [create, update]
# $2 : stack name
# $3 : template body file name
# $4 : load par, if present load parameters from $3.json
 
PARAMS=""

if [[ $# -eq 4 ]]
then
    #remove extension
    FILE_NAME=$(echo $3 | awk '{split($0, output, ".yaml"); print output[1]}' )
    PARAMS="--parameters file://$FILE_NAME.json"
fi

aws cloudformation "$1"-stack \
        --region us-east-1 \
        --stack-name $2 \
        --template-body file://$3 \
        --capabilities CAPABILITY_IAM \
        $PARAMS