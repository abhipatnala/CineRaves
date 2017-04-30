Rails.application.config.middleware.use OmniAuth::Builder do
  provider :trakt, 'c64414858aa29c01a150739d54a71e770a90a676bbff6ed9330b7652685dde4e', '45b6837e4bc58b33b187a014e92cd0cfac6bd388ab03f5f40f2b2c08977b6cee'
end