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

  def stub_current_user
    allow_any_instance_of(ApplicationController)
      .to receive(:current_user).and_return(user)
  end
end
