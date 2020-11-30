require 'pry'

hash = {
  :ruby => {
    :type => "interpreted",
    :style => [:oo]
  },
  :javascript => {
    :type => "interpreted",
    :style => [:oo, :functional]
  },
  :python => {
    :type => "interpreted",
    :style => [:oo]
  },
  :java => {
    :type => "compiled",
    :style => [:oo]
  },
  :clojure => {
    :type => "compiled",
    :style => [:functional]
  },
  :erlang => {
    :type => "compiled",
    :style => [:functional]
  },
  :scala => {
    :type => "compiled",
    :style => [:functional]
  }
}


def reformat_languages(languages)
  language_attributes = {}

  languages.each do |oo_or_functional, language_hash|
    #:oo, {:ruby => {...}}
    language_hash.each do |language, attribute_hash|
      #:ruby, {:type => "interpreted"}
      attribute_hash.each do |attribute, str_value|
        #:type, "interpreted"
        if language_attributes[language].nil?
          #if language :ruby doesn't exist in new hash
          language_attributes[language] = {}  #initiate a new hash for the value of :ruby
        end
        # this would cause us problems if we had more than one attribute we're iterating over
        language_attributes[language][:style] ||= []  # create a :style key within that hash and set it equal to an empty array
        language_attributes[language][:style] << oo_or_functional  #added oo key from first level of languages hash to this key                                
        if language_attributes[language][attribute].nil?
          #if :ruby language key doesn't have a :type key nested within it
          language_attributes[language][attribute] = str_value  #set this :type key to equal the str "interpreted"
        end
      end
    end
  end
  language_attributes
end

reformat_languages(hash)
