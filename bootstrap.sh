export ACCOUNT=$(aws sts get-caller-identity --query 'Account' | tr -d '"')
export TF_STATE_BUCKET=tf-state-${ACCOUNT}
aws s3 mb s3://${TF_STATE_BUCKET}
envsubst < terraform/iam/backend.tf.tmpl > terraform/iam/backend.tf
envsubst < terragrunt/stacks/stage/terragrunt.hcl.tmpl > terragrunt/stacks/stage/terragrunt.hcl