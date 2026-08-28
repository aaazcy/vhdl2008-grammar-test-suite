-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SYN_S01
-- Rule Type: Syntax
-- BNF Production: DECIMAL_LITERAL
-- IEEE Section: 15.5.1
-- BNF Text: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Test Focus: Integer decimal literals used as constant array bounds and initial values
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity decimal_literal_syn_s01 is
  port (
    data_out : out bit_vector(7 downto 0)
  );
end entity decimal_literal_syn_s01;

architecture bh of decimal_literal_syn_s01 is
  -- Integer decimal literals as bounds and defaults
  constant C_WIDTH : integer := 8;
  constant C_DEPTH : integer := 256;
  signal s_reg    : bit_vector(7 downto 0) := "00000000";
  signal s_count  : integer range 0 to 255 := 0;
begin
  s_reg   <= "10101010";
  s_count <= 42;
  data_out <= s_reg;
end architecture bh;
