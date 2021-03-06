# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/bigquery/storage/v1/stream.proto

require 'google/protobuf'

require 'google/api/field_behavior_pb'
require 'google/api/resource_pb'
require 'google/cloud/bigquery/storage/v1/arrow_pb'
require 'google/cloud/bigquery/storage/v1/avro_pb'
require 'google/protobuf/timestamp_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("google/cloud/bigquery/storage/v1/stream.proto", :syntax => :proto3) do
    add_message "google.cloud.bigquery.storage.v1.ReadSession" do
      optional :name, :string, 1
      optional :expire_time, :message, 2, "google.protobuf.Timestamp"
      optional :data_format, :enum, 3, "google.cloud.bigquery.storage.v1.DataFormat"
      optional :table, :string, 6
      optional :table_modifiers, :message, 7, "google.cloud.bigquery.storage.v1.ReadSession.TableModifiers"
      optional :read_options, :message, 8, "google.cloud.bigquery.storage.v1.ReadSession.TableReadOptions"
      repeated :streams, :message, 10, "google.cloud.bigquery.storage.v1.ReadStream"
      oneof :schema do
        optional :avro_schema, :message, 4, "google.cloud.bigquery.storage.v1.AvroSchema"
        optional :arrow_schema, :message, 5, "google.cloud.bigquery.storage.v1.ArrowSchema"
      end
    end
    add_message "google.cloud.bigquery.storage.v1.ReadSession.TableModifiers" do
      optional :snapshot_time, :message, 1, "google.protobuf.Timestamp"
    end
    add_message "google.cloud.bigquery.storage.v1.ReadSession.TableReadOptions" do
      repeated :selected_fields, :string, 1
      optional :row_restriction, :string, 2
    end
    add_message "google.cloud.bigquery.storage.v1.ReadStream" do
      optional :name, :string, 1
    end
    add_enum "google.cloud.bigquery.storage.v1.DataFormat" do
      value :DATA_FORMAT_UNSPECIFIED, 0
      value :AVRO, 1
      value :ARROW, 2
    end
  end
end

module Google
  module Cloud
    module Bigquery
      module Storage
        module V1
          ReadSession = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.storage.v1.ReadSession").msgclass
          ReadSession::TableModifiers = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.storage.v1.ReadSession.TableModifiers").msgclass
          ReadSession::TableReadOptions = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.storage.v1.ReadSession.TableReadOptions").msgclass
          ReadStream = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.storage.v1.ReadStream").msgclass
          DataFormat = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("google.cloud.bigquery.storage.v1.DataFormat").enummodule
        end
      end
    end
  end
end
