require_relative 'public_controller'

module AppComponent
  class ArticlesController < PublicController
    helper_method :articles, :article

    after_action :verify_authorized, except: :index
    after_action :verify_policy_scoped, only: :index

    def index; end
    def show; end
    def edit; end

    def new
      @article = AppComponent::Article.new

      authorize article
    end

    def create
      article.author ||= pundit_user

      if article.save
        redirect_to articles_path, notice: t('.success')
      else
        flash.now[:error] = article.errors.full_messages.to_sentence
        render action: 'new'
      end
    end

    def update
      if article.update_attributes(article_params)
        redirect_to articles_path, notice: t('.success')
      else
        flash.now[:error] = article.errors.full_messages.to_sentence
        render action: 'edit'
      end
    end

    private

    def articles
      @articles ||= policy_scope(AppComponent::Article).order(created_at: :desc)
    end

    def article
      return @article if defined?(@article)

      @article = params[:id] ? articles.find_by(permalink: params[:id]) : AppComponent::Article.new(article_params)
      @article.present? ? authorize(@article) : skip_authorization
      @article
    end

    def article_params
      params.require(:article).permit(current_policy.permitted_attributes)
    end

    def current_policy
      return policy(@article) if defined?(@article)

      AppComponent::ArticlePolicy.new(pundit_user, nil)
    end
  end
end
