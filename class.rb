class Cars 
    attr_accessor :make, :model, :year, :image

    def initialize(make, model, year, image)
        @make=make
        @model=model
        @year=year
        @image=image
    end

    def make()
        @make
    end

    def model()
        @model
    end

    def year()
        @year
    end

    def image()
        @image
    end
end
    