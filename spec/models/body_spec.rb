require 'rails_helper'

RSpec.describe Body, type: :model do
  before do
    user = FactoryBot.create(:user)
    @body = FactoryBot.create(:body, user_id: user.id)
  end
  describe '身体情報' do
    context '登録できるとき' do
      it '各項目に正しく入力がなされているなら登録できる' do
        expect(@body).to be_valid
      end
    end
  end
end
