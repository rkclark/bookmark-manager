describe SendRecoverLink do

  let(:user) { double :user, email: "test@test.com", password_token: "12345678" }
  let(:mail_gun_client) { double :mail_gun_client }
  let(:sandbox_domain_name) { ENV["MAILGUN_DOMAIN"] }

  it 'send a message to mailgun when called' do
    params = { from: "bookmarkmanager@mail.com",
              to: user.email,
              subject: "password reset",
              text: "click here to reset: https://bookmark-manager-rkclark.herokuapp.com/reset_password?token=#{user.password_token}"}
    expect(mail_gun_client).to receive(:send_message).with(sandbox_domain_name, params)
    described_class.call(user, mail_gun_client)
  end
end
