class SendRecoverLink

  def initialize(mailer: nil)
    @mailer = mailer || Mailgun::Client.new(ENV["MAILGUN_KEY"])
  end

  def self.call(user, mailer=nil)
    new(mailer: mailer).call(user)
  end

  def call(user)
    mailer.send_message(ENV["MAILGUN_DOMAIN"], { from: "bookmarkmanager@mail.com",
              to: user.email,
              subject: "password reset",
              text: "click here to reset: https://bookmark-manager-rkclark.herokuapp.com/reset_password?token=#{user.password_token}"})
  end

  private
  attr_reader :mailer

  # def self.call(token, email)
  #   RestClient.post "https://api:key-4eb9913d1d6c4b4a7da5a24ee9456b64"\
  #   "@api.mailgun.net/v3/sandboxc025724550254c219388cdba70e58462.mailgun.org/messages",
  #   :from => "Mailgun Sandbox <postmaster@sandboxc025724550254c219388cdba70e58462.mailgun.org>",
  #   :to => "Richard Clark <rkingsleyclark@gmail.com>",
  #   :subject => "Hello Richard Clark",
  #   :text => "Congratulations Richard Clark, you just sent an email with Mailgun!  You are truly awesome!  You can see a record of this email in your logs: https://mailgun.com/cp/log .  You can send up to 300 emails/day from this sandbox server.  Next, you should add your own domain so you can send 10,000 emails/month for free."
  # end

end
