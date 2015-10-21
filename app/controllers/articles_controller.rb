class ArticlesController < PublicController
  helper_method :articles, :article

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  def index; end
  def show; end
  def edit; end

  def new
    @article ||= articles.new
    authorize @article
  end

  def create
    article.author ||= current_user

    if article.save
      redirect_to edit_article_path(article), notice: t('.success')
    else
      render :new
    end
  end

  def update
    if article.update_attributes(article_params)
      redirect_to edit_article_path(article.reload), notice: t('.success')
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

    @article = params[:id] ? articles.find_by(permalink: params[:id]) : articles.new(article_params)
    @article.present? ? authorize(@article) : skip_authorization
    @article
  end

  def article_params
    params.require(:article).permit(:permalink, :title, :content,
                                    :content_intro, :published, :picture_id)
  end
end