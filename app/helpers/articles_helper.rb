module ArticlesHelper
 def article_params
    params.require(:article).permit(:title, :body)
 end

 # def article_finder
 # 	Article.find(params[:id])
 # end
end
