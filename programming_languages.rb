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
  # your code here
  new_hash = {}
  languages.each do |language_details, language|
    # binding.pry
    # language.each do |language, attributes|
      # language.each do |attribute, attribute_value|
        # binding.pry
        if language == :javascript
          new_hash[language] = {
            :type => attribute_value,
            :style => [:oo, :functional]
          }
        else
          new_hash[language] = {
            :type => attribute_value,
            :style => [language_details]
          }
        # end
      # end
    end
  end
  new_hash
end

reformat_languages(hash)
