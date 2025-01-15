class Person < ApplicationRecord
    enum person_type: { physical: "physical", legal: "legal" }
end
