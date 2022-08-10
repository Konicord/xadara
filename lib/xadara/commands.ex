defmodule Xadara.Commands do
  def list_of_commands() do
    %{
      "test" => "Test the application",
      "random" => "Generate a random name",
      "qr" => "Generate a QR code",
      "ip" => "Get your public IP address",
      "disposable" => "Check if an email is disposable",
      "epoch" => "Get the current epoch",
      "letter" => "Get a random letter"
    }
  end
end
