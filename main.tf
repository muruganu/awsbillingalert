resource "aws_budgets_budget" "allservices-monthly" {
  name              = "allservices-monthly"
  budget_type       = "COST"
  limit_amount      = "10"
  limit_unit        = "USD"
  time_unit         = "MONTHLY"

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 80
    threshold_type             = "PERCENTAGE"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["murugan.u@gmail.com","murugancelpip@gmail.com"]
  }
}
