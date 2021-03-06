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

# Auto-generated by gapic-generator-ruby. DO NOT EDIT!


module Google
  module Cloud
    module Iot
      module V1
        # Request for `CreateDeviceRegistry`.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The project and cloud region where this device registry must be created.
        #     For example, `projects/example-project/locations/us-central1`.
        # @!attribute [rw] device_registry
        #   @return [Google::Cloud::Iot::V1::DeviceRegistry]
        #     Required. The device registry. The field `name` must be empty. The server will
        #     generate that field from the device registry `id` provided and the
        #     `parent` field.
        class CreateDeviceRegistryRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for `GetDeviceRegistry`.
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The name of the device registry. For example,
        #     `projects/example-project/locations/us-central1/registries/my-registry`.
        class GetDeviceRegistryRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for `DeleteDeviceRegistry`.
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The name of the device registry. For example,
        #     `projects/example-project/locations/us-central1/registries/my-registry`.
        class DeleteDeviceRegistryRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for `UpdateDeviceRegistry`.
        # @!attribute [rw] device_registry
        #   @return [Google::Cloud::Iot::V1::DeviceRegistry]
        #     Required. The new values for the device registry. The `id` field must be empty, and
        #     the `name` field must indicate the path of the resource. For example,
        #     `projects/example-project/locations/us-central1/registries/my-registry`.
        # @!attribute [rw] update_mask
        #   @return [Google::Protobuf::FieldMask]
        #     Required. Only updates the `device_registry` fields indicated by this mask.
        #     The field mask must not be empty, and it must not contain fields that
        #     are immutable or only set by the server.
        #     Mutable top-level fields: `event_notification_config`, `http_config`,
        #     `mqtt_config`, and `state_notification_config`.
        class UpdateDeviceRegistryRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for `ListDeviceRegistries`.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The project and cloud region path. For example,
        #     `projects/example-project/locations/us-central1`.
        # @!attribute [rw] page_size
        #   @return [Integer]
        #     The maximum number of registries to return in the response. If this value
        #     is zero, the service will select a default size. A call may return fewer
        #     objects than requested. A non-empty `next_page_token` in the response
        #     indicates that more data is available.
        # @!attribute [rw] page_token
        #   @return [String]
        #     The value returned by the last `ListDeviceRegistriesResponse`; indicates
        #     that this is a continuation of a prior `ListDeviceRegistries` call and
        #     the system should return the next page of data.
        class ListDeviceRegistriesRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Response for `ListDeviceRegistries`.
        # @!attribute [rw] device_registries
        #   @return [Array<Google::Cloud::Iot::V1::DeviceRegistry>]
        #     The registries that matched the query.
        # @!attribute [rw] next_page_token
        #   @return [String]
        #     If not empty, indicates that there may be more registries that match the
        #     request; this value should be passed in a new
        #     `ListDeviceRegistriesRequest`.
        class ListDeviceRegistriesResponse
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for `CreateDevice`.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The name of the device registry where this device should be created.
        #     For example,
        #     `projects/example-project/locations/us-central1/registries/my-registry`.
        # @!attribute [rw] device
        #   @return [Google::Cloud::Iot::V1::Device]
        #     Required. The device registration details. The field `name` must be empty. The server
        #     generates `name` from the device registry `id` and the
        #     `parent` field.
        class CreateDeviceRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for `GetDevice`.
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The name of the device. For example,
        #     `projects/p0/locations/us-central1/registries/registry0/devices/device0` or
        #     `projects/p0/locations/us-central1/registries/registry0/devices/{num_id}`.
        # @!attribute [rw] field_mask
        #   @return [Google::Protobuf::FieldMask]
        #     The fields of the `Device` resource to be returned in the response. If the
        #     field mask is unset or empty, all fields are returned.
        class GetDeviceRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for `UpdateDevice`.
        # @!attribute [rw] device
        #   @return [Google::Cloud::Iot::V1::Device]
        #     Required. The new values for the device. The `id` and `num_id` fields must
        #     be empty, and the field `name` must specify the name path. For example,
        #     `projects/p0/locations/us-central1/registries/registry0/devices/device0`or
        #     `projects/p0/locations/us-central1/registries/registry0/devices/{num_id}`.
        # @!attribute [rw] update_mask
        #   @return [Google::Protobuf::FieldMask]
        #     Required. Only updates the `device` fields indicated by this mask.
        #     The field mask must not be empty, and it must not contain fields that
        #     are immutable or only set by the server.
        #     Mutable top-level fields: `credentials`, `blocked`, and `metadata`
        class UpdateDeviceRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for `DeleteDevice`.
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The name of the device. For example,
        #     `projects/p0/locations/us-central1/registries/registry0/devices/device0` or
        #     `projects/p0/locations/us-central1/registries/registry0/devices/{num_id}`.
        class DeleteDeviceRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for `ListDevices`.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The device registry path. Required. For example,
        #     `projects/my-project/locations/us-central1/registries/my-registry`.
        # @!attribute [rw] device_num_ids
        #   @return [Array<Integer>]
        #     A list of device numeric IDs. If empty, this field is ignored. Maximum
        #     IDs: 10,000.
        # @!attribute [rw] device_ids
        #   @return [Array<String>]
        #     A list of device string IDs. For example, `['device0', 'device12']`.
        #     If empty, this field is ignored. Maximum IDs: 10,000
        # @!attribute [rw] field_mask
        #   @return [Google::Protobuf::FieldMask]
        #     The fields of the `Device` resource to be returned in the response. The
        #     fields `id` and `num_id` are always returned, along with any
        #     other fields specified.
        # @!attribute [rw] gateway_list_options
        #   @return [Google::Cloud::Iot::V1::GatewayListOptions]
        #     Options related to gateways.
        # @!attribute [rw] page_size
        #   @return [Integer]
        #     The maximum number of devices to return in the response. If this value
        #     is zero, the service will select a default size. A call may return fewer
        #     objects than requested. A non-empty `next_page_token` in the response
        #     indicates that more data is available.
        # @!attribute [rw] page_token
        #   @return [String]
        #     The value returned by the last `ListDevicesResponse`; indicates
        #     that this is a continuation of a prior `ListDevices` call and
        #     the system should return the next page of data.
        class ListDevicesRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Options for limiting the list based on gateway type and associations.
        # @!attribute [rw] gateway_type
        #   @return [Google::Cloud::Iot::V1::GatewayType]
        #     If `GATEWAY` is specified, only gateways are returned. If `NON_GATEWAY`
        #     is specified, only non-gateway devices are returned. If
        #     `GATEWAY_TYPE_UNSPECIFIED` is specified, all devices are returned.
        # @!attribute [rw] associations_gateway_id
        #   @return [String]
        #     If set, only devices associated with the specified gateway are returned.
        #     The gateway ID can be numeric (`num_id`) or the user-defined string
        #     (`id`). For example, if `123` is specified, only devices bound to the
        #     gateway with `num_id` 123 are returned.
        # @!attribute [rw] associations_device_id
        #   @return [String]
        #     If set, returns only the gateways with which the specified device is
        #     associated. The device ID can be numeric (`num_id`) or the user-defined
        #     string (`id`). For example, if `456` is specified, returns only the
        #     gateways to which the device with `num_id` 456 is bound.
        class GatewayListOptions
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Response for `ListDevices`.
        # @!attribute [rw] devices
        #   @return [Array<Google::Cloud::Iot::V1::Device>]
        #     The devices that match the request.
        # @!attribute [rw] next_page_token
        #   @return [String]
        #     If not empty, indicates that there may be more devices that match the
        #     request; this value should be passed in a new `ListDevicesRequest`.
        class ListDevicesResponse
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for `ModifyCloudToDeviceConfig`.
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The name of the device. For example,
        #     `projects/p0/locations/us-central1/registries/registry0/devices/device0` or
        #     `projects/p0/locations/us-central1/registries/registry0/devices/{num_id}`.
        # @!attribute [rw] version_to_update
        #   @return [Integer]
        #     The version number to update. If this value is zero, it will not check the
        #     version number of the server and will always update the current version;
        #     otherwise, this update will fail if the version number found on the server
        #     does not match this version number. This is used to support multiple
        #     simultaneous updates without losing data.
        # @!attribute [rw] binary_data
        #   @return [String]
        #     Required. The configuration data for the device.
        class ModifyCloudToDeviceConfigRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for `ListDeviceConfigVersions`.
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The name of the device. For example,
        #     `projects/p0/locations/us-central1/registries/registry0/devices/device0` or
        #     `projects/p0/locations/us-central1/registries/registry0/devices/{num_id}`.
        # @!attribute [rw] num_versions
        #   @return [Integer]
        #     The number of versions to list. Versions are listed in decreasing order of
        #     the version number. The maximum number of versions retained is 10. If this
        #     value is zero, it will return all the versions available.
        class ListDeviceConfigVersionsRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Response for `ListDeviceConfigVersions`.
        # @!attribute [rw] device_configs
        #   @return [Array<Google::Cloud::Iot::V1::DeviceConfig>]
        #     The device configuration for the last few versions. Versions are listed
        #     in decreasing order, starting from the most recent one.
        class ListDeviceConfigVersionsResponse
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for `ListDeviceStates`.
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The name of the device. For example,
        #     `projects/p0/locations/us-central1/registries/registry0/devices/device0` or
        #     `projects/p0/locations/us-central1/registries/registry0/devices/{num_id}`.
        # @!attribute [rw] num_states
        #   @return [Integer]
        #     The number of states to list. States are listed in descending order of
        #     update time. The maximum number of states retained is 10. If this
        #     value is zero, it will return all the states available.
        class ListDeviceStatesRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Response for `ListDeviceStates`.
        # @!attribute [rw] device_states
        #   @return [Array<Google::Cloud::Iot::V1::DeviceState>]
        #     The last few device states. States are listed in descending order of server
        #     update time, starting from the most recent one.
        class ListDeviceStatesResponse
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for `SendCommandToDevice`.
        # @!attribute [rw] name
        #   @return [String]
        #     Required. The name of the device. For example,
        #     `projects/p0/locations/us-central1/registries/registry0/devices/device0` or
        #     `projects/p0/locations/us-central1/registries/registry0/devices/{num_id}`.
        # @!attribute [rw] binary_data
        #   @return [String]
        #     Required. The command data to send to the device.
        # @!attribute [rw] subfolder
        #   @return [String]
        #     Optional subfolder for the command. If empty, the command will be delivered
        #     to the /devices/\\{device-id}/commands topic, otherwise it will be delivered
        #     to the /devices/\\{device-id}/commands/\\{subfolder} topic. Multi-level
        #     subfolders are allowed. This field must not have more than 256 characters,
        #     and must not contain any MQTT wildcards ("+" or "#") or null characters.
        class SendCommandToDeviceRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Response for `SendCommandToDevice`.
        class SendCommandToDeviceResponse
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for `BindDeviceToGateway`.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The name of the registry. For example,
        #     `projects/example-project/locations/us-central1/registries/my-registry`.
        # @!attribute [rw] gateway_id
        #   @return [String]
        #     Required. The value of `gateway_id` can be either the device numeric ID or the
        #     user-defined device identifier.
        # @!attribute [rw] device_id
        #   @return [String]
        #     Required. The device to associate with the specified gateway. The value of
        #     `device_id` can be either the device numeric ID or the user-defined device
        #     identifier.
        class BindDeviceToGatewayRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Response for `BindDeviceToGateway`.
        class BindDeviceToGatewayResponse
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Request for `UnbindDeviceFromGateway`.
        # @!attribute [rw] parent
        #   @return [String]
        #     Required. The name of the registry. For example,
        #     `projects/example-project/locations/us-central1/registries/my-registry`.
        # @!attribute [rw] gateway_id
        #   @return [String]
        #     Required. The value of `gateway_id` can be either the device numeric ID or the
        #     user-defined device identifier.
        # @!attribute [rw] device_id
        #   @return [String]
        #     Required. The device to disassociate from the specified gateway. The value of
        #     `device_id` can be either the device numeric ID or the user-defined device
        #     identifier.
        class UnbindDeviceFromGatewayRequest
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end

        # Response for `UnbindDeviceFromGateway`.
        class UnbindDeviceFromGatewayResponse
          include Google::Protobuf::MessageExts
          extend Google::Protobuf::MessageExts::ClassMethods
        end
      end
    end
  end
end
