class Displayer
	def update(product_id, session)
		@product = Product.find(product_id)
		session = @product.user.id
	end
end
