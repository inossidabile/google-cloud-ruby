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

require "google/cloud/memcache/v1beta2/cloud_memcache_pb"
require "google/cloud/memcache/v1beta2/cloud_memcache_services_pb"
require "google/cloud/memcache/v1beta2/cloud_memcache"

class Google::Cloud::Memcache::V1beta2::CloudMemcache::ClientTest < Minitest::Test
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

  def test_list_instances
    # Create GRPC objects.
    grpc_response = Google::Cloud::Memcache::V1beta2::ListInstancesResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    page_size = 42
    page_token = "hello world"
    filter = "hello world"
    order_by = "hello world"

    list_instances_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_instances, name
      assert_kind_of Google::Cloud::Memcache::V1beta2::ListInstancesRequest, request
      assert_equal "hello world", request.parent
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      assert_equal "hello world", request.filter
      assert_equal "hello world", request.order_by
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_instances_client_stub do
      # Create client
      client = Google::Cloud::Memcache::V1beta2::CloudMemcache::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_instances({ parent: parent, page_size: page_size, page_token: page_token, filter: filter, order_by: order_by }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_instances parent: parent, page_size: page_size, page_token: page_token, filter: filter, order_by: order_by do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_instances Google::Cloud::Memcache::V1beta2::ListInstancesRequest.new(parent: parent, page_size: page_size, page_token: page_token, filter: filter, order_by: order_by) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_instances({ parent: parent, page_size: page_size, page_token: page_token, filter: filter, order_by: order_by }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_instances Google::Cloud::Memcache::V1beta2::ListInstancesRequest.new(parent: parent, page_size: page_size, page_token: page_token, filter: filter, order_by: order_by), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_instances_client_stub.call_rpc_count
    end
  end

  def test_get_instance
    # Create GRPC objects.
    grpc_response = Google::Cloud::Memcache::V1beta2::Instance.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    get_instance_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_instance, name
      assert_kind_of Google::Cloud::Memcache::V1beta2::GetInstanceRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_instance_client_stub do
      # Create client
      client = Google::Cloud::Memcache::V1beta2::CloudMemcache::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_instance({ name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_instance name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_instance Google::Cloud::Memcache::V1beta2::GetInstanceRequest.new(name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_instance({ name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_instance Google::Cloud::Memcache::V1beta2::GetInstanceRequest.new(name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_instance_client_stub.call_rpc_count
    end
  end

  def test_create_instance
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    instance_id = "hello world"
    resource = {}

    create_instance_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_instance, name
      assert_kind_of Google::Cloud::Memcache::V1beta2::CreateInstanceRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.instance_id
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Memcache::V1beta2::Instance), request.resource
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_instance_client_stub do
      # Create client
      client = Google::Cloud::Memcache::V1beta2::CloudMemcache::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_instance({ parent: parent, instance_id: instance_id, resource: resource }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_instance parent: parent, instance_id: instance_id, resource: resource do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_instance Google::Cloud::Memcache::V1beta2::CreateInstanceRequest.new(parent: parent, instance_id: instance_id, resource: resource) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_instance({ parent: parent, instance_id: instance_id, resource: resource }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_instance Google::Cloud::Memcache::V1beta2::CreateInstanceRequest.new(parent: parent, instance_id: instance_id, resource: resource), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_instance_client_stub.call_rpc_count
    end
  end

  def test_update_instance
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    update_mask = {}
    resource = {}

    update_instance_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_instance, name
      assert_kind_of Google::Cloud::Memcache::V1beta2::UpdateInstanceRequest, request
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Memcache::V1beta2::Instance), request.resource
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_instance_client_stub do
      # Create client
      client = Google::Cloud::Memcache::V1beta2::CloudMemcache::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_instance({ update_mask: update_mask, resource: resource }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_instance update_mask: update_mask, resource: resource do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_instance Google::Cloud::Memcache::V1beta2::UpdateInstanceRequest.new(update_mask: update_mask, resource: resource) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_instance({ update_mask: update_mask, resource: resource }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_instance Google::Cloud::Memcache::V1beta2::UpdateInstanceRequest.new(update_mask: update_mask, resource: resource), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_instance_client_stub.call_rpc_count
    end
  end

  def test_update_parameters
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    update_mask = {}
    parameters = {}

    update_parameters_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_parameters, name
      assert_kind_of Google::Cloud::Memcache::V1beta2::UpdateParametersRequest, request
      assert_equal "hello world", request.name
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Protobuf::FieldMask), request.update_mask
      assert_equal Gapic::Protobuf.coerce({}, to: Google::Cloud::Memcache::V1beta2::MemcacheParameters), request.parameters
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_parameters_client_stub do
      # Create client
      client = Google::Cloud::Memcache::V1beta2::CloudMemcache::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_parameters({ name: name, update_mask: update_mask, parameters: parameters }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_parameters name: name, update_mask: update_mask, parameters: parameters do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_parameters Google::Cloud::Memcache::V1beta2::UpdateParametersRequest.new(name: name, update_mask: update_mask, parameters: parameters) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_parameters({ name: name, update_mask: update_mask, parameters: parameters }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_parameters Google::Cloud::Memcache::V1beta2::UpdateParametersRequest.new(name: name, update_mask: update_mask, parameters: parameters), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_parameters_client_stub.call_rpc_count
    end
  end

  def test_delete_instance
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"

    delete_instance_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_instance, name
      assert_kind_of Google::Cloud::Memcache::V1beta2::DeleteInstanceRequest, request
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_instance_client_stub do
      # Create client
      client = Google::Cloud::Memcache::V1beta2::CloudMemcache::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_instance({ name: name }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_instance name: name do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_instance Google::Cloud::Memcache::V1beta2::DeleteInstanceRequest.new(name: name) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_instance({ name: name }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_instance Google::Cloud::Memcache::V1beta2::DeleteInstanceRequest.new(name: name), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_instance_client_stub.call_rpc_count
    end
  end

  def test_apply_parameters
    # Create GRPC objects.
    grpc_response = Google::Longrunning::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    name = "hello world"
    node_ids = ["hello world"]
    apply_all = true

    apply_parameters_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :apply_parameters, name
      assert_kind_of Google::Cloud::Memcache::V1beta2::ApplyParametersRequest, request
      assert_equal "hello world", request.name
      assert_equal ["hello world"], request.node_ids
      assert_equal true, request.apply_all
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, apply_parameters_client_stub do
      # Create client
      client = Google::Cloud::Memcache::V1beta2::CloudMemcache::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.apply_parameters({ name: name, node_ids: node_ids, apply_all: apply_all }) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.apply_parameters name: name, node_ids: node_ids, apply_all: apply_all do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.apply_parameters Google::Cloud::Memcache::V1beta2::ApplyParametersRequest.new(name: name, node_ids: node_ids, apply_all: apply_all) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.apply_parameters({ name: name, node_ids: node_ids, apply_all: apply_all }, grpc_options) do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.apply_parameters Google::Cloud::Memcache::V1beta2::ApplyParametersRequest.new(name: name, node_ids: node_ids, apply_all: apply_all), grpc_options do |response, operation|
        assert_kind_of Gapic::Operation, response
        assert_equal grpc_response, response.grpc_op
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, apply_parameters_client_stub.call_rpc_count
    end
  end

  def test_configure
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = block_config = config = nil
    Gapic::ServiceStub.stub :new, nil do
      client = Google::Cloud::Memcache::V1beta2::CloudMemcache::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of Google::Cloud::Memcache::V1beta2::CloudMemcache::Client::Configuration, config
  end

  def test_operations_client
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = nil
    Gapic::ServiceStub.stub :new, nil do
      client = Google::Cloud::Memcache::V1beta2::CloudMemcache::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    assert_kind_of Google::Cloud::Memcache::V1beta2::CloudMemcache::Operations, client.operations_client
  end
end
