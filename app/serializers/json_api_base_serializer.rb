# Ancestor for JSON-API serializers, implements
# "application/vnd.api+json" media type conventions.
#
# See: http://jsonapi.org
#
class JsonApiSerializer < ActiveModel::Serializer

  # Always make pluralized root JSON property.
  #
  def self.inherited(subclass)
    return if subclass.name.blank?
    subclass.root = subclass.plural_root_name
  end

  # Returns the hash to transform into JSON.
  #
  # The root/data property always contains an array;
  # simplify client-side handling. Example:
  #
  #     {"things": [ { ... }, { ... } ]}
  #
  def as_json(*args)
    hash = super(*args)

    # Always return an array
    unless Array===hash[root_name]
      hash[root_name] = [hash[root_name]]
    end

    hash
  end

  # To honor the jsonapi.org spec, relationships should be declared manually.
  # Has-many example:
  #
  #     attributes :links
  #
  #     def links
  #       {
  #         programs: object.programs.map(&:to_param)
  #       }
  #     end
  #
  def self.has_many(*args)
    raise "JsonApi relationships must be declared manually in a `links` attribute"
  end

  # To honor the jsonapi.org spec, relationships should be declared manually.
  # Has-one example:
  #
  #     attributes :links
  #
  #     def links
  #       {
  #         brand: object.brand && object.brand.to_param
  #       }
  #     end
  #
  def self.has_one(*args)
    raise "JsonApi relationships must be declared manually in a `links` attribute"
  end

  def self.singular_root_name
    @singular_root_name ||= name.
        demodulize.
        underscore.
        sub(/_serializer$/, '').
        to_sym
  end

  def self.plural_root_name
    @plural_root_name ||= singular_root_name.
        to_s.
        pluralize.
        to_sym
  end
end
