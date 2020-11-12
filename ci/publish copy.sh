#! /bin/sh -e
#
# publish.sh

region="eu-west-1"
git_version="`git describe --tags || echo 0`"
version="${git_version}-`date +%Y%m%d.%H%M%S`-$GIT_COMMIT"

project=$(dirname $JOB_NAME)

`aws ecr get-login --no-include-email --region $region`
repourl=$(aws ecr describe-repositories --region $region | jq -r ".repositories[] | select(.repositoryName == \"$project\") | .repositoryUri")

if [ "" = "$repourl" ] ; then
  echo $repourl does not exist
  repourl=$( aws ecr create-repository --region $region --repository-name $project | jq -r .repository.repositoryUri)
  echo created repo
  echo fetching policy
  policyText=$(aws ecr get-repository-policy --repository-name lc-df-hello-world-service  --region $region | jq ".policyText | fromjson" -rc)
  echo fetched $policyText
  aws ecr set-repository-policy --region $region --repository-name $project --policy-text "$policyText"
  echo applied the policy
else
  echo $repourl exists
fi
tag=$repourl:$version

docker build -t $tag . && docker push $tag
docker rmi $tag

sed -i "s#CONTAINER#$tag#" manifest.json
aws s3 cp file.json s3://bucket/folder/$JOB_NAME/$version.json