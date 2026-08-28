-- =============================================================
-- Case ID: TC_DECIMAL_LITERAL_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_DECIMAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.1
-- Production: decimal_literal ::= integer [ . integer ] [ exponent ]
-- Case Type: Positive
-- Test Focus: Pure integer literal(integer) as the minimal form of decimal_literal, used for counter initial values and width parameters
-- Expected Result: Compiles
-- Dependencies: None
-- =============================================================
entity dec_lit_int_only is
  port (
    cnt_init   : out integer;
    bus_width  : out integer
  );
end entity dec_lit_int_only;

architecture rtl of dec_lit_int_only is
  constant C_WIDTH : integer := 32;
  constant C_INIT  : integer := 0;
  signal s_counter : integer := 100;
begin
  cnt_init  <= C_INIT;
  bus_width <= C_WIDTH;
end architecture rtl;
