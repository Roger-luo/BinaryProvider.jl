module BinaryProvider

using Libdl

# Utilities for controlling verbosity
include("LoggingUtils.jl")
# Include our subprocess running functionality
include("OutputCollector.jl")
# External utilities such as downloading/decompressing tarballs
include("PlatformEngines.jl")
# Platform naming
include("PlatformNames.jl")
# Everything related to file/path management
include("Prefix.jl")
# Abstraction of "needing" a file, that would trigger an install
include("Products.jl")

# Compat shims
include("CompatShims.jl")

function __init__()
    global global_prefix

    # Initialize our global_prefix
    global_prefix = Prefix(joinpath(dirname(@__FILE__), "../", "global_prefix"))

    # Find the right download/compression engines for this platform
    probe_platform_engines!()
end

end # module
