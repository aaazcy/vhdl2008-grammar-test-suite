-- =============================================================
-- Case ID: TC_INTEGER_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: integer ::= digit { [ underline ] digit }
-- Case Type: Positive
-- Test Focus: Multi-digit integer with underscores for readability — testing underline as a separator between digits is correctly ignored
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity int_underscore is
  port (
    val_out : out integer
  );
end entity int_underscore;

architecture rtl of int_underscore is
  constant C_CLK_FREQ : integer := 100_000_000;
  constant C_ADDR_MAX : integer := 16#FFFF_FFFF#;
  constant C_MILLION  : integer := 1_000_000;
  signal s_sum        : integer := 0;
begin
  s_sum   <= C_MILLION;
  val_out <= s_sum;
end architecture rtl;
