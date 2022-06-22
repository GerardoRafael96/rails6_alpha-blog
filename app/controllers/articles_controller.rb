class ArticlesController < ApplicationController
    
    #before_action permite ejecutar una accion antes de que se ejecute el resto de otros metodos
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    # actions 

    def show
        # @article -> variable que se puede usar en los views (instnce variable)
        # @article = Article.find(params[:id]) # busca el articulo en la base de datos
    end

    def index 
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        # @article = Article.find(params[:id]) # busca el articulo en la base de datos y muestra los datos en el formulario
    end

    def create 
        @article = Article.new(article_params) 
        @article.user = User.first
        if @article.save
            flash[:notice] = "Article was created successfully." # flash es un hash que muestra un mensaje de error[:alert] o de exito[:notice]
            redirect_to article_path(@article) # redirecciona a la ruta del articulo utilizando el id de @article
            # redirect_to @artice # sintaxis mas corta
        else
            render "new" # renderiza la vista new
        end
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render "edit"
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path
    end

    private # todos los metodos o acciones abajo de 'private' solo estan disponibles para este controlador

    def set_article
        @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(:title, :description) # params es un hash que contiene todos los parametros que se envian por post
    end
end