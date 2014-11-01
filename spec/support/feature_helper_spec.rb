module FeatureHelper
  def mock_auth
    OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
      provider: 'instagram',
      uid: '123456',
      info:
      {
      name:     'boogly-boo',
      nickname: 'boo',
      image:    'http://image.google.com/something.jpg'
    }
    })
  end

  def instagram_api_response
    { "data" =>
    [{"attribution"=>nil,
      "tags"=>["besties"],
      "type"=>"image",
      "location"=>{"latitude"=>39.74962, "longitude"=>-105.000136111},
      "comments"=>{"count"=>0, "data"=>[]},
      "filter"=>"Rise",
      "created_time"=>"1414804420",
      "link"=>"http://instagram.com/p/u1pg_qLgtt/",
      "likes"=>{"count"=>0, "data"=>[]},
      "images"=>
    {"low_resolution"=>
      {"url"=>
        "http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10731736_396284220521663_1520459156_a.jpg",
          "width"=>306,
          "height"=>306},
          "thumbnail"=>
        {"url"=>
          "http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10731736_396284220521663_1520459156_s.jpg",
            "width"=>150,
            "height"=>150},
            "standard_resolution"=>
          {"url"=>
            "http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10731736_396284220521663_1520459156_n.jpg",
              "width"=>640,
              "height"=>640}},
              "users_in_photo"=>[],
              "caption"=>
            {"created_time"=>"1414804420",
              "text"=>"#besties",
              "from"=>
            {"username"=>"notfakemarc",
              "profile_picture"=>"http://images.ak.instagram.com/profiles/anonymousUser.jpg",
              "id"=>"1546672945",
              "full_name"=>"notfakemarc"},
              "id"=>"843763093550795252"},
              "user_has_liked"=>false,
              "id"=>"843763092485442413_1546672945",
              "user"=>
            {"username"=>"notfakemarc",
              "website"=>"",
              "profile_picture"=>"http://images.ak.instagram.com/profiles/anonymousUser.jpg",
              "full_name"=>"notfakemarc",
              "bio"=>"",
              "id"=>"1546672945"}},
              {"attribution"=>nil,
                "tags"=>["dsa"],
                "type"=>"image",
                "location"=>
            {"latitude"=>39.749574,
              "name"=>"Turing School",
              "longitude"=>-104.999971,
              "id"=>451194042},
              "comments"=>{"count"=>0, "data"=>[]},
              "filter"=>"Hefe",
              "created_time"=>"1414772194",
              "link"=>"http://instagram.com/p/u0sDK4LghK/",
              "likes"=>{"count"=>0, "data"=>[]},
              "images"=>
            {"low_resolution"=>
              {"url"=>
                "http://scontent-b.cdninstagram.com/hphotos-xaf1/t51.2885-15/10731669_937281106286155_1849634485_a.jpg",
                  "width"=>306,
                  "height"=>306},
                  "thumbnail"=>
                {"url"=>
                  "http://scontent-b.cdninstagram.com/hphotos-xaf1/t51.2885-15/10731669_937281106286155_1849634485_s.jpg",
                    "width"=>150,
                    "height"=>150},
                    "standard_resolution"=>
                  {"url"=>
                    "http://scontent-b.cdninstagram.com/hphotos-xaf1/t51.2885-15/10731669_937281106286155_1849634485_n.jpg",
                      "width"=>640,
                      "height"=>640}},
                      "users_in_photo"=>[],
                      "caption"=>
                    {"created_time"=>"1414772194",
                      "text"=>"Rolando goes hard in the paint for #DSA morning meetups",
                      "from"=>
                    {"username"=>"notfakemarc",
                      "profile_picture"=>"http://images.ak.instagram.com/profiles/anonymousUser.jpg",
                      "id"=>"1546672945",
                      "full_name"=>"notfakemarc"},
                      "id"=>"843492763737393702"},
                      "user_has_liked"=>false,
                      "id"=>"843492762110003274_1546672945",
                      "user"=>
                    {"username"=>"notfakemarc",
                      "website"=>"",
                      "profile_picture"=>"http://images.ak.instagram.com/profiles/anonymousUser.jpg",
                      "full_name"=>"notfakemarc",
                      "bio"=>"",
                      "id"=>"1546672945"}}]
    }
  end

  def stub_current_user
    allow_any_instance_of(ApplicationController)
    .to receive(:current_user).and_return(user)
  end
end
