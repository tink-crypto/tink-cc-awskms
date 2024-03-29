#!/bin/bash
# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
################################################################################

set -euo pipefail

IS_KOKORO="false"
if [[ -n "${KOKORO_ARTIFACTS_DIR:-}" ]]; then
  IS_KOKORO="true"
fi
readonly IS_KOKORO

if [[ "${IS_KOKORO}" == "true" ]]; then
  readonly TINK_BASE_DIR="$(echo "${KOKORO_ARTIFACTS_DIR}"/git*)"
  cd "${TINK_BASE_DIR}/tink_cc_awskms"
fi

./kokoro/testutils/copy_credentials.sh "testdata" "aws"

MANUAL_TARGETS=()
if [[ "${IS_KOKORO}" == "true" ]]; then
  MANUAL_TARGETS+=("//tink/integration/awskms:aws_kms_aead_integration_test")
fi
readonly MANUAL_TARGETS

./kokoro/testutils/run_bazel_tests.sh . "${MANUAL_TARGETS[@]}"
