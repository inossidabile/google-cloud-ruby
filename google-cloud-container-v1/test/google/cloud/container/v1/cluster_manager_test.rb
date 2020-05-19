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

require "helper"

require "gapic/grpc/service_stub"

require "google/container/v1/cluster_service_pb"
require "google/container/v1/cluster_service_services_pb"
require "google/cloud/container/v1/cluster_manager"

class ::Google::Cloud::Container::V1::ClusterManager::ClientTest < Minitest::Test
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

  def test_list_clusters
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::ListClustersResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    parent = "hello world"

    list_clusters_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_clusters, name
      assert_kind_of ::Google::Cloud::Container::V1::ListClustersRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.parent
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_clusters_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_clusters({ project_id: project_id, zone: zone, parent: parent }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_clusters project_id: project_id, zone: zone, parent: parent do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_clusters ::Google::Cloud::Container::V1::ListClustersRequest.new(project_id: project_id, zone: zone, parent: parent) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_clusters({ project_id: project_id, zone: zone, parent: parent }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_clusters ::Google::Cloud::Container::V1::ListClustersRequest.new(project_id: project_id, zone: zone, parent: parent), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_clusters_client_stub.call_rpc_count
    end
  end

  def test_get_cluster
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Cluster.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    name = "hello world"

    get_cluster_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_cluster, name
      assert_kind_of ::Google::Cloud::Container::V1::GetClusterRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_cluster_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_cluster({ project_id: project_id, zone: zone, cluster_id: cluster_id, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_cluster project_id: project_id, zone: zone, cluster_id: cluster_id, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_cluster ::Google::Cloud::Container::V1::GetClusterRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_cluster({ project_id: project_id, zone: zone, cluster_id: cluster_id, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_cluster ::Google::Cloud::Container::V1::GetClusterRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_cluster_client_stub.call_rpc_count
    end
  end

  def test_create_cluster
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster = {}
    parent = "hello world"

    create_cluster_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_cluster, name
      assert_kind_of ::Google::Cloud::Container::V1::CreateClusterRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Container::V1::Cluster), request.cluster
      assert_equal "hello world", request.parent
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_cluster_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_cluster({ project_id: project_id, zone: zone, cluster: cluster, parent: parent }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_cluster project_id: project_id, zone: zone, cluster: cluster, parent: parent do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_cluster ::Google::Cloud::Container::V1::CreateClusterRequest.new(project_id: project_id, zone: zone, cluster: cluster, parent: parent) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_cluster({ project_id: project_id, zone: zone, cluster: cluster, parent: parent }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_cluster ::Google::Cloud::Container::V1::CreateClusterRequest.new(project_id: project_id, zone: zone, cluster: cluster, parent: parent), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_cluster_client_stub.call_rpc_count
    end
  end

  def test_update_cluster
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    update = {}
    name = "hello world"

    update_cluster_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_cluster, name
      assert_kind_of ::Google::Cloud::Container::V1::UpdateClusterRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Container::V1::ClusterUpdate), request.update
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_cluster_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_cluster({ project_id: project_id, zone: zone, cluster_id: cluster_id, update: update, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_cluster project_id: project_id, zone: zone, cluster_id: cluster_id, update: update, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_cluster ::Google::Cloud::Container::V1::UpdateClusterRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, update: update, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_cluster({ project_id: project_id, zone: zone, cluster_id: cluster_id, update: update, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_cluster ::Google::Cloud::Container::V1::UpdateClusterRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, update: update, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_cluster_client_stub.call_rpc_count
    end
  end

  def test_update_node_pool
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    node_pool_id = "hello world"
    node_version = "hello world"
    image_type = "hello world"
    name = "hello world"

    update_node_pool_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_node_pool, name
      assert_kind_of ::Google::Cloud::Container::V1::UpdateNodePoolRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal "hello world", request.node_pool_id
      assert_equal "hello world", request.node_version
      assert_equal "hello world", request.image_type
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_node_pool_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_node_pool({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, node_version: node_version, image_type: image_type, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_node_pool project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, node_version: node_version, image_type: image_type, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_node_pool ::Google::Cloud::Container::V1::UpdateNodePoolRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, node_version: node_version, image_type: image_type, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_node_pool({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, node_version: node_version, image_type: image_type, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_node_pool ::Google::Cloud::Container::V1::UpdateNodePoolRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, node_version: node_version, image_type: image_type, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_node_pool_client_stub.call_rpc_count
    end
  end

  def test_set_node_pool_autoscaling
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    node_pool_id = "hello world"
    autoscaling = {}
    name = "hello world"

    set_node_pool_autoscaling_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :set_node_pool_autoscaling, name
      assert_kind_of ::Google::Cloud::Container::V1::SetNodePoolAutoscalingRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal "hello world", request.node_pool_id
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Container::V1::NodePoolAutoscaling), request.autoscaling
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, set_node_pool_autoscaling_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.set_node_pool_autoscaling({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, autoscaling: autoscaling, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.set_node_pool_autoscaling project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, autoscaling: autoscaling, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.set_node_pool_autoscaling ::Google::Cloud::Container::V1::SetNodePoolAutoscalingRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, autoscaling: autoscaling, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.set_node_pool_autoscaling({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, autoscaling: autoscaling, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.set_node_pool_autoscaling ::Google::Cloud::Container::V1::SetNodePoolAutoscalingRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, autoscaling: autoscaling, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, set_node_pool_autoscaling_client_stub.call_rpc_count
    end
  end

  def test_set_logging_service
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    logging_service = "hello world"
    name = "hello world"

    set_logging_service_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :set_logging_service, name
      assert_kind_of ::Google::Cloud::Container::V1::SetLoggingServiceRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal "hello world", request.logging_service
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, set_logging_service_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.set_logging_service({ project_id: project_id, zone: zone, cluster_id: cluster_id, logging_service: logging_service, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.set_logging_service project_id: project_id, zone: zone, cluster_id: cluster_id, logging_service: logging_service, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.set_logging_service ::Google::Cloud::Container::V1::SetLoggingServiceRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, logging_service: logging_service, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.set_logging_service({ project_id: project_id, zone: zone, cluster_id: cluster_id, logging_service: logging_service, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.set_logging_service ::Google::Cloud::Container::V1::SetLoggingServiceRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, logging_service: logging_service, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, set_logging_service_client_stub.call_rpc_count
    end
  end

  def test_set_monitoring_service
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    monitoring_service = "hello world"
    name = "hello world"

    set_monitoring_service_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :set_monitoring_service, name
      assert_kind_of ::Google::Cloud::Container::V1::SetMonitoringServiceRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal "hello world", request.monitoring_service
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, set_monitoring_service_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.set_monitoring_service({ project_id: project_id, zone: zone, cluster_id: cluster_id, monitoring_service: monitoring_service, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.set_monitoring_service project_id: project_id, zone: zone, cluster_id: cluster_id, monitoring_service: monitoring_service, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.set_monitoring_service ::Google::Cloud::Container::V1::SetMonitoringServiceRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, monitoring_service: monitoring_service, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.set_monitoring_service({ project_id: project_id, zone: zone, cluster_id: cluster_id, monitoring_service: monitoring_service, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.set_monitoring_service ::Google::Cloud::Container::V1::SetMonitoringServiceRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, monitoring_service: monitoring_service, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, set_monitoring_service_client_stub.call_rpc_count
    end
  end

  def test_set_addons_config
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    addons_config = {}
    name = "hello world"

    set_addons_config_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :set_addons_config, name
      assert_kind_of ::Google::Cloud::Container::V1::SetAddonsConfigRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Container::V1::AddonsConfig), request.addons_config
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, set_addons_config_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.set_addons_config({ project_id: project_id, zone: zone, cluster_id: cluster_id, addons_config: addons_config, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.set_addons_config project_id: project_id, zone: zone, cluster_id: cluster_id, addons_config: addons_config, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.set_addons_config ::Google::Cloud::Container::V1::SetAddonsConfigRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, addons_config: addons_config, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.set_addons_config({ project_id: project_id, zone: zone, cluster_id: cluster_id, addons_config: addons_config, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.set_addons_config ::Google::Cloud::Container::V1::SetAddonsConfigRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, addons_config: addons_config, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, set_addons_config_client_stub.call_rpc_count
    end
  end

  def test_set_locations
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    locations = ["hello world"]
    name = "hello world"

    set_locations_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :set_locations, name
      assert_kind_of ::Google::Cloud::Container::V1::SetLocationsRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal ["hello world"], request.locations
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, set_locations_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.set_locations({ project_id: project_id, zone: zone, cluster_id: cluster_id, locations: locations, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.set_locations project_id: project_id, zone: zone, cluster_id: cluster_id, locations: locations, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.set_locations ::Google::Cloud::Container::V1::SetLocationsRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, locations: locations, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.set_locations({ project_id: project_id, zone: zone, cluster_id: cluster_id, locations: locations, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.set_locations ::Google::Cloud::Container::V1::SetLocationsRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, locations: locations, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, set_locations_client_stub.call_rpc_count
    end
  end

  def test_update_master
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    master_version = "hello world"
    name = "hello world"

    update_master_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :update_master, name
      assert_kind_of ::Google::Cloud::Container::V1::UpdateMasterRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal "hello world", request.master_version
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, update_master_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.update_master({ project_id: project_id, zone: zone, cluster_id: cluster_id, master_version: master_version, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.update_master project_id: project_id, zone: zone, cluster_id: cluster_id, master_version: master_version, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.update_master ::Google::Cloud::Container::V1::UpdateMasterRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, master_version: master_version, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.update_master({ project_id: project_id, zone: zone, cluster_id: cluster_id, master_version: master_version, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.update_master ::Google::Cloud::Container::V1::UpdateMasterRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, master_version: master_version, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, update_master_client_stub.call_rpc_count
    end
  end

  def test_set_master_auth
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    action = :UNKNOWN
    update = {}
    name = "hello world"

    set_master_auth_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :set_master_auth, name
      assert_kind_of ::Google::Cloud::Container::V1::SetMasterAuthRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal :UNKNOWN, request.action
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Container::V1::MasterAuth), request.update
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, set_master_auth_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.set_master_auth({ project_id: project_id, zone: zone, cluster_id: cluster_id, action: action, update: update, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.set_master_auth project_id: project_id, zone: zone, cluster_id: cluster_id, action: action, update: update, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.set_master_auth ::Google::Cloud::Container::V1::SetMasterAuthRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, action: action, update: update, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.set_master_auth({ project_id: project_id, zone: zone, cluster_id: cluster_id, action: action, update: update, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.set_master_auth ::Google::Cloud::Container::V1::SetMasterAuthRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, action: action, update: update, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, set_master_auth_client_stub.call_rpc_count
    end
  end

  def test_delete_cluster
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    name = "hello world"

    delete_cluster_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_cluster, name
      assert_kind_of ::Google::Cloud::Container::V1::DeleteClusterRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_cluster_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_cluster({ project_id: project_id, zone: zone, cluster_id: cluster_id, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_cluster project_id: project_id, zone: zone, cluster_id: cluster_id, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_cluster ::Google::Cloud::Container::V1::DeleteClusterRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_cluster({ project_id: project_id, zone: zone, cluster_id: cluster_id, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_cluster ::Google::Cloud::Container::V1::DeleteClusterRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_cluster_client_stub.call_rpc_count
    end
  end

  def test_list_operations
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::ListOperationsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    parent = "hello world"

    list_operations_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_operations, name
      assert_kind_of ::Google::Cloud::Container::V1::ListOperationsRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.parent
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_operations_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_operations({ project_id: project_id, zone: zone, parent: parent }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_operations project_id: project_id, zone: zone, parent: parent do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_operations ::Google::Cloud::Container::V1::ListOperationsRequest.new(project_id: project_id, zone: zone, parent: parent) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_operations({ project_id: project_id, zone: zone, parent: parent }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_operations ::Google::Cloud::Container::V1::ListOperationsRequest.new(project_id: project_id, zone: zone, parent: parent), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_operations_client_stub.call_rpc_count
    end
  end

  def test_get_operation
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    operation_id = "hello world"
    name = "hello world"

    get_operation_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_operation, name
      assert_kind_of ::Google::Cloud::Container::V1::GetOperationRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.operation_id
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_operation_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_operation({ project_id: project_id, zone: zone, operation_id: operation_id, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_operation project_id: project_id, zone: zone, operation_id: operation_id, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_operation ::Google::Cloud::Container::V1::GetOperationRequest.new(project_id: project_id, zone: zone, operation_id: operation_id, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_operation({ project_id: project_id, zone: zone, operation_id: operation_id, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_operation ::Google::Cloud::Container::V1::GetOperationRequest.new(project_id: project_id, zone: zone, operation_id: operation_id, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_operation_client_stub.call_rpc_count
    end
  end

  def test_cancel_operation
    # Create GRPC objects.
    grpc_response = ::Google::Protobuf::Empty.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    operation_id = "hello world"
    name = "hello world"

    cancel_operation_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :cancel_operation, name
      assert_kind_of ::Google::Cloud::Container::V1::CancelOperationRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.operation_id
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, cancel_operation_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.cancel_operation({ project_id: project_id, zone: zone, operation_id: operation_id, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.cancel_operation project_id: project_id, zone: zone, operation_id: operation_id, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.cancel_operation ::Google::Cloud::Container::V1::CancelOperationRequest.new(project_id: project_id, zone: zone, operation_id: operation_id, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.cancel_operation({ project_id: project_id, zone: zone, operation_id: operation_id, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.cancel_operation ::Google::Cloud::Container::V1::CancelOperationRequest.new(project_id: project_id, zone: zone, operation_id: operation_id, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, cancel_operation_client_stub.call_rpc_count
    end
  end

  def test_get_server_config
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::ServerConfig.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    name = "hello world"

    get_server_config_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_server_config, name
      assert_kind_of ::Google::Cloud::Container::V1::GetServerConfigRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_server_config_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_server_config({ project_id: project_id, zone: zone, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_server_config project_id: project_id, zone: zone, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_server_config ::Google::Cloud::Container::V1::GetServerConfigRequest.new(project_id: project_id, zone: zone, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_server_config({ project_id: project_id, zone: zone, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_server_config ::Google::Cloud::Container::V1::GetServerConfigRequest.new(project_id: project_id, zone: zone, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_server_config_client_stub.call_rpc_count
    end
  end

  def test_list_node_pools
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::ListNodePoolsResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    parent = "hello world"

    list_node_pools_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_node_pools, name
      assert_kind_of ::Google::Cloud::Container::V1::ListNodePoolsRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal "hello world", request.parent
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_node_pools_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_node_pools({ project_id: project_id, zone: zone, cluster_id: cluster_id, parent: parent }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_node_pools project_id: project_id, zone: zone, cluster_id: cluster_id, parent: parent do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_node_pools ::Google::Cloud::Container::V1::ListNodePoolsRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, parent: parent) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_node_pools({ project_id: project_id, zone: zone, cluster_id: cluster_id, parent: parent }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_node_pools ::Google::Cloud::Container::V1::ListNodePoolsRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, parent: parent), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_node_pools_client_stub.call_rpc_count
    end
  end

  def test_get_node_pool
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::NodePool.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    node_pool_id = "hello world"
    name = "hello world"

    get_node_pool_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :get_node_pool, name
      assert_kind_of ::Google::Cloud::Container::V1::GetNodePoolRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal "hello world", request.node_pool_id
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, get_node_pool_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.get_node_pool({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.get_node_pool project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.get_node_pool ::Google::Cloud::Container::V1::GetNodePoolRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.get_node_pool({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.get_node_pool ::Google::Cloud::Container::V1::GetNodePoolRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, get_node_pool_client_stub.call_rpc_count
    end
  end

  def test_create_node_pool
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    node_pool = {}
    parent = "hello world"

    create_node_pool_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :create_node_pool, name
      assert_kind_of ::Google::Cloud::Container::V1::CreateNodePoolRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Container::V1::NodePool), request.node_pool
      assert_equal "hello world", request.parent
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, create_node_pool_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.create_node_pool({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool: node_pool, parent: parent }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.create_node_pool project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool: node_pool, parent: parent do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.create_node_pool ::Google::Cloud::Container::V1::CreateNodePoolRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool: node_pool, parent: parent) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.create_node_pool({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool: node_pool, parent: parent }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.create_node_pool ::Google::Cloud::Container::V1::CreateNodePoolRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool: node_pool, parent: parent), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, create_node_pool_client_stub.call_rpc_count
    end
  end

  def test_delete_node_pool
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    node_pool_id = "hello world"
    name = "hello world"

    delete_node_pool_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :delete_node_pool, name
      assert_kind_of ::Google::Cloud::Container::V1::DeleteNodePoolRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal "hello world", request.node_pool_id
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, delete_node_pool_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.delete_node_pool({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.delete_node_pool project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.delete_node_pool ::Google::Cloud::Container::V1::DeleteNodePoolRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.delete_node_pool({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.delete_node_pool ::Google::Cloud::Container::V1::DeleteNodePoolRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, delete_node_pool_client_stub.call_rpc_count
    end
  end

  def test_rollback_node_pool_upgrade
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    node_pool_id = "hello world"
    name = "hello world"

    rollback_node_pool_upgrade_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :rollback_node_pool_upgrade, name
      assert_kind_of ::Google::Cloud::Container::V1::RollbackNodePoolUpgradeRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal "hello world", request.node_pool_id
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, rollback_node_pool_upgrade_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.rollback_node_pool_upgrade({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.rollback_node_pool_upgrade project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.rollback_node_pool_upgrade ::Google::Cloud::Container::V1::RollbackNodePoolUpgradeRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.rollback_node_pool_upgrade({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.rollback_node_pool_upgrade ::Google::Cloud::Container::V1::RollbackNodePoolUpgradeRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, rollback_node_pool_upgrade_client_stub.call_rpc_count
    end
  end

  def test_set_node_pool_management
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    node_pool_id = "hello world"
    management = {}
    name = "hello world"

    set_node_pool_management_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :set_node_pool_management, name
      assert_kind_of ::Google::Cloud::Container::V1::SetNodePoolManagementRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal "hello world", request.node_pool_id
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Container::V1::NodeManagement), request.management
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, set_node_pool_management_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.set_node_pool_management({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, management: management, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.set_node_pool_management project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, management: management, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.set_node_pool_management ::Google::Cloud::Container::V1::SetNodePoolManagementRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, management: management, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.set_node_pool_management({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, management: management, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.set_node_pool_management ::Google::Cloud::Container::V1::SetNodePoolManagementRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, management: management, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, set_node_pool_management_client_stub.call_rpc_count
    end
  end

  def test_set_labels
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    resource_labels = {}
    label_fingerprint = "hello world"
    name = "hello world"

    set_labels_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :set_labels, name
      assert_kind_of ::Google::Cloud::Container::V1::SetLabelsRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal({}, request.resource_labels.to_h)
      assert_equal "hello world", request.label_fingerprint
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, set_labels_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.set_labels({ project_id: project_id, zone: zone, cluster_id: cluster_id, resource_labels: resource_labels, label_fingerprint: label_fingerprint, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.set_labels project_id: project_id, zone: zone, cluster_id: cluster_id, resource_labels: resource_labels, label_fingerprint: label_fingerprint, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.set_labels ::Google::Cloud::Container::V1::SetLabelsRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, resource_labels: resource_labels, label_fingerprint: label_fingerprint, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.set_labels({ project_id: project_id, zone: zone, cluster_id: cluster_id, resource_labels: resource_labels, label_fingerprint: label_fingerprint, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.set_labels ::Google::Cloud::Container::V1::SetLabelsRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, resource_labels: resource_labels, label_fingerprint: label_fingerprint, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, set_labels_client_stub.call_rpc_count
    end
  end

  def test_set_legacy_abac
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    enabled = true
    name = "hello world"

    set_legacy_abac_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :set_legacy_abac, name
      assert_kind_of ::Google::Cloud::Container::V1::SetLegacyAbacRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal true, request.enabled
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, set_legacy_abac_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.set_legacy_abac({ project_id: project_id, zone: zone, cluster_id: cluster_id, enabled: enabled, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.set_legacy_abac project_id: project_id, zone: zone, cluster_id: cluster_id, enabled: enabled, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.set_legacy_abac ::Google::Cloud::Container::V1::SetLegacyAbacRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, enabled: enabled, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.set_legacy_abac({ project_id: project_id, zone: zone, cluster_id: cluster_id, enabled: enabled, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.set_legacy_abac ::Google::Cloud::Container::V1::SetLegacyAbacRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, enabled: enabled, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, set_legacy_abac_client_stub.call_rpc_count
    end
  end

  def test_start_ip_rotation
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    name = "hello world"
    rotate_credentials = true

    start_ip_rotation_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :start_ip_rotation, name
      assert_kind_of ::Google::Cloud::Container::V1::StartIPRotationRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal "hello world", request.name
      assert_equal true, request.rotate_credentials
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, start_ip_rotation_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.start_ip_rotation({ project_id: project_id, zone: zone, cluster_id: cluster_id, name: name, rotate_credentials: rotate_credentials }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.start_ip_rotation project_id: project_id, zone: zone, cluster_id: cluster_id, name: name, rotate_credentials: rotate_credentials do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.start_ip_rotation ::Google::Cloud::Container::V1::StartIPRotationRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, name: name, rotate_credentials: rotate_credentials) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.start_ip_rotation({ project_id: project_id, zone: zone, cluster_id: cluster_id, name: name, rotate_credentials: rotate_credentials }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.start_ip_rotation ::Google::Cloud::Container::V1::StartIPRotationRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, name: name, rotate_credentials: rotate_credentials), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, start_ip_rotation_client_stub.call_rpc_count
    end
  end

  def test_complete_ip_rotation
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    name = "hello world"

    complete_ip_rotation_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :complete_ip_rotation, name
      assert_kind_of ::Google::Cloud::Container::V1::CompleteIPRotationRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, complete_ip_rotation_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.complete_ip_rotation({ project_id: project_id, zone: zone, cluster_id: cluster_id, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.complete_ip_rotation project_id: project_id, zone: zone, cluster_id: cluster_id, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.complete_ip_rotation ::Google::Cloud::Container::V1::CompleteIPRotationRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.complete_ip_rotation({ project_id: project_id, zone: zone, cluster_id: cluster_id, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.complete_ip_rotation ::Google::Cloud::Container::V1::CompleteIPRotationRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, complete_ip_rotation_client_stub.call_rpc_count
    end
  end

  def test_set_node_pool_size
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    node_pool_id = "hello world"
    node_count = 42
    name = "hello world"

    set_node_pool_size_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :set_node_pool_size, name
      assert_kind_of ::Google::Cloud::Container::V1::SetNodePoolSizeRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal "hello world", request.node_pool_id
      assert_equal 42, request.node_count
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, set_node_pool_size_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.set_node_pool_size({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, node_count: node_count, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.set_node_pool_size project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, node_count: node_count, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.set_node_pool_size ::Google::Cloud::Container::V1::SetNodePoolSizeRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, node_count: node_count, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.set_node_pool_size({ project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, node_count: node_count, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.set_node_pool_size ::Google::Cloud::Container::V1::SetNodePoolSizeRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, node_pool_id: node_pool_id, node_count: node_count, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, set_node_pool_size_client_stub.call_rpc_count
    end
  end

  def test_set_network_policy
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    network_policy = {}
    name = "hello world"

    set_network_policy_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :set_network_policy, name
      assert_kind_of ::Google::Cloud::Container::V1::SetNetworkPolicyRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Container::V1::NetworkPolicy), request.network_policy
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, set_network_policy_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.set_network_policy({ project_id: project_id, zone: zone, cluster_id: cluster_id, network_policy: network_policy, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.set_network_policy project_id: project_id, zone: zone, cluster_id: cluster_id, network_policy: network_policy, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.set_network_policy ::Google::Cloud::Container::V1::SetNetworkPolicyRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, network_policy: network_policy, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.set_network_policy({ project_id: project_id, zone: zone, cluster_id: cluster_id, network_policy: network_policy, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.set_network_policy ::Google::Cloud::Container::V1::SetNetworkPolicyRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, network_policy: network_policy, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, set_network_policy_client_stub.call_rpc_count
    end
  end

  def test_set_maintenance_policy
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::Operation.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    project_id = "hello world"
    zone = "hello world"
    cluster_id = "hello world"
    maintenance_policy = {}
    name = "hello world"

    set_maintenance_policy_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :set_maintenance_policy, name
      assert_kind_of ::Google::Cloud::Container::V1::SetMaintenancePolicyRequest, request
      assert_equal "hello world", request.project_id
      assert_equal "hello world", request.zone
      assert_equal "hello world", request.cluster_id
      assert_equal Gapic::Protobuf.coerce({}, to: ::Google::Cloud::Container::V1::MaintenancePolicy), request.maintenance_policy
      assert_equal "hello world", request.name
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, set_maintenance_policy_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.set_maintenance_policy({ project_id: project_id, zone: zone, cluster_id: cluster_id, maintenance_policy: maintenance_policy, name: name }) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.set_maintenance_policy project_id: project_id, zone: zone, cluster_id: cluster_id, maintenance_policy: maintenance_policy, name: name do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.set_maintenance_policy ::Google::Cloud::Container::V1::SetMaintenancePolicyRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, maintenance_policy: maintenance_policy, name: name) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.set_maintenance_policy({ project_id: project_id, zone: zone, cluster_id: cluster_id, maintenance_policy: maintenance_policy, name: name }, grpc_options) do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.set_maintenance_policy ::Google::Cloud::Container::V1::SetMaintenancePolicyRequest.new(project_id: project_id, zone: zone, cluster_id: cluster_id, maintenance_policy: maintenance_policy, name: name), grpc_options do |response, operation|
        assert_equal grpc_response, response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, set_maintenance_policy_client_stub.call_rpc_count
    end
  end

  def test_list_usable_subnetworks
    # Create GRPC objects.
    grpc_response = ::Google::Cloud::Container::V1::ListUsableSubnetworksResponse.new
    grpc_operation = GRPC::ActiveCall::Operation.new nil
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    grpc_options = {}

    # Create request parameters for a unary method.
    parent = "hello world"
    filter = "hello world"
    page_size = 42
    page_token = "hello world"

    list_usable_subnetworks_client_stub = ClientStub.new grpc_response, grpc_operation do |name, request, options:|
      assert_equal :list_usable_subnetworks, name
      assert_kind_of ::Google::Cloud::Container::V1::ListUsableSubnetworksRequest, request
      assert_equal "hello world", request.parent
      assert_equal "hello world", request.filter
      assert_equal 42, request.page_size
      assert_equal "hello world", request.page_token
      refute_nil options
    end

    Gapic::ServiceStub.stub :new, list_usable_subnetworks_client_stub do
      # Create client
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end

      # Use hash object
      client.list_usable_subnetworks({ parent: parent, filter: filter, page_size: page_size, page_token: page_token }) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use named arguments
      client.list_usable_subnetworks parent: parent, filter: filter, page_size: page_size, page_token: page_token do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object
      client.list_usable_subnetworks ::Google::Cloud::Container::V1::ListUsableSubnetworksRequest.new(parent: parent, filter: filter, page_size: page_size, page_token: page_token) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use hash object with options
      client.list_usable_subnetworks({ parent: parent, filter: filter, page_size: page_size, page_token: page_token }, grpc_options) do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Use protobuf object with options
      client.list_usable_subnetworks ::Google::Cloud::Container::V1::ListUsableSubnetworksRequest.new(parent: parent, filter: filter, page_size: page_size, page_token: page_token), grpc_options do |response, operation|
        assert_kind_of Gapic::PagedEnumerable, response
        assert_equal grpc_response, response.response
        assert_equal grpc_operation, operation
      end

      # Verify method calls
      assert_equal 5, list_usable_subnetworks_client_stub.call_rpc_count
    end
  end

  def test_configure
    grpc_channel = GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure

    client = block_config = config = nil
    Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Container::V1::ClusterManager::Client.new do |config|
        config.credentials = grpc_channel
      end
    end

    config = client.configure do |c|
      block_config = c
    end

    assert_same block_config, config
    assert_kind_of ::Google::Cloud::Container::V1::ClusterManager::Client::Configuration, config
  end
end
