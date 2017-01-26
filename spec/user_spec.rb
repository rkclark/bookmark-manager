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

end
