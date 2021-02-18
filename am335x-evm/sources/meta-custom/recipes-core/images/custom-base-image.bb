# Use the contents of the file specified into this file
# This is another way to customize an already existing recipe.
require recipes-core/images/arago-base-tisdk-image.bb

export IMAGE_BASENAME = "custom-base-image"

# Add any packages or packagegroups that we want added to our filesystem
IMAGE_INSTALL += "\
    hello-world \
    "

