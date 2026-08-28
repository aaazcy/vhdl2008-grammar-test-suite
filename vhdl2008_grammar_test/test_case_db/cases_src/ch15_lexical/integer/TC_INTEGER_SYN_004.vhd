-- =============================================================
-- Case ID: TC_INTEGER_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTEGER
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: integer ::= digit { [ underline ] digit }
-- Case Type: Positive
-- Test Focus: Multi-digit integer without underscores — testing repeated consecutive digits forming a large integer, used for array indexes and loop bounds
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity int_multi_digit is
  port (
    val_out : out integer
  );
end entity int_multi_digit;

architecture rtl of int_multi_digit is
  constant C_MAX_ADDR : integer := 65535;
  constant C_TIMEOUT  : integer := 50000000;
  signal s_limit      : integer := 0;
begin
  s_limit <= C_MAX_ADDR;
  val_out <= s_limit;
end architecture rtl;
