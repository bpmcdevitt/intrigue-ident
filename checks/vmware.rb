module Intrigue
module Ident
module Check
    class Vmware < Intrigue::Ident::Check::Base

      def generate_checks(url)
        [
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Hypervisor"],
            :vendor => "VMWare",
            :product =>"ESXi",
            :match_details =>"unique page string",
            :version => nil,
            :match_type => :content_body,
            :match_content => /document.write\(\"<title>\"\ \+\ ID_EESX_Welcome/,
            :paths => ["#{url}"]
          },
          {
            :type => "fingerprint",
            :category => "application",
            :tags => ["Hypervisor"],
            :vendor => "VMWare",
            :product =>"Horizon View",
            :match_details =>"page title",
            :version => nil,
            :match_type => :content_body,
            :match_content =>  /<title>VMware Horizon/,
            :paths => ["#{url}"]
          }
        ]
      end

    end
end
end
end
