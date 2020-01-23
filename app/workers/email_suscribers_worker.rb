class EmailSuscribersWorker
    include Sidekiq::Worker

    def perform()
        put "HOla mundo"
    end

end