require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '#create' do
    it '全ての必須項目が入力されている場合出品できる' do
      expect(@item).to be_valid
    end

    it 'itemがない場合は登録できないこと' do
      @item.item = nil
      @item.valid?
      expect(@item.errors[:item]).to include("can't be blank")
    end

    it 'category_idがない場合は登録できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors[:category_id]).to include("can't be blank")
    end

    it 'product_status_idがない場合は登録できないこと' do
      @item.product_status_id = nil
      @item.valid?
      expect(@item.errors[:product_status_id]).to include("can't be blank")
    end

    it 'shipping_charges_idがない場合は登録できないこと' do
      @item.shipping_charges_id = nil
      @item.valid?
      expect(@item.errors[:shipping_charges_id]).to include("can't be blank")
    end

    it 'shipping_region_idがない場合は登録できないこと' do
      @item.shipping_region_id = nil
      @item.valid?
      expect(@item.errors[:shipping_region_id]).to include("can't be blank")
    end

    it 'shipping_date_idがない場合は登録できないこと' do
      @item.shipping_date_id = nil
      @item.valid?
      expect(@item.errors[:shipping_date_id]).to include("can't be blank")
    end

    it 'priceがない場合は登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end

    it '価格が¥300以下だと出品できないこと' do
      @item.price = 250
      @item.valid?
      expect(@item.errors[:price]).to include("must be greater than or equal to 300")
    end

    it '価格が¥9,999,999以上だと出品できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors[:price]).to include("must be less than or equal to 9999999")
    end

    it 'descriptionがない場合は登録できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors[:description]).to include("can't be blank")
    end
  end
end
