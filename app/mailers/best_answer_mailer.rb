class BestAnswerMailer < ApplicationMailer
  def best_answered_mail(post)
    @post = post #回答がついたpost
    @best_answered_user = @post.best_answer.answer.user #ベストアンサーに選ばれたuser
    mail(
      subject: 'あなたの回答がベストアンサーに選ばれました',
      to: "#{@best_answered_user.email}"
    ) do |format|
      format.html
      format.text
    end
  end
end
