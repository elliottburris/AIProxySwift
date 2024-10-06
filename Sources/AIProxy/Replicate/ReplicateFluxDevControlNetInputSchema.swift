//
//  ReplicateFluxDevControlNetInputSchema.swift
//
//
//  Created by Lou Zell on 10/6/24.
//

import Foundation

/// Docstrings from https://replicate.com/xlabs-ai/flux-dev-controlnet/api/schema
public struct ReplicateFluxDevControlNetInputSchema: Encodable {
    // Required

    /// Image to use with control net
    public let controlImage: URL

    /// Input prompt
    public let prompt: String

    // Optional

    /// Strength of control net. Different controls work better with different strengths. Canny
    /// works best with `0.5`, soft edge works best with `0.4`, and depth works best between
    /// `0.5` and `0.75`. If images are low quality, try reducing the strength and try reducing
    /// the guidance scale.
    ///
    /// Default: 0.5
    /// Maximum: 3
    /// Minimum: 0
    public let controlStrength: Double?

    /// Type of control net
    ///
    /// Default: `.depth`
    public let controlType: ControlType?

    /// Preprocessor to use with depth control net
    ///
    /// Default: `.depthAnything`
    public let depthPreprocessor: DepthPreprocessor?

    /// Guidance scale
    /// Default": 3.5
    /// Maximum": 5
    /// Minimum": 0
    public let guidanceScale: Double?

    /// Strength of image to image control. 0 means none of the control image is used. 1 means
    /// the control image is returned used as is.
    ///
    /// **Try values between 0 and 0.25 for best results.**
    ///
    /// Maximum: 1
    /// Minimum: 0
    /// Default: 0
    public let imageToImageStrength: Double?

    /// Strength of LoRA model
    ///
    /// Default: 1
    /// Maximum: 3
    /// Minimum: -1
    public let loraStrength: Double?

    /// Optional LoRA model to use. Give a URL to a HuggingFace `.safetensors` file, a
    /// Replicate `.tar` file or a CivitAI download link.
    public let loraUrl: String?

    /// Things you do not want to see in your image
    public let negativePrompt: String?

    /// Format of the output images
    public let outputFormat: OutputFormat?

    /// Quality of the output images, from `0` to `100`. `100` is best quality, `0` is lowest quality.
    ///
    /// Default: 80
    /// Maximum: 100
    /// Minimum: 0
    public let outputQuality: Int?

    /// Return the preprocessed image used to control the generation process. Useful for debugging.
    ///
    /// Default: `false`
    public let returnPreprocessedImage: Bool?

    /// Set a seed for reproducibility. Random by default.
    public let seed: Int?

    /// Preprocessor to use with soft edge control net
    public let softEdgePreprocessor: SoftEdgePreprocessor?

    /// Number of steps
    ///
    /// Default: 28
    /// Maximum: 50
    /// Minimum: 1
    public let steps: Int?

    private enum CodingKeys: String, CodingKey {
        case controlImage = "control_image"
        case controlStrength = "control_strength"
        case controlType = "control_type"
        case depthPreprocessor = "depth_preprocessor"
        case guidanceScale = "guidance_scale"
        case imageToImageStrength = "image_to_image_strength"
        case loraStrength = "lora_strength"
        case loraUrl = "lora_url"
        case negativePrompt = "negative_prompt"
        case outputFormat = "output_format"
        case outputQuality = "output_quality"
        case prompt
        case returnPreprocessedImage = "return_preprocessed_image"
        case seed
        case softEdgePreprocessor = "soft_edge_preprocessor"
        case steps
    }

    // This memberwise initializer is autogenerated.
    // To regenerate, use `cmd-shift-a` > Generate Memberwise Initializer
    // To format, place the cursor in the initializer's parameter list and use `ctrl-m`
    public init(
        controlImage: URL,
        prompt: String,
        controlStrength: Double? = nil,
        controlType: ReplicateFluxDevControlNetInputSchema.ControlType? = nil,
        depthPreprocessor: ReplicateFluxDevControlNetInputSchema.DepthPreprocessor? = nil,
        guidanceScale: Double? = nil,
        imageToImageStrength: Double? = nil,
        loraStrength: Double? = nil,
        loraUrl: String? = nil,
        negativePrompt: String? = nil,
        outputFormat: ReplicateFluxDevControlNetInputSchema.OutputFormat? = nil,
        outputQuality: Int? = nil,
        returnPreprocessedImage: Bool? = nil,
        seed: Int? = nil,
        softEdgePreprocessor: ReplicateFluxDevControlNetInputSchema.SoftEdgePreprocessor? = nil,
        steps: Int? = nil
    ) {
        self.controlImage = controlImage
        self.prompt = prompt
        self.controlStrength = controlStrength
        self.controlType = controlType
        self.depthPreprocessor = depthPreprocessor
        self.guidanceScale = guidanceScale
        self.imageToImageStrength = imageToImageStrength
        self.loraStrength = loraStrength
        self.loraUrl = loraUrl
        self.negativePrompt = negativePrompt
        self.outputFormat = outputFormat
        self.outputQuality = outputQuality
        self.returnPreprocessedImage = returnPreprocessedImage
        self.seed = seed
        self.softEdgePreprocessor = softEdgePreprocessor
        self.steps = steps
    }
}

// MARK: - InputSchema.ControlType
public extension ReplicateFluxDevControlNetInputSchema {
    enum ControlType: String, Encodable {
        case canny
        case depth
        case softEdge = "soft_edge"
    }
}

// MARK: - InputSchema.DepthPreprocessor
public extension ReplicateFluxDevControlNetInputSchema {
    enum DepthPreprocessor: String, Encodable {
        case midas = "Midas"
        case zoe = "Zoe"
        case depthAnything = "DepthAnything"
        case zoeDepthAnything = "Zoe-DepthAnything"
    }
}

// MARK: - InputSchema.OutputFormat
public extension ReplicateFluxDevControlNetInputSchema {
    enum OutputFormat: String, Encodable {
        case webp
        case jpg
        case png
    }
}

// MARK: - InputSchema.SoftEdgePreprocessor
public extension ReplicateFluxDevControlNetInputSchema {
    enum SoftEdgePreprocessor: String, Encodable {
        case hed = "HED"
        case teed = "TEED"
        case piDiNet = "PiDiNet"
    }
}
