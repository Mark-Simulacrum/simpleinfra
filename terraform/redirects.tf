// This file contains the definition of all the HTTP redirects from a subdomain
// we control to another URL. See the documentation for information on our
// setup, and how to make changes to it:
//
//    https://forge.rust-lang.org/infra/docs/dns.html
//

module "redirect_www_crates_io" {
  source = "./modules/subdomain-redirect"
  providers = {
    aws       = "aws"
    aws.east1 = "aws.east1"
  }

  to = "https://crates.io"
  from = {
    "www.crates.io"    = module.dns.zone_crates_io,
    "cratesio.com"     = module.dns.zone_cratesio_com,
    "www.cratesio.com" = module.dns.zone_cratesio_com,
  }
}
