require 'test_helper'

class ProductTest < ActiveSupport::TestCase
    fixtures :products
    
    test "product attributes must not be empty" do
        product = Product.new
        assert product.invalid?
        assert product.errors[:title].any?
        assert product.errors[:description].any?
        assert product.errors[:price].any?
        assert product.errors[:image_url].any?

    test "product price must be positive" do
        product = Product.new(:title => "Book"
                              :description => "Awesome!"
                              :image_url => "skdjh.jpg")
        product.price = -1
        assert product.invalid?
        assert_equal "must be greater than or equal to 0.01",
            product.errors[:price].join('; ')
        
        product.price = 0
        assert product.invalid?
        assert_equal "must be greater than or equal to 0.01",
            product.errors[:price].join('; ')
        
        product.price = 1
        assert product.valid?
    
    def new_product(image_url)
        product.new(:title => "blech"
                    :description => "gah"
                    :price => 1,
                    :image_url => image_url)
        end
    
    test "image uel" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg 
            http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more}
    
    ok.each do |name|
        assert new_product(name).valid?, "#{name} shouldn't be invalid"

    bad.each do |name|
        assert new_product(name).invalid?, "#{name} shouldn't be invalid"
    
    test "product is not valid without a unique title" do
        product = Product.new(:title => products(:ruby).title,
                              :description => "kfksdj",
                              :price => 1,
                              :image_url => "fred.gif")
    assert !product.save
    assert_equal I18.translate('activerecord.errors.messages.taken'),
                    product.errors[:title].join('; ')
    end
end
