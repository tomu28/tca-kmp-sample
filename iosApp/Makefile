IOS_APP_WORKSPACE := TcaKmpSampleApp.xcworkspace

.PHONY: open
open: ## Open xcodeproj
	@open $(IOS_APP_WORKSPACE)

.PHONY: bootstrap
bootstrap: tools debug-build-kmp-framework ## Run bootstrap

.PHONY: tools
tools: ## Install tools
	@brew install swift-format

.PHONY: debug-build-kmp-framework
debug-build-kmp-framework: ## Debug Build KMP Frameworks
	./scripts/build-kmp-framework.sh Debug

.PHONY: release-build-kmp-framework
release-build-kmp-framework: ## Release Build KMP Frameworks
	./scripts/build-kmp-framework.sh Release

.PHONY: clean-build-cache-kmp-framework
clean-build-cache-kmp-framework: ## Clean build cache KMP Frameworks
	rm -rf CorePackage/build/

.PHONY: format
format: ## Apply swift-format
	find FeaturePackage/Sources/ FeaturePackage/Tests/ FeaturePackage/Package.swift CorePackage/Sources/ CorePackage/Tests/ CorePackage/Package.swift TcaKmpSampleApp/ -type f \( -name '*.swift' ! -name '*.generated.swift' \) -not -path '*/Generated/*' -print0 | xargs -0 swift-format -i -r -p --ignore-unparsable-files
