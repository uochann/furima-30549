require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品を出品' do
    context "商品を出品できる場合" do
      it 'name、introduction、price、condition、category、postage_type、preparation_day、prefecture_idがある場合出品できる'