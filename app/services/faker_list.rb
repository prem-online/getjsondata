class FakerList
require 'faker'

    def get_classes
        data = Faker.constants.select {|c| Faker.const_get(c).is_a? Class}
        data = data.map {|x| x.to_s}
    end

    def get_data(data_class,quantity)
        met0_classes = [
            "Name",
            "Alphanumeric",
            "Ancient",
            "App",
            "Appliance",
            "Artist",
            "Bank",
            "Barcode",
            "Beer",
            "Blood",
            "Book",
            "Books",
            "Boolean",
            "Business",
            "Camera",
            "Code",
            "Coffee",
            "Coin",
            "Computer",
            "Construction",
            "Cosmere",
            "Currency",
            "Demographic",
            "Dessert",
            "Device",
            "Educator",
            "Emotion",
            "Esport",
            "Finance",
            "Food",
            "Game",
            "Gender",
            "Hipster",
            "Hobby",
            "House",
            "Job",
            "Json",
            "Kpop",
            "Markdown",
            "Marketing",
            "Measurement",
            "Military",
            "Mountain",
            "Movie",
            "Music",
            "Name",
            "Nation",
            "Number",
            "Quote",
            "Relationship",
            "Restaurant",
            "Science",
            "Show",
            "Space",
            "Sport",
            "Subscription",
            "Superhero",
            "Tea",
            "Team",
            "Time",
            "University",
            "Verb",
      
        ]
        if met0_classes.include?(data_class)
            result = get_met0(data_class,quantity)
            return result
        end
        case data_class
        when "Address"
            # met18
            result = get_address("Address",quantity)
        when "Base"
            # met0
            result = get_base("Base",quantity)
        when "Adjective"
            # met12
            result = get_adjective("Adjective",quantity)
        else
            result = {data: "No data found"}
        end
        result
    end

    def get_adjective(data_class, quantity)
        data = Faker.const_get data_class.capitalize
        met_1_2 = data.methods[rand(0..1)]
        send_result(quantity,data,met_1_2)
    end

    def get_address(data_class, quantity)
        data = Faker.const_get data_class.capitalize
        met18 = data.methods[18]
        send_result(quantity,data,met18)
    end

    def send_result(quantity,data,met)
        result = []
        quantity.times {result << data.send(met)}
        result
    end

    def get_met0(data_class,quantity)
        data = Faker.const_get data_class.capitalize
        met0 = data.methods[0]
        send_result(quantity,data,met0)
    end
end