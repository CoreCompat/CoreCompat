# System.Drawing for .NET Core

Good news! System.Drawing for .NET Core has been released as part of the Compatibility Pack for .NET Core.

You can use [System.Drawing.Common](https://www.nuget.org/packages/System.Drawing.Common). Issues related to System.Drawing.Common
can be filed at http://github.com/dotnet/corefx/.

## Running System.Drawing for .NET Core on OS X or Linux

On Windows, there are no dependencies for System.Drawing.Common. On Linux and macOS, you need to install [libgdiplus](https://github.com/mono/libgdiplus).

You can either install libgdiplus using your package manager. For example, on macOS, run `brew install mono-libgdiplus`.
On Linux, your distro probably includes a version of libgdiplus. That may be a very old version, though. Mono helpfully
packages libgdiplus for various distros, so you also [use the Mono packages for libgdiplus](http://www.mono-project.com/download/#download-lin). They contain more recent versions of libgdiplus.

Alternatively, you can use NuGet packages to install libgdiplus side-by-side with your application.

If use System.Drawing for .NET Core on OS X or Linux, make sure you reference the native packages:
* [Linux: `runtime.linux-x64.CoreCompat.System.Drawing`](https://www.nuget.org/packages/runtime.linux-x64.CoreCompat.System.Drawing)
* [OS X: `runtime.osx.10.10-x64.CoreCompat.System.Drawing`](https://www.nuget.org/packages/runtime.osx.10.10-x64.CoreCompat.System.Drawing)
