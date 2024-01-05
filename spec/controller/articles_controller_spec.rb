# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    it 'assigns @articles' do
      articles = FactoryBot.create_list(:article, 3)
      get :index
      expect(assigns(:articles)).to eq(articles)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:article) { FactoryBot.create(:article) }

    it 'returns a success response' do
      get :show, params: { id: article.to_param }
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get :show, params: { id: article.to_param }
      expect(response).to render_template(:show)
    end

    it 'assigns @article' do
      get :show, params: { id: article.to_param }
      expect(assigns(:article)).to eq(article)
    end
  end

  describe 'GET #new' do
    it 'assigns a new article as @article' do
      get :new
      expect(assigns(:article)).to be_a_new(Article)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    let(:article) { FactoryBot.create(:article) }

    it 'assigns the requested article as @article' do
      get :edit, params: { id: article.to_param }
      expect(assigns(:article)).to eq(article)
    end

    it 'renders the edit template' do
      get :edit, params: { id: article.to_param }
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Article' do
        expect do
          post :create, params: { article: FactoryBot.attributes_for(:article) }
        end.to change(Article, :count).by(1)
      end

      it 'redirects to the created article' do
        post :create, params: { article: FactoryBot.attributes_for(:article) }
        expect(response).to redirect_to(article_path(Article.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Article' do
        expect do
          post :create, params: { article: FactoryBot.attributes_for(:article, title: nil) }
        end.to_not change(Article, :count)
      end

      it 'renders the new template' do
        post :create, params: { article: FactoryBot.attributes_for(:article, title: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    let!(:article) { FactoryBot.create(:article) }

    context 'with valid parameters' do
      it 'updates the requested article' do
        patch :update, params: { id: article.to_param, article: { title: 'Updated Title' } }
        article.reload
        expect(article.title).to eq('Updated Title')
      end

      it 'redirects to the article' do
        patch :update, params: { id: article.to_param, article: { title: 'Updated Title' } }
        expect(response).to redirect_to(article_path(article))
      end
    end

    context 'with invalid parameters' do
      it 'does not update the article' do
        patch :update, params: { id: article.to_param, article: { title: nil } }
        article.reload
        expect(article.title).not_to eq(nil)
      end

      it 'renders the edit template' do
        patch :update, params: { id: article.to_param, article: { title: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:article) { FactoryBot.create(:article) }

    it 'destroys the requested article' do
      expect do
        delete :destroy, params: { id: article.to_param }
      end.to change(Article, :count).by(-1)
    end

    it 'redirects to the articles list' do
      delete :destroy, params: { id: article.to_param }
      expect(response).to redirect_to(articles_url)
    end
  end
end
