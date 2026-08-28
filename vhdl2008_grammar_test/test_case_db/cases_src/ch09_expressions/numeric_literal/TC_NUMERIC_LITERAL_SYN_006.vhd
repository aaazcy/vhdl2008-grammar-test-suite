-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_NUMERIC_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: numeric_literal ::= abstract_literal | physical_literal
-- Case Type: Positive
-- Test Focus: based literal abstract_literal with an exponent: base literals of different bases such as 2#1010#E4, 16#FF#E0, 8#77#E2 combined with exponents used in shift register width computation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity num_lit_based_exp is
  port (
    base_sel : in  integer range 0 to 3;
    width    : out integer range 0 to 256
  );
end entity num_lit_based_exp;

architecture based_lit of num_lit_based_exp is
  constant C_BIN : integer := 2#1010#E4;   -- based literal: binary 10 << 4 = 160
  constant C_HEX : integer := 16#FF#E0;    -- based literal: hex 255
  constant C_OCT : integer := 8#77#E2;     -- based literal: octal 63 << 2 = 252
  constant C_ZERO : integer := 2#0#E0;     -- based literal: zero
begin
  with base_sel select
    width <= C_BIN  when 0,
             C_HEX  when 1,
             C_OCT  when 2,
             C_ZERO when 3;
end architecture based_lit;
