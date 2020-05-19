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

require "google/cloud/monitoring/v3/metric_service"

class ::Google::Cloud::Monitoring::V3::MetricService::ClientPathsTest < Minitest::Test
  def test_folder_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Monitoring::V3::MetricService::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.folder_path folder: "value0"
      assert_equal "folders/value0", path
    end
  end

  def test_metric_descriptor_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Monitoring::V3::MetricService::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.metric_descriptor_path project: "value0", metric_descriptor: "value1"
      assert_equal "projects/value0/metricDescriptors/value1", path

      path = client.metric_descriptor_path organization: "value0", metric_descriptor: "value1"
      assert_equal "organizations/value0/metricDescriptors/value1", path

      path = client.metric_descriptor_path folder: "value0", metric_descriptor: "value1"
      assert_equal "folders/value0/metricDescriptors/value1", path
    end
  end

  def test_monitored_resource_descriptor_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Monitoring::V3::MetricService::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.monitored_resource_descriptor_path project: "value0", monitored_resource_descriptor: "value1"
      assert_equal "projects/value0/monitoredResourceDescriptors/value1", path

      path = client.monitored_resource_descriptor_path organization: "value0", monitored_resource_descriptor: "value1"
      assert_equal "organizations/value0/monitoredResourceDescriptors/value1", path

      path = client.monitored_resource_descriptor_path folder: "value0", monitored_resource_descriptor: "value1"
      assert_equal "folders/value0/monitoredResourceDescriptors/value1", path
    end
  end

  def test_organization_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Monitoring::V3::MetricService::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.organization_path organization: "value0"
      assert_equal "organizations/value0", path
    end
  end

  def test_project_path
    grpc_channel = ::GRPC::Core::Channel.new "localhost:8888", nil, :this_channel_is_insecure
    ::Gapic::ServiceStub.stub :new, nil do
      client = ::Google::Cloud::Monitoring::V3::MetricService::Client.new do |config|
        config.credentials = grpc_channel
      end

      path = client.project_path project: "value0"
      assert_equal "projects/value0", path
    end
  end
end
