module Guided
  class EntryBuilder
    attr_reader :answers, :user, :entry, :mood

    def initialize(params = {})
      @answers = params[:answers] || []
      @user = params[:user]
      @mood = params[:mood]
    end

    def submit
      @entry = Entry.create(content: entry_content, user: user, mood: mood)
    end

    private

    def entry_content
      concatenated_answers.join("<br><br>")
    end

    def concatenated_answers
      answers.map do |answer|
        "#{Question.find(answer[:question_id]).content}<br>#{answer[:content]}"
      end
    end
  end
end
