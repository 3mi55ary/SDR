# SDR Scripts
Current SDRs include RTL-SDR v4 and v3.
------------------------------------------------------------------------------------------------------------
**ApplyRTLSDRv4Perms.sh** - Applys proper permissions for the SatNOGS Client (Docker) to access the RTL-SDR v4.

**BuildFullSoapy.sh** - Builds SoapySDR and SoapyRTLSDR from source.

**BuildSDRPPHeadless.sh** - Installs SDR++ and starts an SDR++ Headless server (connect to via external SDR++ client).

**BuildSatNOGS.sh** - Builds a custom environment on Raspberry Pi OS for remote operation (both SatNOGS Client and manual testing).

**StartSDRPPServer.sh** - Starts a SDR++ server on the default port (needs SDR++ installed.  See BuildSDRPPHeadless.sh for installation.).

**UpdateDrivers.sh** - Installs the latest RTL-SDR drivers.  Included in BuildSatNOGS.sh.
