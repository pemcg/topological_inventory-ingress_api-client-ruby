=begin
#Topological Inventory Ingress API

#Topological Inventory Ingress API

OpenAPI spec version: 0.0.2
Contact: support@redhat.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 3.3.4

=end

require 'date'

module TopologicalInventoryIngressApiClient
  class VmReference
    attr_accessor :inventory_collection_name

    attr_accessor :reference

    attr_accessor :ref

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'inventory_collection_name' => :'inventory_collection_name',
        :'reference' => :'reference',
        :'ref' => :'ref'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'inventory_collection_name' => :'String',
        :'reference' => :'ClusterReferenceReference',
        :'ref' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'inventory_collection_name')
        self.inventory_collection_name = attributes[:'inventory_collection_name']
      end

      if attributes.has_key?(:'reference')
        self.reference = attributes[:'reference']
      end

      if attributes.has_key?(:'ref')
        self.ref = attributes[:'ref']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @inventory_collection_name.nil?
        invalid_properties.push('invalid value for "inventory_collection_name", inventory_collection_name cannot be nil.')
      end

      if @inventory_collection_name !~ Regexp.new(/^vms$/)
        invalid_properties.push('invalid value for "inventory_collection_name", must conform to the pattern /^vms$/.')
      end

      if @reference.nil?
        invalid_properties.push('invalid value for "reference", reference cannot be nil.')
      end

      if @ref.nil?
        invalid_properties.push('invalid value for "ref", ref cannot be nil.')
      end

      if @ref !~ Regexp.new(/^manager_ref$/)
        invalid_properties.push('invalid value for "ref", must conform to the pattern /^manager_ref$/.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @inventory_collection_name.nil?
      return false if @inventory_collection_name !~ Regexp.new(/^vms$/)
      return false if @reference.nil?
      return false if @ref.nil?
      return false if @ref !~ Regexp.new(/^manager_ref$/)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] inventory_collection_name Value to be assigned
    def inventory_collection_name=(inventory_collection_name)
      if inventory_collection_name.nil?
        fail ArgumentError, 'inventory_collection_name cannot be nil'
      end

      if inventory_collection_name !~ Regexp.new(/^vms$/)
        fail ArgumentError, 'invalid value for "inventory_collection_name", must conform to the pattern /^vms$/.'
      end

      @inventory_collection_name = inventory_collection_name
    end

    # Custom attribute writer method with validation
    # @param [Object] ref Value to be assigned
    def ref=(ref)
      if ref.nil?
        fail ArgumentError, 'ref cannot be nil'
      end

      if ref !~ Regexp.new(/^manager_ref$/)
        fail ArgumentError, 'invalid value for "ref", must conform to the pattern /^manager_ref$/.'
      end

      @ref = ref
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          inventory_collection_name == o.inventory_collection_name &&
          reference == o.reference &&
          ref == o.ref
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [inventory_collection_name, reference, ref].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = TopologicalInventoryIngressApiClient.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end