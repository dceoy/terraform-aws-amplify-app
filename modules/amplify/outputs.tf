output "amplify_app_id" {
  description = "Amplify app ID"
  value       = aws_amplify_app.main.id
}

output "amplify_app_default_domain" {
  description = "Amplify app default domain"
  value       = aws_amplify_app.main.default_domain
}

output "amplify_app_production_branch" {
  description = "Amplify app production branch"
  value       = aws_amplify_app.main.production_branch
}
