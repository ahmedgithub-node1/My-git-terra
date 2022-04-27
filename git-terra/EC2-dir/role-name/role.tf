module "velero_irsa_role" {
  source = "../../modules/iam-role-for-service-accounts-eks"

  role_name             = "velero"
  attach_velero_policy  = true
  velero_s3_bucket_arns = ["arn:aws:s3:::velero-backups"]

  oidc_providers = {
    ex = {
      provider_arn               = module.eks.oidc_provider_arn
      namespace_service_accounts = ["velero:velero"]
    }
  }

  tags = local.tags
}

module "vpc_cni_ipv4_irsa_role" {
  source = "../../modules/iam-role-for-service-accounts-eks"