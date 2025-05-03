variable "system_name" {
  description = "System name"
  type        = string
}

variable "env_type" {
  description = "Environment type"
  type        = string
}

variable "amplify_app_repository" {
  description = "Repository for an Amplify app"
  type        = string
}

variable "amplify_app_access_token" {
  description = "Personal access token for a third-party source control system for an Amplify app"
  type        = string
  default     = null
  sensitive   = true
}

variable "amplify_app_oauth_token" {
  description = "OAuth token for a third-party source control system for an Amplify app"
  type        = string
  default     = null
  sensitive   = true
}

variable "amplify_app_build_spec" {
  description = "The build specification for an Amplify app"
  type        = string
  default     = null
}

variable "amplify_app_platform" {
  description = "Platform or framework for an Amplify app"
  type        = string
  default     = "WEB"
  validation {
    condition     = contains(["WEB", "WEB_COMPUTE"], var.amplify_app_platform)
    error_message = "Amplify app platform must be WEB or WEB_COMPUTE"
  }
}

variable "amplify_app_environment_variables" {
  description = "Environment variables map for an Amplify app"
  type        = map(string)
  default     = {}
}

variable "amplify_app_iam_service_role_arn" {
  description = "IAM service role for an Amplify app"
  type        = string
  default     = null
}

variable "amplify_app_custom_headers" {
  description = "Custom HTTP headers for an Amplify app"
  type        = string
  default     = null
}

variable "amplify_app_enable_auto_branch_creation" {
  description = "Whether to enable auto-branch creation for an Amplify app"
  type        = bool
  default     = false
}

variable "amplify_app_enable_basic_auth" {
  description = "Whether to enable basic authorization for an Amplify app"
  type        = bool
  default     = false
}

variable "amplify_app_enable_branch_auto_build" {
  description = "Whether to enable auto-building of branches for an Amplify app"
  type        = bool
  default     = false
}

variable "amplify_app_enable_branch_auto_deletion" {
  description = "Whether to disconnect a branch in the Amplify Console when a branch is deleted from the Git repository"
  type        = bool
  default     = false
}

variable "amplify_app_cache_config_type" {
  description = "Type of cache configuration to use for an Amplify app"
  type        = string
  default     = "AMPLIFY_MANAGED"
  validation {
    condition     = contains(["AMPLIFY_MANAGED", "AMPLIFY_MANAGED_NO_COOKIES"], var.amplify_app_cache_config_type)
    error_message = "Amplify app cache config type must be AMPLIFY_MANAGED or AMPLIFY_MANAGED_NO_COOKIES"
  }
}

variable "amplify_app_custom_rules" {
  description = "Custom rewrite and redirect rules for an Amplify app"
  type        = list(map(string))
  default     = []
  validation {
    condition     = alltrue([for r in var.amplify_app_custom_rules : alltrue([for k in keys(r) : contains(["source", "target", "status", "condition"], k)])])
    error_message = "Amplify app custom rules allow only source, target, status, and condition as keys"
  }
}
