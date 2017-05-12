# System.Drawing for .NET Core

This repository contains an implementation of System.Drawing which is compatible with .NET Core. It uses the
Mono implementation of System.Drawing and runs on Windows, Linux and Mac.

System.Drawing for .NET Core is available as the `CoreCompat.System.Drawing` NuGet package.

## System.Drawing for .NET Core 2.0
See [CoreCompat.System.Drawing.v2](https://github.com/CoreCompat/System.Drawing) for a version of System.Drawing which is compatible with .NET Core 2.0 and .NET Standard 2.0

## Running System.Drawing for .NET Core on OS X or Linux

If use System.Drawing for .NET Core on OS X or Linux, make sure you reference the native packages:
[Linux: `runtime.linux-x64.CoreCompat.System.Drawing`](https://www.nuget.org/packages/runtime.linux-x64.CoreCompat.System.Drawing)
[OS X: `runtime.osx.10.10-x64.CoreCompat.System.Drawing`](https://www.nuget.org/packages/runtime.osx.10.10-x64.CoreCompat.System.Drawing)

## Roadmap

Currently, System.Drawing for .NET Core requires a rather heavily patched version of the Mono sources because a lot of the attributes (such as those related to serialization and CAS) are not available on .NET Core.

When `netstandard1.8` is available, a lot of these concerns go away, and we plan to release a new version of System.Drawing for .NET Core once `netstandard1.8` is available.
