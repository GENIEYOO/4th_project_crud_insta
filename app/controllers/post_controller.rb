class PostController < ApplicationController
    def index
        @posts = Post.all
    end
    
    def create
        #erb :create가 생략되어있다.
        @title = params[:title]
        @content = params[:content]
        
        Post.create(
            title: @title,
            content:  @content
        )
        
        redirect_to "/"
    end
    
    def destroy
        #erb :destroy가 생략되어 있다. 알아서 destroy.erb를 만들어줘야 한다.
        #지울 글을 찾는다.
        @id = params[:id]
        post = Post.find(@id)  
        #해당 글을 지운다.
        post.destroy
        redirect_to "/"   #destroy.erb지워줘도 된다.
    end
    
    def show
        @id = params[:id]
        @post = Post.find(@id)
    end
    
    def update
        @id = params[:id]
        @post = Post.find(@id)
        @title = params[:title]
        @content = params[:content]
        @updated_at = params[:updated_at]
        @post.update(title: @title)
        @post.update(content: @content)
        @post.update(updated_at: @updated_at)
        #redirect_to '/post/show/#{@id}' #쌍따옴표 써야한다. 
        redirect_to "/post/show/#{@id}"  #원하는 주소로 보내버릴 수 있다.
    end
    
    def modify
        @id = params[:id]
        @post = Post.find(@id)
    end
end
