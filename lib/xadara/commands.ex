defmodule Xadara.Commands do
  def list_of_commands() do
    %{
      "/random" => "Generate a random name",
      "/qr/ip" => "Generate a QR code",
      "ip" => "Get your public IP address",
      "/epoch" => "Get the current epoch",
      "/disposable/email" => "Check if an email is disposable",
      "/geo/ip" => "Get the geographic informations of an IP address",
    }
  end
end
