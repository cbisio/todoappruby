class EmailSuscribersWorker
    include Sidekiq::Worker

    def perform(email)
       mail = UserMailer.welcome_email(email).deliveri_now
    end

end