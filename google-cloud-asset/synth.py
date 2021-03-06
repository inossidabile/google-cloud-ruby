# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""This script is used to synthesize generated parts of this library."""

import synthtool as s
import synthtool.gcp as gcp
import synthtool.languages.ruby as ruby
import logging

AUTOSYNTH_MULTIPLE_COMMITS = True

logging.basicConfig(level=logging.DEBUG)

gapic = gcp.GAPICMicrogenerator()
library = gapic.ruby_library(
    "asset", "v1",
    extra_proto_files=[
        "google/cloud/common_resources.proto",
        "google/cloud/orgpolicy/v1/orgpolicy.proto",
        "google/identity/accesscontextmanager/type/device_resources.proto",
        "google/identity/accesscontextmanager/v1/access_level.proto",
        "google/identity/accesscontextmanager/v1/access_policy.proto",
        "google/identity/accesscontextmanager/v1/service_perimeter.proto",
    ],
    generator_args={
        "ruby-cloud-gem-name": "google-cloud-asset",
        "ruby-cloud-title": "Cloud Asset",
        "ruby-cloud-description": "A metadata inventory service that allows you to view, monitor, and analyze all your GCP and Anthos assets across projects and services.",
        "ruby-cloud-env-prefix": "ASSET",
        "ruby-cloud-wrapper-of": "v1:0.0;v1beta1:0.0",
        "ruby-cloud-product-url": "https://cloud.google.com/resource-manager",
        "ruby-cloud-api-id": "cloudasset",
        "ruby-cloud-migration-version": "1.0",
    }
)

s.copy(library, merge=ruby.global_merge)
