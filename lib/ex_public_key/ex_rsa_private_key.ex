defmodule ExPublicKey.RSAPrivateKey do

  defstruct [
    version: nil,
    public_modulus: nil,
    public_exponent: nil,
    private_exponent: nil,
    prime_one: nil,
    prime_two: nil,
    exponent_one: nil,
    exponent_two: nil,
    ctr_coefficient: nil,
    other_prime_infos: nil,
  ]

  @type t :: %ExPublicKey.RSAPrivateKey{
    version: atom,
    public_modulus: integer,
    public_exponent: integer,
    private_exponent: integer,
    prime_one: integer,
    prime_two: integer,
    exponent_one: integer,
    exponent_two: integer,
    ctr_coefficient: integer,
    other_prime_infos: atom
  }

  def from_sequence(rsa_key_seq) do
    %ExPublicKey.RSAPrivateKey{} |> struct(
      version: elem(rsa_key_seq, 1),
      public_modulus: elem(rsa_key_seq, 2),
      public_exponent: elem(rsa_key_seq, 3),
      private_exponent: elem(rsa_key_seq, 4),
      prime_one: elem(rsa_key_seq, 5),
      prime_two: elem(rsa_key_seq, 6),
      exponent_one: elem(rsa_key_seq, 7),
      exponent_two: elem(rsa_key_seq, 8),
      ctr_coefficient: elem(rsa_key_seq, 9),
      other_prime_infos: elem(rsa_key_seq, 10),
    )
  end

  def as_sequence(rsa_private_key) do
    case rsa_private_key do
      %__MODULE__{} ->
        {:ok, {
          :RSAPrivateKey,
          Map.get(rsa_private_key, :version),
          Map.get(rsa_private_key, :public_modulus),
          Map.get(rsa_private_key, :public_exponent),
          Map.get(rsa_private_key, :private_exponent),
          Map.get(rsa_private_key, :prime_one),
          Map.get(rsa_private_key, :prime_two),
          Map.get(rsa_private_key, :exponent_one),
          Map.get(rsa_private_key, :exponent_two),
          Map.get(rsa_private_key, :ctr_coefficient),
          Map.get(rsa_private_key, :other_prime_infos),
        }}
      _ ->
        {:error, "invalid ExPublicKey.RSAPrivateKey: #{inspect rsa_private_key}"}
    end
  end

end
