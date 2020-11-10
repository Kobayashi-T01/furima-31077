require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報登録' do
    context '保存がうまくいく時' do
      it '全ての情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    
    context '保存がうまくいかない時' do
      it '画像が空の時' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空の時' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空の時' do
        @item.explain = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      
      it 'カテゴリーが空の時' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end

      it 'カテゴリーが1の時' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態が空の時' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end

      it '商品の状態が1の時' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it '配送料の負担が空の時' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee is not a number")
      end

      it '配送料の負担が1の時' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end

      it '発送元の地域が空の時' do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area is not a number")
      end

      it '発送元の地域が1の時' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end

      it '発送までの日数が空の時' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day is not a number")
      end

      it '発送までの日数が1の時' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end

      it '販売価格が空の時' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が半角数字以外入力の時' do
        @item.price = "aあア１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格が300以下の時' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end

      it '販売価格が9,999,999以上の時' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end