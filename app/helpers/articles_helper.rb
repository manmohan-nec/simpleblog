module ArticlesHelper
 def article_params
    params.require(:article).permit(:title, :body, :tag_lister)
 end

 # def article_finder
 # 	Article.find(params[:id])
 # end
end
