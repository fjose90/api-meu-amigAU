class Person < ApplicationRecord
    enum :person_type,  physical: 1, legal: 2
end
