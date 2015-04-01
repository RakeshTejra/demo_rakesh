class ArticlesController < InheritedResources::Base

	load_and_authorize_resource

  private

    def article_params
      params.require(:article).permit(:title, :body, :photo)
    end
end

