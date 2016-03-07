class ArticlesController < PublicController
  helper_method :articles, :article

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index; end
  def show; end
  def edit
    article.build_seo_content unless article.seo_content
  end

  def new
    @article = Article.new
    article.build_seo_content

    authorize article
  end

  def create
    article.author ||= current_user

    if article.save
      redirect_to articles_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if article.update_attributes(article_params)
      redirect_to articles_path, notice: t('.success')
    else
      render :edit
    end
  end

  private

  def articles
    @articles ||= policy_scope(Article)
  end

  def article
    return @article if defined?(@article)

    @article = params[:id] ? articles.find_by(permalink: params[:id]) : Article.new(article_params)
    @article.present? ? authorize(@article) : skip_authorization
    @article
  end

  def article_params
    params.require(:article).permit(current_policy.permitted_attributes)
  end

  def current_policy
    return policy(@article) if defined?(@article)

    ArticlePolicy.new(pundit_user, nil)
  end
end