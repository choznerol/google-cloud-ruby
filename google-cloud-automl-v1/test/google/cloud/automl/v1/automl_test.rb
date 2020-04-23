# frozen_string_literal: true

# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "simplecov"
require "minitest/autorun"

require "gapic/grpc/service_stub"

require "google/cloud/automl/v1/service_pb"
require "google/cloud/automl/v1/service_services_pb"
require "google/cloud/automl/v1/automl"

class Google::Cloud::AutoML::V1::AutoML::ClientTest < Minitest::Test
  class ClientStub
    attr_accessor :call_rpc_count, :requests

    def initialize response, operation, &block
      @response = response
      @operation = operation
      @block = block
      @call_rpc_count = 0
      @requests = []
    end

    def call_rpc *args
      @call_rpc_count += 1

      @requests << @block&.call(*args)

      yield @response, @operation if block_given?

      @response
    end
  end

  def test_create_dataset
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    dataset = {}

    create_dataset_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_dataset, name
      assert_kind_of Google::Cloud::AutoML::V1::CreateDatasetRequest, request
      assert_equal "hello world", request.parent
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::AutoML::V1::Dataset), request.dataset
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_dataset_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_dataset({ parent: parent, dataset: dataset }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_dataset parent: parent, dataset: dataset do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_dataset Google::Cloud::AutoML::V1::CreateDatasetRequest.new(parent: parent, dataset: dataset) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_dataset({ parent: parent, dataset: dataset }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_dataset Google::Cloud::AutoML::V1::CreateDatasetRequest.new(parent: parent, dataset: dataset), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_dataset_client_stub.call_rpc_count
    end
  end

  def test_get_dataset
    # Create GRPC objects.
    grpc_response = Google::Cloud::AutoML::V1::Dataset.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_dataset_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_dataset, name
      assert_kind_of Google::Cloud::AutoML::V1::GetDatasetRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_dataset_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_dataset({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_dataset name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_dataset Google::Cloud::AutoML::V1::GetDatasetRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_dataset({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_dataset Google::Cloud::AutoML::V1::GetDatasetRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_dataset_client_stub.call_rpc_count
    end
  end

  def test_list_datasets
    # Create GRPC objects.
    grpc_response = Google::Cloud::AutoML::V1::ListDatasetsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    filter = "hello world"
    page_size = 42
    page_token = "hello world"

    list_datasets_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_datasets, name
      assert_kind_of Google::Cloud::AutoML::V1::ListDatasetsRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.filter
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_datasets_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_datasets({ parent: parent, filter: filter, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_datasets parent: parent, filter: filter, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_datasets Google::Cloud::AutoML::V1::ListDatasetsRequest.new(parent: parent, filter: filter, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_datasets({ parent: parent, filter: filter, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_datasets Google::Cloud::AutoML::V1::ListDatasetsRequest.new(parent: parent, filter: filter, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_datasets_client_stub.call_rpc_count
    end
  end

  def test_update_dataset
    # Create GRPC objects.
    grpc_response = Google::Cloud::AutoML::V1::Dataset.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    dataset = {}
    update_mask = {}

    update_dataset_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_dataset, name
      assert_kind_of Google::Cloud::AutoML::V1::UpdateDatasetRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::AutoML::V1::Dataset), request.dataset
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_dataset_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_dataset({ dataset: dataset, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_dataset dataset: dataset, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_dataset Google::Cloud::AutoML::V1::UpdateDatasetRequest.new(dataset: dataset, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_dataset({ dataset: dataset, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_dataset Google::Cloud::AutoML::V1::UpdateDatasetRequest.new(dataset: dataset, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_dataset_client_stub.call_rpc_count
    end
  end

  def test_delete_dataset
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_dataset_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_dataset, name
      assert_kind_of Google::Cloud::AutoML::V1::DeleteDatasetRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_dataset_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_dataset({ name: name }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_dataset name: name do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_dataset Google::Cloud::AutoML::V1::DeleteDatasetRequest.new(name: name) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_dataset({ name: name }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_dataset Google::Cloud::AutoML::V1::DeleteDatasetRequest.new(name: name), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_dataset_client_stub.call_rpc_count
    end
  end

  def test_import_data
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    input_config = {}

    import_data_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :import_data, name
      assert_kind_of Google::Cloud::AutoML::V1::ImportDataRequest, request
      assert_equal "hello world", request.name
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::AutoML::V1::InputConfig), request.input_config
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, import_data_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.import_data({ name: name, input_config: input_config }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.import_data name: name, input_config: input_config do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.import_data Google::Cloud::AutoML::V1::ImportDataRequest.new(name: name, input_config: input_config) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.import_data({ name: name, input_config: input_config }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.import_data Google::Cloud::AutoML::V1::ImportDataRequest.new(name: name, input_config: input_config), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, import_data_client_stub.call_rpc_count
    end
  end

  def test_export_data
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    output_config = {}

    export_data_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :export_data, name
      assert_kind_of Google::Cloud::AutoML::V1::ExportDataRequest, request
      assert_equal "hello world", request.name
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::AutoML::V1::OutputConfig), request.output_config
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, export_data_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.export_data({ name: name, output_config: output_config }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.export_data name: name, output_config: output_config do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.export_data Google::Cloud::AutoML::V1::ExportDataRequest.new(name: name, output_config: output_config) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.export_data({ name: name, output_config: output_config }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.export_data Google::Cloud::AutoML::V1::ExportDataRequest.new(name: name, output_config: output_config), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, export_data_client_stub.call_rpc_count
    end
  end

  def test_get_annotation_spec
    # Create GRPC objects.
    grpc_response = Google::Cloud::AutoML::V1::AnnotationSpec.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_annotation_spec_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_annotation_spec, name
      assert_kind_of Google::Cloud::AutoML::V1::GetAnnotationSpecRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_annotation_spec_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_annotation_spec({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_annotation_spec name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_annotation_spec Google::Cloud::AutoML::V1::GetAnnotationSpecRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_annotation_spec({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_annotation_spec Google::Cloud::AutoML::V1::GetAnnotationSpecRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_annotation_spec_client_stub.call_rpc_count
    end
  end

  def test_create_model
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    model = {}

    create_model_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_model, name
      assert_kind_of Google::Cloud::AutoML::V1::CreateModelRequest, request
      assert_equal "hello world", request.parent
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::AutoML::V1::Model), request.model
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_model_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_model({ parent: parent, model: model }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_model parent: parent, model: model do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_model Google::Cloud::AutoML::V1::CreateModelRequest.new(parent: parent, model: model) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_model({ parent: parent, model: model }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_model Google::Cloud::AutoML::V1::CreateModelRequest.new(parent: parent, model: model), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_model_client_stub.call_rpc_count
    end
  end

  def test_get_model
    # Create GRPC objects.
    grpc_response = Google::Cloud::AutoML::V1::Model.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_model_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_model, name
      assert_kind_of Google::Cloud::AutoML::V1::GetModelRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_model_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_model({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_model name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_model Google::Cloud::AutoML::V1::GetModelRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_model({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_model Google::Cloud::AutoML::V1::GetModelRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_model_client_stub.call_rpc_count
    end
  end

  def test_list_models
    # Create GRPC objects.
    grpc_response = Google::Cloud::AutoML::V1::ListModelsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    filter = "hello world"
    page_size = 42
    page_token = "hello world"

    list_models_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_models, name
      assert_kind_of Google::Cloud::AutoML::V1::ListModelsRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.filter
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_models_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_models({ parent: parent, filter: filter, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_models parent: parent, filter: filter, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_models Google::Cloud::AutoML::V1::ListModelsRequest.new(parent: parent, filter: filter, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_models({ parent: parent, filter: filter, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_models Google::Cloud::AutoML::V1::ListModelsRequest.new(parent: parent, filter: filter, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_models_client_stub.call_rpc_count
    end
  end

  def test_delete_model
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_model_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_model, name
      assert_kind_of Google::Cloud::AutoML::V1::DeleteModelRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_model_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_model({ name: name }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_model name: name do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_model Google::Cloud::AutoML::V1::DeleteModelRequest.new(name: name) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_model({ name: name }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_model Google::Cloud::AutoML::V1::DeleteModelRequest.new(name: name), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_model_client_stub.call_rpc_count
    end
  end

  def test_update_model
    # Create GRPC objects.
    grpc_response = Google::Cloud::AutoML::V1::Model.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    model = {}
    update_mask = {}

    update_model_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_model, name
      assert_kind_of Google::Cloud::AutoML::V1::UpdateModelRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::AutoML::V1::Model), request.model
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_model_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_model({ model: model, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_model model: model, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_model Google::Cloud::AutoML::V1::UpdateModelRequest.new(model: model, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_model({ model: model, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_model Google::Cloud::AutoML::V1::UpdateModelRequest.new(model: model, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_model_client_stub.call_rpc_count
    end
  end

  def test_deploy_model
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    image_object_detection_model_deployment_metadata = {}

    deploy_model_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :deploy_model, name
      assert_kind_of Google::Cloud::AutoML::V1::DeployModelRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::AutoML::V1::ImageObjectDetectionModelDeploymentMetadata), request.image_object_detection_model_deployment_metadata
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, deploy_model_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.deploy_model({ image_object_detection_model_deployment_metadata: image_object_detection_model_deployment_metadata }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.deploy_model image_object_detection_model_deployment_metadata: image_object_detection_model_deployment_metadata do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.deploy_model Google::Cloud::AutoML::V1::DeployModelRequest.new(image_object_detection_model_deployment_metadata: image_object_detection_model_deployment_metadata) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.deploy_model({ image_object_detection_model_deployment_metadata: image_object_detection_model_deployment_metadata }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.deploy_model Google::Cloud::AutoML::V1::DeployModelRequest.new(image_object_detection_model_deployment_metadata: image_object_detection_model_deployment_metadata), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, deploy_model_client_stub.call_rpc_count
    end
  end

  def test_undeploy_model
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    undeploy_model_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :undeploy_model, name
      assert_kind_of Google::Cloud::AutoML::V1::UndeployModelRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, undeploy_model_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.undeploy_model({ name: name }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.undeploy_model name: name do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.undeploy_model Google::Cloud::AutoML::V1::UndeployModelRequest.new(name: name) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.undeploy_model({ name: name }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.undeploy_model Google::Cloud::AutoML::V1::UndeployModelRequest.new(name: name), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, undeploy_model_client_stub.call_rpc_count
    end
  end

  def test_export_model
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    output_config = {}

    export_model_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :export_model, name
      assert_kind_of Google::Cloud::AutoML::V1::ExportModelRequest, request
      assert_equal "hello world", request.name
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::AutoML::V1::ModelExportOutputConfig), request.output_config
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, export_model_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.export_model({ name: name, output_config: output_config }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.export_model name: name, output_config: output_config do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.export_model Google::Cloud::AutoML::V1::ExportModelRequest.new(name: name, output_config: output_config) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.export_model({ name: name, output_config: output_config }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.export_model Google::Cloud::AutoML::V1::ExportModelRequest.new(name: name, output_config: output_config), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, export_model_client_stub.call_rpc_count
    end
  end

  def test_get_model_evaluation
    # Create GRPC objects.
    grpc_response = Google::Cloud::AutoML::V1::ModelEvaluation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_model_evaluation_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_model_evaluation, name
      assert_kind_of Google::Cloud::AutoML::V1::GetModelEvaluationRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_model_evaluation_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_model_evaluation({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_model_evaluation name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_model_evaluation Google::Cloud::AutoML::V1::GetModelEvaluationRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_model_evaluation({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_model_evaluation Google::Cloud::AutoML::V1::GetModelEvaluationRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_model_evaluation_client_stub.call_rpc_count
    end
  end

  def test_list_model_evaluations
    # Create GRPC objects.
    grpc_response = Google::Cloud::AutoML::V1::ListModelEvaluationsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    filter = "hello world"
    page_size = 42
    page_token = "hello world"

    list_model_evaluations_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_model_evaluations, name
      assert_kind_of Google::Cloud::AutoML::V1::ListModelEvaluationsRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.filter
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_model_evaluations_client_stub do
      # Create client
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_model_evaluations({ parent: parent, filter: filter, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_model_evaluations parent: parent, filter: filter, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_model_evaluations Google::Cloud::AutoML::V1::ListModelEvaluationsRequest.new(parent: parent, filter: filter, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_model_evaluations({ parent: parent, filter: filter, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_model_evaluations Google::Cloud::AutoML::V1::ListModelEvaluationsRequest.new(parent: parent, filter: filter, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_model_evaluations_client_stub.call_rpc_count
    end
  end

  def test_configure
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = block_config = config = nil
    Gapic::ServiceStub.stub :new, nil do
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of Google::Cloud::AutoML::V1::AutoML::Client::Configuration, config
  end

  def test_operations_client
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = nil
    Gapic::ServiceStub.stub :new, nil do
      client = Google::Cloud::AutoML::V1::AutoML::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    assert_kind_of Google::Cloud::AutoML::V1::AutoML::Operations, client.operations_client
  end
end
