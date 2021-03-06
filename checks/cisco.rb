module Intrigue
module Ident
module Check
    class Cisco < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Networking","COTS","VPN","Firewall"],
            :vendor => "Cisco",
            :product => "Adaptive Security Device Manager",
            :match_details => "page title",
            :version => nil,
            :dynamic_version => lambda {|x| _first_body_capture(x,/<title>Cisco ASDM (.*?)<\/title>/)},
            :match_type => :content_body,
            :match_content =>  /<title>Cisco ASDM/,
            :hide => false,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "hardware",
            :tags => ["Networking","COTS"],
            :vendor => "Cisco",
            :product => "Email Security Appliance",
            :match_details => "page title",
            :version => nil,
            :dynamic_version => lambda {|x| _first_body_capture(x,/Email Security Appliance   (.*?) \(/)},
            :match_type => :content_body,
            :match_content =>  /<title>        Cisco         Email Security Appliance/,
            :hide => false,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "hardware",
            :tags => ["Networking","COTS","Firewall","Wireless"],
            :vendor => "Cisco",
            :product => "Meraki",
            :match_details => "Meraki logo on an on-prem box",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<img id="header_logo" src="images\/meraki-logo.png"/,
            :hide => false,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Networking","COTS", "VPN"],
            :vendor => "Cisco",
            :product =>"Adaptive Security Appliance Software",
            :match_details =>"Cisco SSL VPN",
            :version => nil,
            :match_type => :content_cookies,
            :match_content =>  /webvpn/,
            :hide => false,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Networking","COTS", "VPN"],
            :vendor => "Cisco",
            :product =>"Adaptive Security Appliance Software",
            :match_details =>"Cisco SSL VPN",
            :version => nil,
            :match_type => :content_body,
            :match_content => /document.location.replace\(\"\/\+CSCOE\+\/logon.html\"\)/,
            :hide => false,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Networking","COTS", "VPN"],
            :vendor => "Cisco",
            :product => "IOS",
            :match_details => "Cisco Router",
            :version => nil,
            :match_type => :content_headers,
            :match_content =>  /server: cisco-IOS/,
            :hide => false,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Networking","COTS", "Hypervisor"],
            :vendor => "Cisco",
            :product =>"vManage",
            :match_details => "page title",
            :version => nil,
            :match_type => :content_body,
            :match_content => /<title>Cisco vManage/,
            :hide => false,
            :paths => ["#{url}"]
          },
        ]
      end

    end
  end
  end
  end
