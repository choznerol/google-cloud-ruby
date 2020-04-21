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

require "google/cloud/talent/v4beta1/tenant_service_pb"
require "google/cloud/talent/v4beta1/tenant_service_services_pb"
require "google/cloud/talent/v4beta1/tenant_service"

class Google::Cloud::Talent::V4beta1::TenantService::ClientTest < Minitest::Test
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

  def test_create_tenant
    # Create GRPC objects.
    grpc_response = Google::Cloud::Talent::V4beta1::Tenant.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    tenant = {}

    create_tenant_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_tenant, name
      assert_kind_of Google::Cloud::Talent::V4beta1::CreateTenantRequest, request
      assert_equal "hello world", request.parent
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Talent::V4beta1::Tenant), request.tenant
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_tenant_client_stub do
      # Create client
      client = Google::Cloud::Talent::V4beta1::TenantService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_tenant({ parent: parent, tenant: tenant }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_tenant parent: parent, tenant: tenant do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_tenant Google::Cloud::Talent::V4beta1::CreateTenantRequest.new(parent: parent, tenant: tenant) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_tenant({ parent: parent, tenant: tenant }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_tenant Google::Cloud::Talent::V4beta1::CreateTenantRequest.new(parent: parent, tenant: tenant), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_tenant_client_stub.call_rpc_count
    end
  end

  def test_get_tenant
    # Create GRPC objects.
    grpc_response = Google::Cloud::Talent::V4beta1::Tenant.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_tenant_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_tenant, name
      assert_kind_of Google::Cloud::Talent::V4beta1::GetTenantRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_tenant_client_stub do
      # Create client
      client = Google::Cloud::Talent::V4beta1::TenantService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_tenant({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_tenant name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_tenant Google::Cloud::Talent::V4beta1::GetTenantRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_tenant({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_tenant Google::Cloud::Talent::V4beta1::GetTenantRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_tenant_client_stub.call_rpc_count
    end
  end

  def test_update_tenant
    # Create GRPC objects.
    grpc_response = Google::Cloud::Talent::V4beta1::Tenant.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    tenant = {}
    update_mask = {}

    update_tenant_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_tenant, name
      assert_kind_of Google::Cloud::Talent::V4beta1::UpdateTenantRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Talent::V4beta1::Tenant), request.tenant
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_tenant_client_stub do
      # Create client
      client = Google::Cloud::Talent::V4beta1::TenantService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_tenant({ tenant: tenant, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_tenant tenant: tenant, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_tenant Google::Cloud::Talent::V4beta1::UpdateTenantRequest.new(tenant: tenant, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_tenant({ tenant: tenant, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_tenant Google::Cloud::Talent::V4beta1::UpdateTenantRequest.new(tenant: tenant, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_tenant_client_stub.call_rpc_count
    end
  end

  def test_delete_tenant
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_tenant_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_tenant, name
      assert_kind_of Google::Cloud::Talent::V4beta1::DeleteTenantRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_tenant_client_stub do
      # Create client
      client = Google::Cloud::Talent::V4beta1::TenantService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_tenant({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_tenant name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_tenant Google::Cloud::Talent::V4beta1::DeleteTenantRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_tenant({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_tenant Google::Cloud::Talent::V4beta1::DeleteTenantRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_tenant_client_stub.call_rpc_count
    end
  end

  def test_list_tenants
    # Create GRPC objects.
    grpc_response = Google::Cloud::Talent::V4beta1::ListTenantsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_token = "hello world"
    page_size = 42

    list_tenants_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_tenants, name
      assert_kind_of Google::Cloud::Talent::V4beta1::ListTenantsRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.page_token
      assert_equal 42, request.page_size
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_tenants_client_stub do
      # Create client
      client = Google::Cloud::Talent::V4beta1::TenantService::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_tenants({ parent: parent, page_token: page_token, page_size: page_size }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_tenants parent: parent, page_token: page_token, page_size: page_size do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_tenants Google::Cloud::Talent::V4beta1::ListTenantsRequest.new(parent: parent, page_token: page_token, page_size: page_size) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_tenants({ parent: parent, page_token: page_token, page_size: page_size }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_tenants Google::Cloud::Talent::V4beta1::ListTenantsRequest.new(parent: parent, page_token: page_token, page_size: page_size), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_tenants_client_stub.call_rpc_count
    end
  end

  def test_configure
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = block_config = config = nil
    Gapic::ServiceStub.stub :new, nil do
      client = Google::Cloud::Talent::V4beta1::TenantService::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of Google::Cloud::Talent::V4beta1::TenantService::Client::Configuration, config
  end
end
