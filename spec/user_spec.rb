describe User do

  let(:password)  { "password" }
  let(:user) do
    User.create(email: "test@test.com", password: password, password_confirmation: password)
  end

  it 'authenticates when gives a valid email and password' do
    authenticated_user = User.authenticate(user.email, password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when gives a wrong password' do
    authenticated_user = User.authenticate(user.email, "wrongpassword")
    expect(authenticated_user).to be nil
  end

  describe "#generate_token" do
    it "saves a password recovery token" do
      expect{user.generate_token}.to change{user.password_token}
    end
    it "saves a password recovery token time" do
      Timecop.freeze do
        user.generate_token
        expect(user.password_token_time).to eq Time.now
      end
    end
  end

  describe "#self.find_by_valid_token" do
    it 'can find a user with valid token' do
      user.generate_token
      expect(User.find_by_valid_token(user.password_token)).to eq user
    end
    it "can't find a user with expired token" do
      user.generate_token
      Timecop.travel(60*60+1) do
        expect(User.find_by_valid_token(user.password_token)).to eq nil
      end
    end
  end

end
