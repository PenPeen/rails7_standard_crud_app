class QuestionsController < ApplicationController
    # 一覧
    def index
        @questions = Question.all
    end

    # 詳細
    def show()
        id = params[:id]
        @question = Question.find(id)
        @answer = Answer.new
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
        @question = Question.find(params[:id])
    end 

    # 質問の更新
    def update
        @question = Question.find(params[:id])
        if(@question.update(question_params))
            redirect_to questions_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    # 質問の削除
    def destroy
        @question = Question.find(params[:id])
        @question.destroy

        redirect_to questions_path, status: :see_other
    end

    private 
        def question_params
            params.require(:question).permit(:title, :name, :content)
        end 
end
