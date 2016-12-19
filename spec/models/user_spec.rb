require "rails_helper"

RSpec.describe User, type: :model do
  describe ".from_omniauth" do
    it "when email exist" do
      user = User.create(
        full_name: "Juanito",
        email: "example@example.com",
        password: "my_secure_password",
        uid: nil
      )

      info = OmniAuth::AuthHash.new({
        uid: 123,
        provider: "facebook",
        "extra" => {
          "raw_info" => {
            "email" => "example@example.com",
            "id" => "1",
            "name" => "Juanito"
          }
        },
        "info" => {
          "email" => "example@example.com",
          "name" => "Juanito"
        }
      })

      omni_user = User.from_omniauth(info)
      user = User.find_by(email: "example@example.com")

      expect(user.id).to eq(omni_user.id)
      expect(user.full_name).to eq(omni_user.full_name)
      expect(user.uid).to eq("123")
    end

    it "when facebook_id and provider exists" do
      user = User.create(
        full_name: "Juanito",
        email: "other@example.com",
        provider: "facebook",
        uid: 123,
        password: "my_secret_password"
      )

      info = OmniAuth::AuthHash.new({
        uid: 123,
        provider: "facebook",
        "extra" => {
        "raw_info" => {
          "email" => "other_email@example.com",
          "id" => "1",
          "name" => "Juanito"
        }
      },
      "info" => {
        "email" => "other_email@example.com",
        "name" => "Juanito"
      }
      })

      omni_user = User.from_omniauth(info)
      user = User.find_by(provider: "facebook", uid: 123)

      expect(user.id).to eq(omni_user.id)
      expect(user.email).to eq(omni_user.email)
    end

    it "when user doesn't exists" do
      info = OmniAuth::AuthHash.new({
        uid: 123,
        provider: "facebook",
        "extra" => {
        "raw_info" => {
          "email" => "juanito@example.com",
          "id" => "1",
          "name" => "Juanito"
        }
      },
      "info" => {
        "email" => "juanito@example.com",
        "name" => "Juanito"
      }
      })

      expect {
        new_user = User.from_omniauth(info)
        expect(new_user.full_name).to eq("Juanito")
        expect(new_user.uid).to eq("123")
        expect(new_user.email).to eq("juanito@example.com")

      }.to change{User.count}.by(1)
    end
  end
end
