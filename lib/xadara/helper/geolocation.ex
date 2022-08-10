defmodule Xadara.Geo do
  @moduledoc """
  Returns the Geo Data of a given IP address
  iex> Xadara.Geo.geo_data("40.124.46.157")
  %{
  "city" => "San Antonio",
  "city_geoname_id" => 4726206,
  "connection" => %{
    "autonomous_system_number" => 8075,
    "autonomous_system_organization" => "MICROSOFT-CORP-MSN-AS-BLOCK",
    "connection_type" => "Corporate",
    "isp_name" => "Microsoft Corporation",
    "organization_name" => "Microsoft Corporation"
  },
  "continent" => "North America",
  "continent_code" => "NA",
  "continent_geoname_id" => 6255149,
  "country" => "United States",
  "country_code" => "US",
  "country_geoname_id" => 6252001,
  "country_is_eu" => false,
  "currency" => %{"currency_code" => "USD", "currency_name" => "USD"},
  "flag" => %{
    "emoji" => "🇺🇸",
    "png" => "https://static.abstractapi.com/country-flags/US_flag.png",
    "svg" => "https://static.abstractapi.com/country-flags/US_flag.svg",
    "unicode" => "U+1F1FA U+1F1F8"
  },
  "ip_address" => "40.124.46.157",
  "latitude" => 29.4227,
  "longitude" => -98.4927,
  "postal_code" => "78288",
  "region" => "Texas",
  "region_geoname_id" => 4736286,
  "region_iso_code" => "TX",
  "security" => %{"is_vpn" => false},
  "timezone" => %{
    "abbreviation" => "CDT",
    "current_time" => "06:13:09",
    "gmt_offset" => -5,
    "is_dst" => true,
    "name" => "America/Chicago"
  }
  }
  """
  @type ip_address() :: String.t()
  @spec geo_data(ip_address()) :: String.t() | :invalid_ip
  def geo_data(ip) when is_binary(ip) do
    geo_url = Application.get_env(:xadara, :geo_url)

    case Xadara.ApiBase.get!("#{geo_url}#{URI.encode_www_form(ip)}") do
      %HTTPoison.Response{body: body, status_code: 200} ->
        # for console
        Poison.decode!(body)

      # body # for web

      %HTTPoison.Response{status_code: status_code} when status_code > 399 ->
        IO.inspect(status_code, label: "STATUS_CODE")
        :error

      _response ->
        raise Xadara.Error
    end
  end
end
