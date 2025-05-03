resource "aws_amplify_app" "main" {
  name                        = "${var.system_name}-${var.env_type}-amplify-app"
  description                 = "Amplify app of ${var.amplify_app_repository}"
  repository                  = var.amplify_app_repository
  access_token                = var.amplify_app_access_token
  oauth_token                 = var.amplify_app_oauth_token
  build_spec                  = var.amplify_app_build_spec
  platform                    = var.amplify_app_platform
  environment_variables       = var.amplify_app_environment_variables
  iam_service_role_arn        = var.amplify_app_iam_service_role_arn
  custom_headers              = var.amplify_app_custom_headers
  enable_auto_branch_creation = var.amplify_app_enable_auto_branch_creation
  enable_basic_auth           = var.amplify_app_enable_basic_auth
  enable_branch_auto_build    = var.amplify_app_enable_branch_auto_build
  enable_branch_auto_deletion = var.amplify_app_enable_branch_auto_deletion
  cache_config {
    type = var.amplify_app_cache_config_type
  }
  dynamic "custom_rule" {
    for_each = var.amplify_app_custom_rules
    content {
      source    = each.value.source
      target    = each.value.target
      status    = each.value.status
      condition = each.value.condition
    }
  }
  tags = {
    Name       = "${var.system_name}-${var.env_type}-amplify-app"
    SystemName = var.system_name
    EnvType    = var.env_type
  }
}
