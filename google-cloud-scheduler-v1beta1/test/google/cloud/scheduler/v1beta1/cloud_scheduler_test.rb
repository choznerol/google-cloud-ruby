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

require "google/cloud/scheduler/v1beta1/cloudscheduler_pb"
require "google/cloud/scheduler/v1beta1/cloudscheduler_services_pb"
require "google/cloud/scheduler/v1beta1/cloud_scheduler"

class Google::Cloud::Scheduler::V1beta1::CloudScheduler::ClientTest < Minitest::Test
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

  def test_list_jobs
    # Create GRPC objects.
    grpc_response = Google::Cloud::Scheduler::V1beta1::ListJobsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"

    list_jobs_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_jobs, name
      assert_kind_of Google::Cloud::Scheduler::V1beta1::ListJobsRequest, request
      assert_equal "hello world", request.parent
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_jobs_client_stub do
      # Create client
      client = Google::Cloud::Scheduler::V1beta1::CloudScheduler::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_jobs({ parent: parent, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_jobs parent: parent, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_jobs Google::Cloud::Scheduler::V1beta1::ListJobsRequest.new(parent: parent, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_jobs({ parent: parent, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_jobs Google::Cloud::Scheduler::V1beta1::ListJobsRequest.new(parent: parent, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_jobs_client_stub.call_rpc_count
    end
  end

  def test_get_job
    # Create GRPC objects.
    grpc_response = Google::Cloud::Scheduler::V1beta1::Job.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_job, name
      assert_kind_of Google::Cloud::Scheduler::V1beta1::GetJobRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_job_client_stub do
      # Create client
      client = Google::Cloud::Scheduler::V1beta1::CloudScheduler::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_job({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_job name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_job Google::Cloud::Scheduler::V1beta1::GetJobRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_job({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_job Google::Cloud::Scheduler::V1beta1::GetJobRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_job_client_stub.call_rpc_count
    end
  end

  def test_create_job
    # Create GRPC objects.
    grpc_response = Google::Cloud::Scheduler::V1beta1::Job.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    job = {}

    create_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_job, name
      assert_kind_of Google::Cloud::Scheduler::V1beta1::CreateJobRequest, request
      assert_equal "hello world", request.parent
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Scheduler::V1beta1::Job), request.job
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_job_client_stub do
      # Create client
      client = Google::Cloud::Scheduler::V1beta1::CloudScheduler::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_job({ parent: parent, job: job }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_job parent: parent, job: job do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_job Google::Cloud::Scheduler::V1beta1::CreateJobRequest.new(parent: parent, job: job) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_job({ parent: parent, job: job }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_job Google::Cloud::Scheduler::V1beta1::CreateJobRequest.new(parent: parent, job: job), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_job_client_stub.call_rpc_count
    end
  end

  def test_update_job
    # Create GRPC objects.
    grpc_response = Google::Cloud::Scheduler::V1beta1::Job.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    job = {}
    update_mask = {}

    update_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_job, name
      assert_kind_of Google::Cloud::Scheduler::V1beta1::UpdateJobRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Scheduler::V1beta1::Job), request.job
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_job_client_stub do
      # Create client
      client = Google::Cloud::Scheduler::V1beta1::CloudScheduler::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_job({ job: job, update_mask: update_mask }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_job job: job, update_mask: update_mask do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_job Google::Cloud::Scheduler::V1beta1::UpdateJobRequest.new(job: job, update_mask: update_mask) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_job({ job: job, update_mask: update_mask }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_job Google::Cloud::Scheduler::V1beta1::UpdateJobRequest.new(job: job, update_mask: update_mask), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_job_client_stub.call_rpc_count
    end
  end

  def test_delete_job
    # Create GRPC objects.
    grpc_response = Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_job, name
      assert_kind_of Google::Cloud::Scheduler::V1beta1::DeleteJobRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_job_client_stub do
      # Create client
      client = Google::Cloud::Scheduler::V1beta1::CloudScheduler::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_job({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_job name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_job Google::Cloud::Scheduler::V1beta1::DeleteJobRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_job({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_job Google::Cloud::Scheduler::V1beta1::DeleteJobRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_job_client_stub.call_rpc_count
    end
  end

  def test_pause_job
    # Create GRPC objects.
    grpc_response = Google::Cloud::Scheduler::V1beta1::Job.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    pause_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :pause_job, name
      assert_kind_of Google::Cloud::Scheduler::V1beta1::PauseJobRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, pause_job_client_stub do
      # Create client
      client = Google::Cloud::Scheduler::V1beta1::CloudScheduler::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.pause_job({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.pause_job name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.pause_job Google::Cloud::Scheduler::V1beta1::PauseJobRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.pause_job({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.pause_job Google::Cloud::Scheduler::V1beta1::PauseJobRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, pause_job_client_stub.call_rpc_count
    end
  end

  def test_resume_job
    # Create GRPC objects.
    grpc_response = Google::Cloud::Scheduler::V1beta1::Job.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    resume_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :resume_job, name
      assert_kind_of Google::Cloud::Scheduler::V1beta1::ResumeJobRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, resume_job_client_stub do
      # Create client
      client = Google::Cloud::Scheduler::V1beta1::CloudScheduler::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.resume_job({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.resume_job name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.resume_job Google::Cloud::Scheduler::V1beta1::ResumeJobRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.resume_job({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.resume_job Google::Cloud::Scheduler::V1beta1::ResumeJobRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, resume_job_client_stub.call_rpc_count
    end
  end

  def test_run_job
    # Create GRPC objects.
    grpc_response = Google::Cloud::Scheduler::V1beta1::Job.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    run_job_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :run_job, name
      assert_kind_of Google::Cloud::Scheduler::V1beta1::RunJobRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, run_job_client_stub do
      # Create client
      client = Google::Cloud::Scheduler::V1beta1::CloudScheduler::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.run_job({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.run_job name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.run_job Google::Cloud::Scheduler::V1beta1::RunJobRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.run_job({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.run_job Google::Cloud::Scheduler::V1beta1::RunJobRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, run_job_client_stub.call_rpc_count
    end
  end

  def test_configure
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = block_config = config = nil
    Gapic::ServiceStub.stub :new, nil do
      client = Google::Cloud::Scheduler::V1beta1::CloudScheduler::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of Google::Cloud::Scheduler::V1beta1::CloudScheduler::Client::Configuration, config
  end
end
