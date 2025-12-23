cat > layers/meta-custom/recipes-core/images/rpi-test-image.bbappend << 'EOF'
IMAGE_INSTALL:append = " waydroid-setup"
EOF