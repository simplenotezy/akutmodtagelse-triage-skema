opt_out_usage

# Have an easy way to get the root of the project
def root_path
  Dir.pwd.sub(/.*\Kfastlane/, '').sub(/.*\Kandroid/, '').sub(/.*\Kios/, '').sub(/.*\K\/\//, '')
end

# Have an easy way to run flutter tasks on the root of the project
lane :sh_on_root do |options|
  command = options[:command]
  sh("cd #{root_path} && #{command}")
end

# Tasks to be reused on each platform flow
lane :fetch_dependencies do
  sh_on_root(command: "flutter pub get --suppress-analytics")
end

# Tasks to be reused on each platform flow
lane :build_autogenerated_code do
  sh_on_root(command: "flutter pub run build_runner build --delete-conflicting-outputs")
end

# Tasks to be reused on each platform flow
lane :lint do
  sh_on_root(command: "flutter format --suppress-analytics --set-exit-if-changed -n lib/main.dart lib/src/ test/")
end

lane :build do |options|
  pubspec_version_number = get_version_from_pubspec()

  type = options[:type]
  build_number = options.fetch(:build_number, get_build_number())
  version_number = options.fetch(:version_number, pubspec_version_number)
  no_codesign = options.fetch(:no_codesign, false)
  config_only = options.fetch(:config_only, false)

  command = "flutter build #{type} --no-pub --suppress-analytics --release"
  command += " --build-number=#{build_number}" if build_number.to_s != ""
  command += " --build-name=#{version_number}" if version_number.to_s != ""
  command += " --no-codesign" if no_codesign
  command += " --config-only" if config_only

	UI.message("Building app version: #{version_number} build: #{build_number}")

  sh_on_root(command: command)
end

# Tasks to be reused on each platform flow
lane :test do |options|
  sh_on_root(command: "flutter test --no-pub --coverage --suppress-analytics")
end


# Private lane to verify all environment variables are set
private_lane :verify_env do |options|
	# array of ENVS to check
	envs = options.fetch(:envs, [])

	envs.each do |env|
		if ENV[env].nil? || ENV[env].empty?
			UI.user_error!("ENV \"#{env}\" is not set. Please set it in your environment variables (e.g. ios/fastlane/.env)")
		end
	end
end


# Build number is a unique identifier for each build that is uploaded to the app store.
# This method will get the latest build number from the app store and increment it by 1.
# Ensure authenticate_apple_store is called before this method
def get_build_number()
	
  return get_new_build_number(
    bundle_identifier: ENV["APP_BUNDLE_ID"], # e.g com.example.yourApp
    package_name: ENV["APP_PACKAGE_NAME"], # e.g com.example.yourapp
    google_play_json_key_path: firebase_service_json_path
  ).to_s
end

def firebase_service_json_path
  root_path + '/firebase_app_distribution_service_account.json'
end

def get_version_from_pubspec
  require 'yaml'
  
  # Define the correct path to pubspec.yaml relative to the Fastlane directory
  pubspec_path = File.expand_path("#{root_path}/pubspec.yaml")

  # Check if the file exists to avoid errors
  unless File.exist?(pubspec_path)
    UI.error("pubspec.yaml file not found at path: #{pubspec_path}")
    return nil
  end

  # Parse the pubspec.yaml file
  pubspec_content = File.read(pubspec_path)

  # Use regex to find the version number line and extract both version number and build number
  version_line = pubspec_content.match(/version:\s*(\d+\.\d+\.\d+)\+(\d+)/)
  if version_line
    version_number = version_line[1]
  else
    UI.error("Version number not found in pubspec.yaml")
    return nil
  end

  return version_number
end