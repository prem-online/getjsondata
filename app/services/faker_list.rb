class FakerList
require 'faker'

    def get_data
        data = Faker.constants.select {|c| Faker.const_get(c).is_a? Class}
        data = data.map {|x| x.to_s}
    end
end