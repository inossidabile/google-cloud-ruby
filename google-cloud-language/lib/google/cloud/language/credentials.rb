# Copyright 2016 Google Inc. All rights reserved.
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


require "google/cloud/credentials"
require "google/cloud/language/v1beta1/language_service_api"

module Google
  module Cloud
    module Language
      ##
      # @private Represents the OAuth 2.0 signing logic for Language.
      class Credentials < Google::Cloud::Credentials
        SCOPE = Google::Cloud::Language::V1beta1::LanguageServiceApi::ALL_SCOPES
        PATH_ENV_VARS = %w(LANGUAGE_KEYFILE GCLOUD_KEYFILE GOOGLE_CLOUD_KEYFILE)
        JSON_ENV_VARS = %w(LANGUAGE_KEYFILE_JSON GCLOUD_KEYFILE_JSON
                           GOOGLE_CLOUD_KEYFILE_JSON)
      end
    end
  end
end
