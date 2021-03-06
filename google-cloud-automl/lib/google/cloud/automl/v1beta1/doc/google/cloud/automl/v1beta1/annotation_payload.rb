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


module Google
  module Cloud
    module AutoML
      module V1beta1
        # Contains annotation information that is relevant to AutoML.
        # @!attribute [rw] translation
        #   @return [Google::Cloud::AutoML::V1beta1::TranslationAnnotation]
        #     Annotation details for translation.
        # @!attribute [rw] classification
        #   @return [Google::Cloud::AutoML::V1beta1::ClassificationAnnotation]
        #     Annotation details for content or image classification.
        # @!attribute [rw] image_object_detection
        #   @return [Google::Cloud::AutoML::V1beta1::ImageObjectDetectionAnnotation]
        #     Annotation details for image object detection.
        # @!attribute [rw] video_classification
        #   @return [Google::Cloud::AutoML::V1beta1::VideoClassificationAnnotation]
        #     Annotation details for video classification.
        #     Returned for Video Classification predictions.
        # @!attribute [rw] video_object_tracking
        #   @return [Google::Cloud::AutoML::V1beta1::VideoObjectTrackingAnnotation]
        #     Annotation details for video object tracking.
        # @!attribute [rw] text_extraction
        #   @return [Google::Cloud::AutoML::V1beta1::TextExtractionAnnotation]
        #     Annotation details for text extraction.
        # @!attribute [rw] text_sentiment
        #   @return [Google::Cloud::AutoML::V1beta1::TextSentimentAnnotation]
        #     Annotation details for text sentiment.
        # @!attribute [rw] tables
        #   @return [Google::Cloud::AutoML::V1beta1::TablesAnnotation]
        #     Annotation details for Tables.
        # @!attribute [rw] annotation_spec_id
        #   @return [String]
        #     Output only . The resource ID of the annotation spec that
        #     this annotation pertains to. The annotation spec comes from either an
        #     ancestor dataset, or the dataset that was used to train the model in use.
        # @!attribute [rw] display_name
        #   @return [String]
        #     Output only. The value of
        #     {Google::Cloud::AutoML::V1beta1::AnnotationSpec#display_name display_name}
        #     when the model was trained. Because this field returns a value at model
        #     training time, for different models trained using the same dataset, the
        #     returned value could be different as model owner could update the
        #     `display_name` between any two model training.
        class AnnotationPayload; end
      end
    end
  end
end