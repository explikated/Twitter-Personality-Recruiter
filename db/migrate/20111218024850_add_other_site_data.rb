class AddOtherSiteData < ActiveRecord::Migration
  def up
    OtherSite.create([
                      {:site => "Facebook"},
                      {:site => "MySpace"},
                      {:site => "Linkedin"},
                      {:site => "Flickr"},
                      {:site => "Blogging Platform"},
                      {:site => "Google Plus"},
                      {:site => "FourSquare"},
                      {:site => "I have my own website"}
                     ])
  end

  def down
    OtherSite.destroy_all
  end
end
