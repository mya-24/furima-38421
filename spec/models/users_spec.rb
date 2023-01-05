require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '登録できる' do
      it 'データが揃っていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '登録できない' do
      it 'ニックネームがないと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスがないと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが既に登録されている場合、登録できない' do
        @user.save
        another = FactoryBot.build(:user, email: @user.email)
        another.valid?
        expect(another.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールアドレスに＠が含まれていない場合、登録できない' do
        @user.email = 'testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'パスワードがないと登録できない' do
        @user.password = ''
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが6文字以上でないと登録できない' do
        @user.password = '12345'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードが数字のみでは登録できない' do
        @user.password = '123456'
        @password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must contain both alphabets and numbers")
      end
      it 'パスワードが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must contain both alphabets and numbers")
      end
      it 'パスワードが全角英数字では登録できない' do
        @user.password = 'ｐｓｗ１２３'
        @password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must contain both alphabets and numbers")
      end
      it 'パスワードと確認用パスワードが一致しないと登録できない' do
        @user.password = 'test0123'
        @user.password_confirmation = 'test1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '氏名(全角)に苗字の入力がなければ登録できない' do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
      end
      it '氏名(全角)に名前の入力がなければ登録できない' do
        @user.lastname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji can't be blank")
      end
      it '氏名(全角)の苗字が半角文字の場合、登録できない' do
        @user.firstname_kanji = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji must enter double-type characters")
      end
      it '氏名(全角)の名前が半角文字の場合、登録できない' do
        @user.lastname_kanji = 'ﾊﾅｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kanji must enter double-type characters")
      end
      it '氏名カナ(全角)に苗字の入力がなければ登録できない' do
        @user.firstname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana can't be blank")
      end
      it '氏名カナ(全角)に名前の入力がなければ登録できない' do
        @user.lastname_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname katakana can't be blank")
      end
      it '氏名カナ(全角)の苗字が半角文字の場合、登録できない' do
        @user.firstname_katakana = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana must enter double-type katakana")
      end
      it '氏名カナ(全角)の名前が半角文字の場合、登録できない' do
        @user.lastname_katakana = 'ﾊﾅｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname katakana must enter double-type katakana")
      end
      it '氏名カナ(全角)の苗字にひらがなが入力された場合、登録できない' do
        @user.firstname_katakana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname katakana must enter double-type katakana")
      end
      it '氏名カナ(全角)の名前に漢字が入力された場合、登録できない' do
        @user.lastname_katakana = '花子'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname katakana must enter double-type katakana")
      end
      it '誕生日の入力がなければ登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

  end

end