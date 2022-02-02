require 'rails_helper'

RSpec.describe 'POSTS', type: :request do
  describe 'GET POSTS #index' do
    before(:example) { get('/users/15/posts#index') }

    it 'server return 200 server ok' do
      expect(response).to have_http_status(200)
    end

    it 'template rendering correctly' do
      expect(response).to render_template(:index)
    end

    it 'shows body content of index' do
      expect(response.body).to include('<h1>show the posts of a user</h1>')
    end
  end

  describe 'GET POSTS #show' do
    before(:example) { get('/users/15/posts/20') }

    it 'return 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'shows the show template' do
      expect(response).to render_template(:show)
    end

    it 'shows body content of posts/show' do
      expect(response.body).to include("<h1>show post's details</h1>")
    end
  end
end
