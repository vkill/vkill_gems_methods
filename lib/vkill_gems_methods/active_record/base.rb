module VkillGemsMethods
  module ActiveRecord
    module Base
      extend ActiveSupport::Concern

      module ClassMethods

          def all_models(&block)
            models_block descendants_all_models, &block
          end

          def abstract_models(&block)
            models_block descendants_abstract_models, &block
          end

          def single_table_inheritance_super_models(&block)
            models_block descendants_single_table_inheritance_super_models, &block
          end

          def models(&block)
            models_block descendants_models, &block
          end

        private
          def models_block(models, &block)
            models.each do |model|
              yield model, attributes(model)
            end if block
          end

          def descendants_all_models
            @@descendants_modeles ||= (
              ::Rails.application.eager_load!
              ::ActiveRecord::Base.descendants.delete_if do |model|
                !model.table_exists? or !model.respond_to?(:columns_hash)
              end
            )
          end

          def descendants_abstract_models
            @@descendants_abstract_models ||= (
              descendants_all_models.take_while do |model|
                model.abstract_class?
              end
            )
          end

          def descendants_single_table_inheritance_super_models
            @@descendants_single_table_inheritance_super_models ||= (
              descendants_all_models.take_while do |model|
                model.columns_hash.keys.include?('type') and !model.descendants.blank?
              end
            )
          end

          def descendants_models
            @@descendants_models ||= (
              descendants_all_models - descendants_abstract_models - descendants_single_table_inheritance_super_models
            )
          end

          # result => { column:type }
          def attributes(model)
            Hash[ model.columns_hash.map { |column_name,column_attr| [column_name, column_attr.type] } ]
          end

      end

      module InstanceMethods

      end
    end
  end
end

