1. 参数类型
   ~~~ruby
      parameter name: :name, in: :query, type: :string, description: 'App的后台名称, id和name二选一'
	  parameter name: :Authorization, in: :header, type: :string, description: '用户认证'
      parameter name: :id, in: :path, type: :string, description: 'id'
      parameter name: :request_params, in: :body, schema: {
        type: :object,
        properties: {
          duration: { type: :string, description: 'duration' },
          name: { type: :string, description: 'name' },
          origin_price: { type: :number, description: 'origin_price' },
          price: { type: :number, description: 'price' }
        }
      }
   ~~~
2.
