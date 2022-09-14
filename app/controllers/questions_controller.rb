class QuestionsController < ApplicationController
    # 一覧
    def index
        @questions = Question.all
    end

    # 詳細
    def show()
        id = params[:id]
        @question = Question.find(id)
    end

    # 作成
    def new
        @question = Question.new
    end

    # 登録
    def create
        @question = Question.new(question_params)
        if @question.save
            redirect_to @question
        else
            render 'new', status: :unprocessable_entity
        end
    end

    # 質問の編集
    def edit

    end 

    # 質問の更新
    def update

    end

    # 質問の削除
    def destory

    end

    private 
        def question_params
            params.require(:question).permit(:title, :name, :content)
        end 
end
