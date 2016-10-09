require 'spec_helper'

describe DiscourseApi::API::Uploads do
  subject { DiscourseApi::Client.new("http://localhost:3000", "test_d7fd0429940", "test_user") }

  describe "#upload_post_image" do
    before do
      stub_post("http://localhost:3000/uploads?api_key=test_d7fd0429940&api_username=test_user").to_return(body: fixture("upload_post_image.json"), headers: { content_type: "application/json" })
    end

    it "uploads an image via URL" do
      image = "https://meta-discourse.global.ssl.fastly.net/user_avatar/meta.discourse.org/sam/120/5243.png"
      args = { url: image }
      response = subject.upload_post_image(args)
      expect(response["url"]).to eq("/uploads/default/original/1X/417e624d2453925e6c68748b9aa67637c284b5aa.jpg")
    end
  end
end
