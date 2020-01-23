class UserMailer < ActionMailer::Base

    def welcome_email(email)
        mail( :to => email,
        :subject=>"Welcome"
        ) do |format|
            format.text
            format.html
        end
    end

end