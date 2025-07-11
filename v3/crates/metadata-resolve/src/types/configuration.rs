/// Configuration for the metadata-resolve step.
///
/// Deserialization is only intended to be used for testing and is not reliable.
#[derive(Debug, Clone, Default, serde::Deserialize)]
#[serde(default, deny_unknown_fields, rename_all = "camelCase")]
pub struct Configuration {
    pub unstable_features: UnstableFeatures,
}

/// internal feature flags used in metadata resolve steps
///
/// Deserialization is only intended to be used for testing and is not reliable.
#[derive(Debug, Clone, Copy, Default, serde::Deserialize)]
#[serde(default, deny_unknown_fields, rename_all = "camelCase")]
#[allow(clippy::struct_excessive_bools)]
pub struct UnstableFeatures {
    pub enable_aggregation_predicates: bool,
    pub enable_authorization_rules: bool,
}
