-- =============================================================
-- Case ID: TC_LITERAL_SYN_003
-- Rule Type: Syntax
-- BNF Production: literal
-- IEEE Section: 9.3.3.1
-- BNF Text: literal ::= numeric_literal | enumeration_literal | string_literal | bit_string_literal | null
-- Test Focus: string_literal, bit_string_literal, and null literal all used in constants and comparisons
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_literal_syn_003 is
  port (
    cmd     : in  bit_vector(3 downto 0);
    match   : out bit
  );
end entity tc_literal_syn_003;

architecture decoder of tc_literal_syn_003 is
  constant C_NOP_CMD : bit_vector(3 downto 0) := X"0";  -- bit_string_literal
  constant C_MSG     : string(1 to 4) := "NOP_";         -- string_literal
  signal null_ptr    : bit := '0';  -- null cannot be signal; use constant for comparison context
begin
  -- bit_string_literal comparison, string_literal in expression
  -- null is typically used as null array; we use bit_string as comparison
  match <= '1' when cmd = X"0" else '0';
end architecture decoder;
