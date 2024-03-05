
resource "aws_waf_web_acl" "saskint_acl" {
  name        = "saskint-web-acl"
  metric_name = "saskint-web-acl-metric"
 
  default_action {
    type = "ALLOW"
  }
}
 

resource "aws_waf_rule" "saskint_acl_rule" {
  name        = "saskint_acl-rule"
  metric_name = "saskint_acl-rule-metric"
 
  predicate {
     data_id = aws_waf_ipset.saskint_acl_ipset.id
     negated    = false
     type       = "IPMatch"
  }
}
 

resource "aws_waf_ipset" "saskint_acl_ipset" {
  name        = "saskint_acl-ipset"
  ip_set_descriptors {
    type  = "IPV4"
    value = "174.33.2.0/20" 
  }
}

resource "aws_waf_web_acl_association" "wafcdn_association" {
  web_acl_id = aws_waf_web_acl.example_acl.id
  resource_arn = 
}
 