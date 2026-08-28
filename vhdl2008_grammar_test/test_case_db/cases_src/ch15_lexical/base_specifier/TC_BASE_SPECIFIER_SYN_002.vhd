-- =============================================================
-- Case ID: TC_BASE_SPECIFIER_SYN_002
-- Rule Type: Syntax
-- BNF Production: BASE_SPECIFIER
-- IEEE Section: 15.8
-- BNF Text: base_specifier ::= B | O | X | UB | UO | UX | SB | SO | SX | D
-- Test Focus: Base specifiers O (octal), X (hex), D (decimal) in bit string and numeric literals
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity base_specifier_syn_002 is
  port (
    oct_out : out bit_vector(8 downto 0);
    hex_out : out bit_vector(7 downto 0);
    dec_out : out integer
  );
end entity base_specifier_syn_002;

architecture bh of base_specifier_syn_002 is
  -- O specifier: octal bit string literal
  constant C_OCT : bit_vector(8 downto 0) := O"377";
  -- X specifier: hex bit string literal
  constant C_HEX : bit_vector(7 downto 0) := X"FF";
  -- D specifier: decimal based literal
  constant C_DEC : integer := 10#255#;
begin
  oct_out <= C_OCT;
  hex_out <= C_HEX;
  dec_out <= C_DEC;
end architecture bh;
